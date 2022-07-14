Class {
	#name : #Pool,
	#superclass : #Object,
	#instVars : [
		'poolCollection'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Pool class >> assertSumOfProbabilitiesEqualsToOne: probabilisticEventList [

	((probabilisticEventList inject: 0 into: [:inicial :probabilisticEvent | inicial + probabilisticEvent probability]) = 1) ifFalse: [Error signal: 'The sum of the probabilities must be equal to 1!'].
]

{ #category : #initialize }
Pool class >> with: probabilisticEventList [

	self assertSumOfProbabilitiesEqualsToOne: probabilisticEventList.

	^ self new
		  initializeWith: probabilisticEventList 
]

{ #category : #initialization }
Pool >> initializeWith: probabilityEventList [

	poolCollection := OrderedCollection new.

	probabilityEventList do: [ :probabilisticEvent | 
		(probabilisticEvent probability * 100) asInteger timesRepeat: [ 
			poolCollection add: probabilisticEvent event ] ]
]

{ #category : #accessing }
Pool >> randomChoice [

	^ poolCollection atRandom
]

{ #category : #accessing }
Pool >> randomCollectionWith: length [

	| randomCollection |
	randomCollection := OrderedCollection new.

	length timesRepeat: [ randomCollection add: self randomChoice ].

	^ randomCollection
]
