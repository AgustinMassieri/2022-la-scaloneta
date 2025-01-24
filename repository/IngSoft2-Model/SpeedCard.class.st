Class {
	#name : #SpeedCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #visiting }
SpeedCard >> accept: aVisitor [

	^ aVisitor visitAsASpeedCardPlay
]

{ #category : #accessing }
SpeedCard >> effect [

	^ 1
]

{ #category : #testing }
SpeedCard >> isPermanent [
	
	^ true
]

{ #category : #creating }
SpeedCard >> playBy: aSpaceShip targetting: anotherSpaceShip [

	^ CardPlay with: self appliedTo: anotherSpaceShip by: aSpaceShip
]
