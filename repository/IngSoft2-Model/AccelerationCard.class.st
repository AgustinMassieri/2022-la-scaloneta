Class {
	#name : #AccelerationCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #visiting }
AccelerationCard >> accept: aVisitor [

	^ aVisitor visitAsAnAccelerationCardPlay
]

{ #category : #accessing }
AccelerationCard >> effect [

	^ 1
]

{ #category : #testing }
AccelerationCard >> isPermanent [
	
	^ true
]

{ #category : #creating }
AccelerationCard >> playBy: aSpaceShip targetting: spaceShips [

	^ CardPlay with: self appliedTo: spaceShips by: aSpaceShip
]
