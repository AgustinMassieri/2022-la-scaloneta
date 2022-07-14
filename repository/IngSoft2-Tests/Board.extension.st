Extension { #name : #Board }

{ #category : #'*IngSoft2-Tests' }
Board class >> withNoEffectsOf: numberOfTiles and: aDistance finishingAfter: laps [

	| noEffect tiles |
	noEffect := NoEffect new.
	tiles := OrderedCollection new.
	numberOfTiles timesRepeat: [ tiles add: noEffect ].

	self assertValidNumberOfTiles: tiles.
	self assertValidNumberOfLaps: laps.
	self assertValidParsecs: aDistance.

	^ self new initializeWith: tiles and: aDistance finishingAfter: laps
]
