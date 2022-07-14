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
RepeatCard >> playBy: aSpaceShip [

	^ CardPlay with: self appliedBy: aSpaceShip.
]
