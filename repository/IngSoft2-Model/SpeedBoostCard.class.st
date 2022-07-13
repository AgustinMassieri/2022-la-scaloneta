Class {
	#name : #SpeedBoostCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #visiting }
SpeedBoostCard >> accept: aVisitor [

	^ aVisitor visitAsASpeedBoostCardPlay
]
