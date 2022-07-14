Class {
	#name : #CancellationCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #visiting }
CancellationCard >> accept: aVisitor [

	^ aVisitor visitAsACancellationCardPlay
]

{ #category : #creating }
CancellationCard >> playBy: aSpaceShip targetting: aCard [

	^ CardPlay with: self appliedTo: aCard by: aSpaceShip
]
