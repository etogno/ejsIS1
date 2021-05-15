!classDefinition: #MarsRoverTests category: 'MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 17:36:53'!
test01

	| aMarsRover |
	aMarsRover:=MarsRover at:0@0 facing: North new.
	
	aMarsRover processPackage: ''.
	
	self assert: (aMarsRover isAt: 0@0 facing: North).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 16:46:27'!
test02

	| aMarsRover |
	aMarsRover:=MarsRover at:0@0 facing: North new.
	
	aMarsRover processPackage: ''.
	
	self deny: (aMarsRover isAt: 1@0 facing: North).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 16:46:34'!
test03

	| aMarsRover |
	aMarsRover:=MarsRover at:0@0 facing: South new.
	
	aMarsRover processPackage: ''.
	
	self deny: (aMarsRover isAt: 0@0 facing: North).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 16:46:40'!
test04

	| aMarsRover |
	aMarsRover:=MarsRover at:0@0 facing: North new.
	
	aMarsRover processPackage: 'f'.
	
	self assert: (aMarsRover isAt: 0@1 facing: North).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 16:46:48'!
test05

	| aMarsRover |
	aMarsRover:=MarsRover at:1@1 facing: South new.
	
	aMarsRover processPackage: 'f'.
	
	self assert: (aMarsRover isAt: 1@0 facing: South).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 16:46:57'!
test06

	| aMarsRover |
	aMarsRover:=MarsRover at:1@1 facing: East new.
	
	aMarsRover processPackage: 'f'.
	
	self assert: (aMarsRover isAt: 2@1 facing: East).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 16:47:03'!
test07

	| aMarsRover |
	aMarsRover:=MarsRover at:1@1 facing: West new.
	
	aMarsRover processPackage: 'f'.
	
	self assert: (aMarsRover isAt: 0@1 facing: West).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 16:47:11'!
test08

	| aMarsRover |
	aMarsRover:=MarsRover at:0@0 facing: North new.
	
	aMarsRover processPackage: 'b'.
	
	self assert: (aMarsRover isAt: 0@-1 facing: North).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 16:47:18'!
test09

	| aMarsRover |
	aMarsRover:=MarsRover at:0@0 facing:  South new.
	
	aMarsRover processPackage: 'b'.
	
	self assert: (aMarsRover isAt: 0@1 facing: South).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 16:47:24'!
test10

	| aMarsRover |
	aMarsRover:=MarsRover at:0@0 facing: East new.
	
	aMarsRover processPackage: 'b'.
	
	self assert: (aMarsRover isAt: -1@0 facing: East).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 16:47:36'!
test11

	| aMarsRover |
	aMarsRover:=MarsRover at:0@0 facing: West new.
	
	aMarsRover processPackage: 'b'.
	
	self assert: (aMarsRover isAt: 1@0 facing: West).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 16:47:43'!
test12

	| aMarsRover |
	aMarsRover:=MarsRover at:0@0 facing: North new.
	
	aMarsRover processPackage: 'l'.
	
	self assert: (aMarsRover isAt: 0@0 facing: West).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 16:47:50'!
test13

	| aMarsRover |
	aMarsRover:=MarsRover at:0@0 facing: West new.
	
	aMarsRover processPackage: 'l'.
	
	self assert: (aMarsRover isAt: 0@0 facing: South).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 16:48:23'!
test14

	| aMarsRover |
	aMarsRover:=MarsRover at:0@0 facing: South new.
	
	aMarsRover processPackage: 'l'.
	
	self assert: (aMarsRover isAt: 0@0 facing: East).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 16:48:36'!
test15

	| aMarsRover |
	aMarsRover:=MarsRover at:0@0 facing: East new.
	
	aMarsRover processPackage: 'l'.
	
	self assert: (aMarsRover isAt: 0@0 facing: North).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 16:48:50'!
test16

	| aMarsRover |
	aMarsRover:=MarsRover at:0@0 facing: North new.
	
	aMarsRover processPackage: 'r'.
	
	self assert: (aMarsRover isAt: 0@0 facing: East).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 16:48:57'!
test17

	| aMarsRover |
	aMarsRover:=MarsRover at:0@0 facing: East new.
	
	aMarsRover processPackage: 'r'.
	
	self assert: (aMarsRover isAt: 0@0 facing: South).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 16:49:02'!
test18

	| aMarsRover |
	aMarsRover:=MarsRover at:0@0 facing: South new.
	
	aMarsRover processPackage: 'r'.
	
	self assert: (aMarsRover isAt: 0@0 facing: West).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 16:49:08'!
test19

	| aMarsRover |
	aMarsRover:=MarsRover at:0@0 facing: West new.
	
	aMarsRover processPackage: 'r'.
	
	self assert: (aMarsRover isAt: 0@0 facing: North).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 16:49:13'!
test20

	| aMarsRover |
	aMarsRover:=MarsRover at:0@0 facing: North new.
	
	aMarsRover processPackage: 'ff'.
	
	self assert: (aMarsRover isAt: 0@2 facing: North).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 16:49:18'!
test21

	| aMarsRover |
	aMarsRover:=MarsRover at:0@0 facing: North new.
	
	aMarsRover processPackage: 'fb'.
	
	self assert: (aMarsRover isAt: 0@0 facing: North).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 16:49:23'!
test22

	| aMarsRover |
	aMarsRover:=MarsRover at:0@0 facing: North new.
	
	aMarsRover processPackage: 'rf'.
	
	self assert: (aMarsRover isAt: 1@0 facing: East).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 16:49:27'!
