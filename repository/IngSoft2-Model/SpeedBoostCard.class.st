Class {
	#name : #SpeedBoostCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #visiting }
SpeedBoostCard >> accept: aVisitor [

	^ aVisitor visitAsASpeedBoostCardPlay
]

{ #category : #creating }
SpeedBoostCard >> playBy: aSpaceShip targetting: aCard [

	^ CardPlay with: self appliedTo: aCard by: aSpaceShip
]
