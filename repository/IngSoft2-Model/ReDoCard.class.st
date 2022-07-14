Class {
	#name : #ReDoCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #visiting }
ReDoCard >> accept: aVisitor [

	^ aVisitor visitAsAReDoCardPlay
]

{ #category : #creating }
ReDoCard >> playBy: aSpaceShip targetting: aCard [

	^ CardPlay with: self appliedTo: aCard by: aSpaceShip
]