test24

	| aMarsRover |
	aMarsRover:=MarsRover at:0@0 facing: North new.
	
	aMarsRover processPackage: 'rflb'.
	
	self assert: (aMarsRover isAt: 1@-1 facing: North).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JA 5/15/2021 16:49:32'!
test25

	| aMarsRover |
	aMarsRover:=MarsRover at:0@0 facing: North new.
	
	aMarsRover processPackage: 'ffxff'.
	
	self assert: (aMarsRover isAt: 0@2 facing: North).! !


!classDefinition: #CardinalPoint category: 'MarsRover'!
Object subclass: #CardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!CardinalPoint methodsFor: 'move offset' stamp: 'JA 5/15/2021 15:56:40'!
backwardOffset
	self subclassResponsibility ! !

!CardinalPoint methodsFor: 'move offset' stamp: 'JA 5/15/2021 15:53:16'!
forwardOffset
	self subclassResponsibility ! !


!CardinalPoint methodsFor: 'rotation' stamp: 'JA 5/15/2021 15:52:58'!
turnLeft
	self subclassResponsibility ! !

!CardinalPoint methodsFor: 'rotation' stamp: 'JA 5/15/2021 15:53:05'!
turnRight
	self subclassResponsibility ! !


!classDefinition: #East category: 'MarsRover'!
CardinalPoint subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!East methodsFor: 'rotation' stamp: 'JA 5/15/2021 15:57:30'!
turnLeft
	^ North new! !

!East methodsFor: 'rotation' stamp: 'JA 5/15/2021 15:57:50'!
turnRight
	^ South new! !


!East methodsFor: 'move offset' stamp: 'JA 5/15/2021 16:05:06'!
backwardOffset
	^ (-1@0)! !

!East methodsFor: 'move offset' stamp: 'JA 5/15/2021 15:58:29'!
forwardOffset
	^ (1@0)! !


!classDefinition: #North category: 'MarsRover'!
CardinalPoint subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'rotation' stamp: 'JA 5/15/2021 16:06:08'!
turnLeft
	^ West new! !

!North methodsFor: 'rotation' stamp: 'JA 5/15/2021 16:06:40'!
turnRight
	^ East new! !


!North methodsFor: 'move offset' stamp: 'JA 5/15/2021 16:07:38'!
backwardOffset
	^(0@-1)! !

!North methodsFor: 'move offset' stamp: 'JA 5/15/2021 16:07:26'!
forwardOffset
	^(0@1)! !


!classDefinition: #South category: 'MarsRover'!
CardinalPoint subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'rotation' stamp: 'JA 5/15/2021 16:09:16'!
turnLeft
	^ East new! !

!South methodsFor: 'rotation' stamp: 'JA 5/15/2021 16:09:07'!
turnRight
	^ West new! !


!South methodsFor: 'move offset' stamp: 'JA 5/15/2021 16:10:09'!
backwardOffset
	^ (0@1)! !

!South methodsFor: 'move offset' stamp: 'JA 5/15/2021 16:10:01'!
forwardOffset
	^ (0@-1)! !


!classDefinition: #West category: 'MarsRover'!
CardinalPoint subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'move offset' stamp: 'JA 5/15/2021 16:13:27'!
backwardOffset
	^(1@0)! !

!West methodsFor: 'move offset' stamp: 'JA 5/15/2021 16:13:46'!
forwardOffset
	^(-1@0)! !


!West methodsFor: 'rotation' stamp: 'JA 5/15/2021 16:11:04'!
turnLeft
	^ South new! !

!West methodsFor: 'rotation' stamp: 'JA 5/15/2021 16:12:03'!
turnRight
	^ North new! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'point cardinalPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'JA 5/13/2021 22:04:27'!
initializeAt: aPoint facing: aCardinalPoint 
	point := aPoint.
	cardinalPoint := aCardinalPoint.! !


!MarsRover methodsFor: 'accessing' stamp: 'JA 5/15/2021 17:14:33'!
isAt: aPoint facing: aCardinalPointType 
	^ aPoint = point and: (cardinalPoint isKindOf: aCardinalPointType )! !


!MarsRover methodsFor: 'private' stamp: 'JA 5/15/2021 16:55:45'!
changeOrientationUsing: anOrientationCommand

	anOrientationCommand = $l ifTrue:[cardinalPoint := cardinalPoint turnLeft].
	anOrientationCommand = $r ifTrue:[cardinalPoint := cardinalPoint turnRight].! !

!MarsRover methodsFor: 'private' stamp: 'JA 5/15/2021 17:00:48'!
changePositionUsing: aPotentialMoveCommand
	
	point := point + (self offsetFromMoveCommand: aPotentialMoveCommand).! !

!MarsRover methodsFor: 'private' stamp: 'JA 5/15/2021 16:55:17'!
offsetFromMoveCommand: aMoveCommand

	aMoveCommand = $f ifTrue: [^ cardinalPoint forwardOffset ].
	aMoveCommand = $b ifTrue: [^ cardinalPoint backwardOffset ].
	^ 0@0! !


!MarsRover methodsFor: 'evaluating' stamp: 'JA 5/15/2021 17:15:18'!
processPackage: aPackage
	aPackage do: [ :command| 
		#($f $b $l $r) detect: [:aPotentialCommand| aPotentialCommand = command.] ifNone: [^ self ].
		self changeOrientationUsing: command .
		self changePositionUsing: command.
	]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'JA 5/13/2021 22:03:47'!
at: aPoint facing: aCardinalPoint 
	^self new initializeAt: aPoint facing: aCardinalPoint ! !
