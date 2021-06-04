!classDefinition: #MarsRoverTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:23:26'!
test01

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: ''.
	
	self assert: (marsRover isAt: 1@2 heading: #North)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:23:31'!
test02

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: 'f'.
	
	self assert: (marsRover isAt: 1@3 heading: #North)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:23:34'!
test03

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: 'b'.
	
	self assert: (marsRover isAt: 1@1 heading: #North)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:23:38'!
test04

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: 'r'.
	
	self assert: (marsRover isAt: 1@2 heading: #East)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:23:45'!
test05

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: 'l'.
	
	self assert: (marsRover isAt: 1@2 heading: #West)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:23:50'!
test06

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	self 
		should: [ marsRover process: 'x' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: marsRover invalidCommandErrorDescription.
			self assert: (marsRover isAt: 1@2 heading: #North) ]! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:23:54'!
test07

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: 'ff'.
	
	self assert: (marsRover isAt: 1@4 heading: #North)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:23:59'!
test08

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #East.
	
	marsRover process: 'f'.
	
	self assert: (marsRover isAt: 2@2 heading: #East)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:24:06'!
test09

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #East.
	
	marsRover process: 'b'.
	
	self assert: (marsRover isAt: 0@2 heading: #East)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:24:12'!
test10

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #East.
	
	marsRover process: 'r'.
	
	self assert: (marsRover isAt: 1@2 heading: #South)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:24:20'!
test11

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #East.
	
	marsRover process: 'l'.
	
	self assert: (marsRover isAt: 1@2 heading: #North)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:24:25'!
test12

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #South.
	
	marsRover process: 'ffbr'.
	
	self assert: (marsRover isAt: 1@1 heading: #West)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:24:29'!
test13

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #South.
	
	marsRover process: 'l'.
	
	self assert: (marsRover isAt: 1@2 heading: #East)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:24:33'!
test14

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #West.
	
	marsRover process: 'ffbr'.
	
	self assert: (marsRover isAt: 0@2 heading: #North)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:24:37'!
test15

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #West.
	
	marsRover process: 'l'.
	
	self assert: (marsRover isAt: 1@2 heading: #South)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/2/2018 16:27:43'!
test16

	self 
		should: [MarsRover at: 1@2 heading: #X ]
		raise: Error
		withExceptionDo: [:anError |
			self assert: MarsRover invalidCardinalPointErrorDescription equals: anError messageText ]! !


!classDefinition: #Testxx category: 'MarsRover-WithHeading'!
TestCase subclass: #Testxx
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!Testxx methodsFor: 'as yet unclassified' stamp: 'ET 6/3/2021 20:26:25'!
test01

	|marsRover log|
	marsRover := MarsRover at: 0@0 heading: #North.
	
	log := OrderedCollection new.
	
	marsRover addPositionLog: log.
	
	marsRover process: 'f'.
	
	self assert: log size equals: 1.
	self assert: '0@1' equals: log first.
	
	! !

!Testxx methodsFor: 'as yet unclassified' stamp: 'ET 6/3/2021 20:28:12'!
test02

	|marsRover log|
	marsRover := MarsRover at: 0@0 heading: #North.
	
	log := OrderedCollection new.
	
	marsRover addPositionLog: log.
	
	marsRover process: 'b'.
	
	self assert: log size equals: 1.
	self assert: '0@-1' equals: log first.
	
	! !

!Testxx methodsFor: 'as yet unclassified' stamp: 'ET 6/3/2021 20:31:36'!
test03

	|marsRover log|
	marsRover := MarsRover at: 0@0 heading: #North.
	
	log := OrderedCollection new.
	
	marsRover addPositionLog: log.
	
	marsRover process: 'ff'.
	
	self assert: log size equals: 2.
	self assert: '0@1' equals: log first.
	self assert: '0@2' equals: log second.
	
	! !

!Testxx methodsFor: 'as yet unclassified' stamp: 'ET 6/3/2021 20:35:27'!
test04

	|marsRover log|
	marsRover := MarsRover at: 0@0 heading: #North.
	
	log := OrderedCollection new.
	
	marsRover addHeadingLog: log.
	
	marsRover process: 'r'.
	
	self assert: log size equals: 1.
	self assert: 'East' equals: log first.
	
	! !

!Testxx methodsFor: 'as yet unclassified' stamp: 'ET 6/3/2021 20:36:18'!
test05

	|marsRover log|
	marsRover := MarsRover at: 0@0 heading: #East.
	
	log := OrderedCollection new.
	
	marsRover addHeadingLog: log.
	
	marsRover process: 'r'.
	
	self assert: log size equals: 1.
	self assert: 'South' equals: log first.
	
	! !

!Testxx methodsFor: 'as yet unclassified' stamp: 'ET 6/3/2021 20:45:36'!
test06

	|marsRover log|
	marsRover := MarsRover at: 0@0 heading: #West.
	
	log := OrderedCollection new.
	
	marsRover addHeadingLog: log.
	
	marsRover process: 'r'.
	
	self assert: log size equals: 1.
	self assert: 'North' equals: log first.
	
	! !

!Testxx methodsFor: 'as yet unclassified' stamp: 'ET 6/3/2021 20:47:54'!
test07

	|marsRover log|
	marsRover := MarsRover at: 0@0 heading: #South.
	
	log := OrderedCollection new.
	
	marsRover addHeadingLog: log.
	
	marsRover process: 'r'.
	
	self assert: log size equals: 1.
	self assert: 'West' equals: log first.
	
	
	! !

!Testxx methodsFor: 'as yet unclassified' stamp: 'ET 6/3/2021 20:52:33'!
test08

	|marsRover log|
	marsRover := MarsRover at: 0@0 heading: #South.
	
	log := OrderedCollection new.
	
	marsRover addHeadingLog: log.
	
	marsRover process: 'l'.
	
	self assert: log size equals: 1.
	self assert: 'East' equals: log first.
	
	
	! !

!Testxx methodsFor: 'as yet unclassified' stamp: 'ET 6/3/2021 21:02:55'!
test09

	|marsRover window|
	marsRover := MarsRover at: 0@0 heading: #South.
	
	window := RoverWindow new.
	
	marsRover addWindow: window.

	
	self assert: window roverPositionText equals: '0@0'.
	self assert: window roverHeadingText equals: 'South'.
	
	
	! !

!Testxx methodsFor: 'as yet unclassified' stamp: 'ET 6/3/2021 21:07:25'!
test10

	|marsRover window|
	marsRover := MarsRover at: 0@0 heading: #South.
	
	window := RoverWindow new.
	
	marsRover addWindow: window.
	
	marsRover process: 'f'.

	
	self assert: window roverPositionText equals: '0@-1'.
	
	
	! !

!Testxx methodsFor: 'as yet unclassified' stamp: 'ET 6/3/2021 21:18:19'!
test11

	|marsRover window|
	marsRover := MarsRover at: 0@0 heading: #South.
	
	window := RoverWindow new.
	
	marsRover addWindow: window.
	
	marsRover process: 'r'.

	
	self assert: window roverHeadingText equals: 'West'.
	
	
	! !

!Testxx methodsFor: 'as yet unclassified' stamp: 'ET 6/3/2021 21:19:47'!
test12

	|marsRover window|
	marsRover := MarsRover at: 0@0 heading: #South.
	
	window := RoverWindow new.
	
	marsRover addWindow: window.
	
	marsRover process: 'l'.

	
	self assert: window roverHeadingText equals: 'East'.
	
	
	! !


!classDefinition: #MarsRover category: 'MarsRover-WithHeading'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head xxxx positionLog roverWindow headingLog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRover methodsFor: 'initialization' stamp: 'ET 6/3/2021 21:27:49'!
initializeAt: aPosition heading: aHeading

	position := aPosition.
	head := aHeading.
	
	xxxx := OrderedCollection new.! !


!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:48:45'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:50:26'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !


!MarsRover methodsFor: 'heading' stamp: 'ET 6/3/2021 20:49:14'!
headEast
	
	head := MarsRoverHeadingEast new.! !

!MarsRover methodsFor: 'heading' stamp: 'ET 6/3/2021 20:49:10'!
headNorth
	
	head := MarsRoverHeadingNorth new.! !

!MarsRover methodsFor: 'heading' stamp: 'ET 6/3/2021 20:49:06'!
headSouth
	
	head := MarsRoverHeadingSouth new.! !

!MarsRover methodsFor: 'heading' stamp: 'ET 6/3/2021 20:49:01'!
headWest
	
	head := MarsRoverHeadingWest new.! !

!MarsRover methodsFor: 'heading' stamp: 'ET 6/3/2021 21:31:17'!
rotateLeft
	
	head rotateLeft: self.
	headingLog ifNotNil: [headingLog add: head class cardinalPoint asString].
	roverWindow ifNotNil: [roverWindow updateNewHeading: head class cardinalPoint asString].
	xxxx do: [:zzzz | zzzz updateNewHeading: position].! !

!MarsRover methodsFor: 'heading' stamp: 'ET 6/3/2021 21:31:17'!
rotateRight
	
	head rotateRight: self.
	headingLog ifNotNil: [headingLog add: head class cardinalPoint asString].
	roverWindow ifNotNil: [roverWindow updateNewHeading: head class cardinalPoint asString].
	xxxx do: [:zzzz | zzzz updateNewHeading: position].! !


!MarsRover methodsFor: 'testing' stamp: 'HAW 8/22/2019 12:00:30'!
isAt: aPosition heading: aCardinalPoint

	^position = aPosition and: [ head isHeading: aCardinalPoint ]! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:51'!
isBackwardCommand: aCommand

	^aCommand = $b! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:19'!
isForwardCommand: aCommand

	^aCommand = $f ! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:51'!
isRotateLeftCommand: aCommand

	^aCommand = $l! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:21'!
isRotateRightCommand: aCommand

	^aCommand = $r! !


!MarsRover methodsFor: 'moving' stamp: 'ET 6/3/2021 21:31:35'!
moveBackward
	
	head moveBackward: self.
	positionLog ifNotNil: [positionLog add: position asString].
	roverWindow ifNotNil: [roverWindow updateNewPosition: position asString].
	xxxx do: [:zzzz | zzzz updateNewPosition: position].! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:15:01'!
moveEast
	
	position := position + (1@0)! !

!MarsRover methodsFor: 'moving' stamp: 'ET 6/3/2021 21:31:35'!
moveForward
	
	head moveForward: self.
	positionLog ifNotNil: [positionLog add: position asString].
	roverWindow  ifNotNil: [roverWindow updateNewPosition: position asString].
	xxxx do: [:zzzz | zzzz updateNewPosition: position].! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:13:12'!
moveNorth
	
	position := position + (0@1)! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:13:34'!
moveSouth
	
	position := position + (0@-1)! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:15:32'!
moveWest
	
	position := position + (-1@0)! !


!MarsRover methodsFor: 'command processing' stamp: 'ET 6/3/2021 20:34:14'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [:aCommand | self processCommand: aCommand ].
	
	
! !

!MarsRover methodsFor: 'command processing' stamp: 'HAW 8/22/2019 12:08:50'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ self moveForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ self moveBackward ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ self rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ self rotateLeft ].

	self signalInvalidCommand.! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'ET 6/3/2021 20:36:58'!
addHeadingLog: anOrderedCollection 

	headingLog := anOrderedCollection.
! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ET 6/3/2021 20:29:14'!
addPositionLog: anOrderedCollection 
	
	positionLog := anOrderedCollection.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ET 6/3/2021 21:31:35'!
addWindow: aRoverWindow
	roverWindow := aRoverWindow.
	roverWindow updateNewPosition: position asString.
	roverWindow updateNewHeading: head class cardinalPoint asString.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ET 6/3/2021 21:28:17'!
addyyyy: zzzz
	
	xxxx add: zzzz.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-WithHeading'!
MarsRover class
	instanceVariableNames: 'headings'!

!MarsRover class methodsFor: 'instance creation' stamp: 'HAW 8/22/2019 12:01:48'!
at: aPosition heading: aCardinalPoint
	
	^self new initializeAt: aPosition heading: (MarsRoverHeading heading: aCardinalPoint)! !

!MarsRover class methodsFor: 'instance creation' stamp: 'HAW 7/2/2018 16:26:14'!
invalidCardinalPointErrorDescription
	
	^'Invalid cardinal point'! !


!classDefinition: #MarsRoverHeading category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverHeading
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 8/22/2019 12:06:17'!
rotateLeft: aMarsRover

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 8/22/2019 12:08:23'!
rotateRight: aMarsRover

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'testing' stamp: 'HAW 7/2/2018 19:07:42'!
isHeading: aCardinalPoint

	^self class isFor: aCardinalPoint! !


!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:05:20'!
moveBackward: aMarsRover

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:05:54'!
moveForward: aMarsRover

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeading class' category: 'MarsRover-WithHeading'!
MarsRoverHeading class
	instanceVariableNames: ''!

!MarsRoverHeading class methodsFor: 'cardinal point' stamp: 'HAW 7/2/2018 19:07:01'!
cardinalPoint

	self subclassResponsibility ! !


!MarsRoverHeading class methodsFor: 'instance creation' stamp: 'HAW 8/22/2019 12:02:00'!
heading: aCardinalPoint

	^self subclasses 
		detect: [ :aMarsRoverPositionClass | aMarsRoverPositionClass isFor: aCardinalPoint ]
		ifFound: [ :aMarsRoverPositionClass | aMarsRoverPositionClass new ]
		ifNone: [ self error: MarsRover invalidCardinalPointErrorDescription ]! !


!MarsRoverHeading class methodsFor: 'testing' stamp: 'HAW 7/2/2018 17:01:33'!
isFor: aCardinalPoint

	^self cardinalPoint = aCardinalPoint ! !


!classDefinition: #MarsRoverHeadingEast category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:09:19'!
moveBackward: aMarsRover
	
	^aMarsRover moveWest! !

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:09:28'!
moveForward: aMarsRover
	
	^aMarsRover moveEast! !


!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 8/22/2019 12:09:42'!
rotateLeft: aMarsRover
	
	^aMarsRover headNorth! !

!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 8/22/2019 12:09:54'!
rotateRight: aMarsRover
	
	^aMarsRover headSouth! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadingEast class' category: 'MarsRover-WithHeading'!
MarsRoverHeadingEast class
	instanceVariableNames: ''!

!MarsRoverHeadingEast class methodsFor: 'as yet unclassified' stamp: 'HAW 7/2/2018 17:01:53'!
cardinalPoint

	^#East! !


!classDefinition: #MarsRoverHeadingNorth category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:10:12'!
moveBackward: aMarsRover
	
	^aMarsRover moveSouth! !

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:10:23'!
moveForward: aMarsRover
	
	^aMarsRover moveNorth! !


!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 8/22/2019 12:10:40'!
rotateLeft: aMarsRover
	
	^aMarsRover headWest! !

!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 8/22/2019 12:10:51'!
rotateRight: aMarsRover
	
	^aMarsRover headEast! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadingNorth class' category: 'MarsRover-WithHeading'!
MarsRoverHeadingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadingNorth class methodsFor: 'as yet unclassified' stamp: 'HAW 7/2/2018 17:03:11'!
cardinalPoint

	^#North! !


!classDefinition: #MarsRoverHeadingSouth category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:11:15'!
moveBackward: aMarsRover
	
	^aMarsRover moveNorth! !

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:11:25'!
moveForward: aMarsRover
	
	^aMarsRover moveSouth! !


!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 8/22/2019 12:11:55'!
rotateLeft: aMarsRover
	
	^aMarsRover headEast! !

!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 8/22/2019 12:11:50'!
rotateRight: aMarsRover
	
	^aMarsRover headWest! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadingSouth class' category: 'MarsRover-WithHeading'!
MarsRoverHeadingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadingSouth class methodsFor: 'as yet unclassified' stamp: 'HAW 7/2/2018 17:03:17'!
cardinalPoint

	^#South! !


!classDefinition: #MarsRoverHeadingWest category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:12:07'!
moveBackward: aMarsRover

	^aMarsRover moveEast! !

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:12:15'!
moveForward: aMarsRover
	
	^aMarsRover moveWest! !


!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 8/22/2019 12:12:26'!
rotateLeft: aMarsRover
	
	^aMarsRover headSouth! !

!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 8/22/2019 12:12:41'!
rotateRight: aMarsRover
	
	^aMarsRover headNorth! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadingWest class' category: 'MarsRover-WithHeading'!
MarsRoverHeadingWest class
	instanceVariableNames: ''!

!MarsRoverHeadingWest class methodsFor: 'as yet unclassified' stamp: 'HAW 7/2/2018 17:03:23'!
cardinalPoint

	^#West! !


!classDefinition: #RoverWindow category: 'MarsRover-WithHeading'!
Object subclass: #RoverWindow
	instanceVariableNames: 'position heading'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!RoverWindow methodsFor: 'as yet unclassified' stamp: 'ET 6/3/2021 21:19:29'!
roverHeadingText
	^heading.! !

!RoverWindow methodsFor: 'as yet unclassified' stamp: 'ET 6/3/2021 21:14:00'!
roverPositionText
	^position.! !

!RoverWindow methodsFor: 'as yet unclassified' stamp: 'ET 6/3/2021 21:31:17'!
updateNewHeading: aCardinalPoint
	heading := aCardinalPoint.! !

!RoverWindow methodsFor: 'as yet unclassified' stamp: 'ET 6/3/2021 21:31:35'!
updateNewPosition: aPosicionPoint 
	position := aPosicionPoint.! !
