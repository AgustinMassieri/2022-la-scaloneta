Class {
	#name : #OverloadCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #visiting }
OverloadCard >> accept: aVisitor [

	^ aVisitor visitAsAnOverloadCardPlay
]

{ #category : #accessing }
OverloadCard >> effect [

	^ -2
]

{ #category : #testing }
OverloadCard >> isPermanent [
	
	^ true
]

{ #category : #creating }
OverloadCard >> playBy: aSpaceShip targetting: anotherSpaceShip [

	^ CardPlay with: self appliedTo: anotherSpaceShip by: aSpaceShip
]
