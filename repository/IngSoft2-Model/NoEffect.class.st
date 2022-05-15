Class {
	#name : #NoEffect,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #private }
NoEffect >> moveSpaceShip: aSpaceShips for: aGame [
		
		^ aGame movePlayer: aSpaceShips first withRollingResult: 0
]