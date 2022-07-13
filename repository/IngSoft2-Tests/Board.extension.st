Extension { #name : #Board }

{ #category : #'*IngSoft2-Tests' }
Board class >> withNoEffectsOf: numberOfTiles and: parsecs finishingAfter: laps [

	| noEffect tiles |
	noEffect := NoEffect new.
	tiles := OrderedCollection new.
	numberOfTiles timesRepeat: [ tiles add: noEffect ].

	self assertValidNumberOfTiles: tiles.
	self assertValidNumberOfLaps: laps.
	self assertValidParsecs: parsecs.

	^ self new initializeWith: tiles and: parsecs finishingAfter: laps
]
