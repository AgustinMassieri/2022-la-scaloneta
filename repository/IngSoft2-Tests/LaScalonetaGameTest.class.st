Class {
	#name : #LaScalonetaGameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
LaScalonetaGameTest >> should: block raise: expectedErrorClass withMessage: expectedErrorMessage [

	self
		should: block
		raise: expectedErrorClass
		whoseDescriptionIncludes: expectedErrorMessage
		description: 'Test did not fail as expected'
]

{ #category : #running }
LaScalonetaGameTest >> testAfterLastPlayersTurnItsPlayer1TurnAgain [
	| aGame aTile1 aTile2 aTile3 aBoard aDie1 aDiceCup |

	aTile1 := Tile new.
	aTile2 := Tile new.
	aTile3 := Tile new.
	aBoard := Board withTiles: { aTile1. aTile2. aTile3 }.
	
	aDie1 := LoadedDie with: 1.
	aDiceCup := DiceCup withAll: { aDie1 }.

	aGame := LaScalonetaGame 
				withBoard: aBoard
				diceCollection: aDiceCup
				players: ( {'Player1'. 'Player2'. 'LastPlayer'} ).
	
	aGame rollDiceCupFor: 'Player1'.
	aGame rollDiceCupFor: 'Player2'.
	aGame rollDiceCupFor: 'LastPlayer'.
	
	self assert: ( aGame positionOf: 'Player1' ) tileNumber equals: 2.
	self assert: ( aGame positionOf: 'Player2' ) tileNumber equals: 2.
	self assert: ( aGame positionOf: 'LastPlayer' ) tileNumber equals: 2.
	self assert: ( aGame playerTurn hasEqualElements: 'Player1').
	self assert: ( aGame itsMyTurn: 'Player1' )
]

{ #category : #running }
LaScalonetaGameTest >> testAfterPlayer1ItsNotPlayer3Turn [

	| aGame aTile1 aTile2 aTile3 aBoard aDie1 aDiceCup |

	aTile1 := Tile new.
	aTile2 := Tile new.
	aTile3 := Tile new.
	aBoard := Board withTiles: { aTile1. aTile2. aTile3 }.
	
	aDie1 := LoadedDie with: 1.
	aDiceCup := DiceCup withAll: { aDie1 }.

	aGame := LaScalonetaGame 
				withBoard: aBoard
				diceCollection: aDiceCup
				players: ( {'Player1'. 'Player2'. 'Player3'} ).
	
	aGame rollDiceCupFor: 'Player1'.
	
	self assert: ( aGame positionOf: 'Player1' ) tileNumber equals: 2.
	self deny: ( aGame playerTurn hasEqualElements: 'Player3').
	self assert: ( aGame itsMyTurn: 'Player2' )
]

{ #category : #running }
LaScalonetaGameTest >> testAfterPlayer1ItsPlayer2Turn [
	| aGame aTile1 aTile2 aTile3 aBoard aDie1 aDiceCup |

	aTile1 := Tile new.
	aTile2 := Tile new.
	aTile3 := Tile new.
	aBoard := Board withTiles: { aTile1. aTile2. aTile3 }.
	
	aDie1 := LoadedDie with: 1.
	aDiceCup := DiceCup withAll: { aDie1 }.

	aGame := LaScalonetaGame 
				withBoard: aBoard
				diceCollection: aDiceCup
				players: ( {'Player1'. 'Player2'. 'Player3'} ).
	
	aGame rollDiceCupFor: 'Player1'.
	
	self assert: ( aGame positionOf: 'Player1' ) tileNumber equals: 2.
	self assert: ( aGame playerTurn hasEqualElements: 'Player2').
	self deny: ( aGame itsMyTurn: 'Player3' )
]

{ #category : #running }
LaScalonetaGameTest >> testFinalPositionOfPlayersCorrespondsWithTheActualFinalPositions [

	| aGame aTile1 aTile2 aTile3 aBoard aDie1 aDiceCup|
	
	aTile1 := Tile new.
	aTile2 := Tile new.
	aTile3 := Tile new.
	
	aBoard := Board withTiles: { aTile1. aTile2. aTile3. }.
	
	aDie1 := LoadedDie with: 1.
	aDiceCup := DiceCup withAll: { aDie1 }.
	
	aGame := LaScalonetaGame 
				withBoard: aBoard
				diceCollection: aDiceCup
				players: ( {'Jorge'. 'Julian'. 'Chango'} ).
	
	aGame rollDiceCupFor: 'Jorge'.
	aGame rollDiceCupFor: 'Julian'.
	aGame rollDiceCupFor: 'Chango'.
	aGame rollDiceCupFor: 'Jorge'.

	
	self assert: (aGame hasEnded).
	self assert: ( aGame positionOf: 'Jorge' ) tileNumber equals: 3.
	self assert: ( aGame positionOf: 'Julian' ) tileNumber equals: 2.
	self assert: ( aGame positionOf: 'Chango' ) tileNumber equals: 2.
]

{ #category : #tests }
LaScalonetaGameTest >> testGameHasEndedAsOnePlayerReachedTheEnd [

	| aGame aTile1 aTile2 aTile3 aBoard aDie1 aDiceCup |

	aTile1 := Tile new.
	aTile2 := Tile new.
	aTile3 := Tile new.
	aBoard := Board withTiles: { aTile1. aTile2. aTile3 }.
	
	aDie1 := LoadedDie with: 1.
	aDiceCup := DiceCup withAll: { aDie1 }.

	aGame := LaScalonetaGame 
				withBoard: aBoard
				diceCollection: aDiceCup
				players: ( {'Jorge'. 'Julian'} ).
				
	self deny: (aGame hasEnded).

			
	aGame rollDiceCupFor: 'Jorge'.
	aGame rollDiceCupFor: 'Julian'. 	
		
	self deny: (aGame hasEnded).

	
	aGame rollDiceCupFor: 'Jorge'.
	
	self assert: (aGame hasEnded).
	
	

]

{ #category : #tests }
LaScalonetaGameTest >> testGameHasNotEndedAsNoPlayerReachedTheEnd [

	| aGame aTile1 aTile2 aTile3 aBoard aDie1 aDiceCup |

	aTile1 := Tile new.
	aTile2 := Tile new.
	aTile3 := Tile new.
	aBoard := Board withTiles: { aTile1. aTile2. aTile3 }.
	
	aDie1 := LoadedDie with: 1.
	aDiceCup := DiceCup withAll: { aDie1 }.

	aGame := LaScalonetaGame 
				withBoard: aBoard
				diceCollection: aDiceCup
				players: ( {'Jorge'. 'Julian'} ).
				
	self deny: (aGame hasEnded).
	
	self assert: ( aGame positionOf: 'Jorge' ) tileNumber equals: 1.	
	self assert: ( aGame positionOf: 'Julian' ) tileNumber equals: 1.	
			
	aGame rollDiceCupFor: 'Jorge'. 	
		
	self assert: ( aGame positionOf: 'Jorge' ) tileNumber equals: 2.
	
	self deny: (aGame hasEnded).
	

]

{ #category : #tests }
LaScalonetaGameTest >> testJorgeAndJulianArePlayersOfLaScalonetaGame [

	| aGame aTile1 aTile2 aTile3 aBoard aDie1 aDiceCup |

	aTile1 := Tile new.
	aTile2 := Tile new.
	aTile3 := Tile new.
	aBoard := Board withTiles: { aTile1. aTile2. aTile3 }.
	
	aDie1 := LoadedDie with: 2.
	aDiceCup := DiceCup withAll: { aDie1 }.

	aGame := LaScalonetaGame 
				withBoard: aBoard
				diceCollection: aDiceCup
				players: ( {'Jorge'. 'Julian'} ).
	
	self assert: (aGame players hasEqualElements: {'Jorge'. 'Julian'})
]

{ #category : #tests }
LaScalonetaGameTest >> testJorgeIsNotTheWinnerOfLaScalonetaGameWhenJulianReachesTheEndFirst [

	 |aGame aTile1 aTile2 aTile3 aTile4 aBoard aDie1 aDiceCup| 
	
	 aTile1 := Tile new.
    aTile2 := Tile new.
    aTile3 := Tile new.
    aTile4 := Tile new.
    aBoard := Board withTiles: { aTile1. aTile2. aTile3. aTile4 }.

    aDie1 := LoadedDie with: 3.
    aDiceCup := DiceCup withAll: { aDie1 }.

    aGame := LaScalonetaGame 
                withBoard: aBoard
                diceCollection: aDiceCup
                players: ( {'Julian'. 'Jorge'} ).

	 aGame rollDiceCupFor: 'Julian'.
	
	 self deny: ((aGame winner) includes:'Jorge')
	
	
	
	
	
	
	

]

{ #category : #tests }
LaScalonetaGameTest >> testJorgeWinsLaScalonetaGameWhenJorgeReachesTheEndFirst [

	 |aGame aTile1 aTile2 aTile3 aTile4 aBoard aDie1 aDiceCup| 
	
	 aTile1 := Tile new.
    aTile2 := Tile new.
    aTile3 := Tile new.
    aTile4 := Tile new.
    aBoard := Board withTiles: { aTile1. aTile2. aTile3. aTile4 }.

    aDie1 := LoadedDie with: 3.
    aDiceCup := DiceCup withAll: { aDie1 }.

    aGame := LaScalonetaGame 
                withBoard: aBoard
                diceCollection: aDiceCup
                players: ( {'Jorge'. 'Julian'} ).
	 aGame rollDiceCupFor: 'Jorge'.
	
	 self assert: ((aGame winner) includes:'Jorge')
	
	
	
	
	
	
	

]

{ #category : #tests }
LaScalonetaGameTest >> testJulianCanNotRollTheDiceWhenIsNotHisTurn [

	| aGame aTile1 aTile2 aTile3 aBoard aDie1 aDiceCup |

	aTile1 := Tile new.
	aTile2 := Tile new.
	aTile3 := Tile new.
	aBoard := Board withTiles: { aTile1. aTile2. aTile3 }.
	
	aDie1 := LoadedDie with: 2.
	aDiceCup := DiceCup withAll: { aDie1 }.

	aGame := LaScalonetaGame 
				withBoard: aBoard
				diceCollection: aDiceCup
				players: ( {'Jorge'. 'Julian'} ).
				
	self
		should: [aGame rollDiceCupFor: 'Julian']
		raise: Error
		withMessage: 'Its not your turn!'
]

{ #category : #tests }
LaScalonetaGameTest >> testJulianCanRollTheDiceAfterJorge [

	| aGame aTile1 aTile2 aTile3 aBoard aDie1 aDiceCup |

	aTile1 := Tile new.
	aTile2 := Tile new.
	aTile3 := Tile new.
	aBoard := Board withTiles: { aTile1. aTile2. aTile3 }.
	
	aDie1 := LoadedDie with: 2.
	aDiceCup := DiceCup withAll: { aDie1 }.

	aGame := LaScalonetaGame 
				withBoard: aBoard
				diceCollection: aDiceCup
				players: ( {'Jorge'. 'Julian'} ).
	
	aGame rollDiceCupFor: 'Jorge'.
	
	self assert: ( aGame playerTurn hasEqualElements: 'Julian')
]

{ #category : #tests }
LaScalonetaGameTest >> testLaScalonetaGameMustHaveAtLeastOnePlayer [

	| aTile1 aTile2 aTile3 aBoard aDie1 aDiceCup |

	aTile1 := Tile new.
	aTile2 := Tile new.
	aTile3 := Tile new.
	aBoard := Board withTiles: { aTile1. aTile2. aTile3 }.
	
	aDie1 := LoadedDie with: 1.
	aDiceCup := DiceCup withAll: { aDie1 }.

	self
		should: [ LaScalonetaGame
				withBoard: aBoard
				diceCollection: aDiceCup
				players: {}
			]
		raise: Error
		withMessage: 'La Scaloneta Game must have at least one player'

]

{ #category : #running }
LaScalonetaGameTest >> testPlayer1StartsTheGame [
	| aGame aTile1 aTile2 aTile3 aBoard aDie1 aDiceCup |

	aTile1 := Tile new.
	aTile2 := Tile new.
	aTile3 := Tile new.
	aBoard := Board withTiles: { aTile1. aTile2. aTile3 }.
	
	aDie1 := LoadedDie with: 2.
	aDiceCup := DiceCup withAll: { aDie1 }.

	aGame := LaScalonetaGame 
				withBoard: aBoard
				diceCollection: aDiceCup
				players: ( {'Player1'. 'Player2'. 'Player3'} ).
	
	self assert: ( aGame playerTurn hasEqualElements: 'Player1')
]

{ #category : #tests }
LaScalonetaGameTest >> testPlayerMovesThreeTilesFowardWhenRollingResultEqualsToThree [

	| aGame aTile1 aTile2 aTile3 aTile4 aBoard aDie1 aDiceCup |

	aTile1 := Tile new.
	aTile2 := Tile new.
	aTile3 := Tile new.
	aTile4 := Tile new.
	aBoard := Board withTiles: { aTile1. aTile2. aTile3. aTile4 }.
	
	aDie1 := LoadedDie with: 3.
	aDiceCup := DiceCup withAll: { aDie1 }.

	aGame := LaScalonetaGame 
				withBoard: aBoard
				diceCollection: aDiceCup
				players: ( {'Jorge'. 'Julian'} ).
				
	aGame rollDiceCupFor: 'Jorge'. 	

	self assert: ( aGame positionOf: 'Jorge' ) tileNumber equals: 4.	
				
]

{ #category : #tests }
LaScalonetaGameTest >> testPlayerStartsAtTileNumberOne [

	| aGame aTile1 aTile2 aTile3 aBoard aDie1 aDiceCup |

	aTile1 := Tile new.
	aTile2 := Tile new.
	aTile3 := Tile new.
	aBoard := Board withTiles: { aTile1. aTile2. aTile3 }.
	
	aDie1 := LoadedDie with: 1.
	aDiceCup := DiceCup withAll: { aDie1 }.

	aGame := LaScalonetaGame 
				withBoard: aBoard
				diceCollection: aDiceCup
				players: ( {'Jorge'. 'Julian'} ).

	self assert: ( aGame positionOf: 'Jorge' ) tileNumber equals: 1.
	self assert: ( aGame positionOf: 'Julian' ) tileNumber equals: 1
]

{ #category : #tests }
LaScalonetaGameTest >> testPlayingAfterWinningIsNotAllowed [

	| aGame aTile1 aTile2 aTile3 aBoard aDie1 aDiceCup |

	aTile1 := Tile new.
	aTile2 := Tile new.
	aTile3 := Tile new.
	aBoard := Board withTiles: { aTile1. aTile2. aTile3 }.
	
	aDie1 := LoadedDie with: 2.
	aDiceCup := DiceCup withAll: { aDie1 }.

	aGame := LaScalonetaGame 
				withBoard: aBoard
				diceCollection: aDiceCup
				players: ( {'Jorge'. 'Julian'} ).
				
	self deny: (aGame hasEnded).
	self assert: ( aGame positionOf: 'Jorge' ) tileNumber equals: 1.	
	self assert: ( aGame positionOf: 'Julian' ) tileNumber equals: 1.	
			
	aGame rollDiceCupFor: 'Jorge'. 	
		
	self assert: (aGame hasEnded).
	self assert: ( aGame positionOf: 'Jorge' ) tileNumber equals: 3.	
	self assert: ( aGame positionOf: 'Julian' ) tileNumber equals: 1.
	
	self
		should: [aGame rollDiceCupFor: 'Jorge']
		raise: Error
		withMessage: 'La Scaloneta Game has already ended!'
]