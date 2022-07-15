Class {
	#name : #Sequence,
	#superclass : #Object,
	#instVars : [
		'values'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Sequence class >> with: aSpaceShips [

	^ self new initializeWith: aSpaceShips.
]

{ #category : #asserting }
Sequence >> assertValueIsTheFirstOne: aValue [

	^ self firstValue = aValue
]

{ #category : #accessing }
Sequence >> firstValue [

	^ values first
]

{ #category : #playing }
Sequence >> initializeWith: aValues [

	values := aValues.
]

{ #category : #playing }
Sequence >> next [

	values := (values reject: [ :each | each = self firstValue ])
	              , { self firstValue }.
]

{ #category : #accessing }
Sequence >> spaceShips [

	^ values
]
