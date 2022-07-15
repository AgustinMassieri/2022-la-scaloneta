Class {
	#name : #RepeatCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #visiting }
RepeatCard >> accept: aVisitor [

	^ aVisitor visitAsARepeatCardPlay
]

{ #category : #creating }
RepeatCard >> playBy: aSpaceShip targetting: spaceShips [

	^ CardPlay with: self appliedTo: spaceShips by: aSpaceShip
]
