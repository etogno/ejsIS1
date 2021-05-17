!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'testing' stamp: 'ET 5/16/2021 20:50:41'!
test01

	|rover|
	
	rover := MarsRover in: 0@0 withOrientation: #North.
	
	rover doCommands: ''.
	
	self assert: (rover isIn: 0@0 withOrientation: #North).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'ET 5/16/2021 20:58:54'!
test02

	|rover|
	
	rover := MarsRover in: 0@0 withOrientation: #North.
	
	rover doCommands: 'f'.
	
	self assert: (rover isIn: 1@0 withOrientation: #North).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'ET 5/16/2021 20:59:08'!
test03

	|rover|
	
	rover := MarsRover in: 0@0 withOrientation: #North.
	
	rover doCommands: 'b'.
	
	self assert: (rover isIn: -1@0 withOrientation: #North).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'ET 5/16/2021 21:01:52'!
test04

	|rover|
	
	rover := MarsRover in: 0@0 withOrientation: #North.
	
	rover doCommands: 'fbf'.
	
	self assert: (rover isIn: 1@0 withOrientation: #North).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'ET 5/16/2021 21:05:47'!
test05

	|rover|
	
	rover := MarsRover in: 0@0 withOrientation: #North.
	
	rover doCommands: 'l'.
	
	self assert: (rover isIn: 0@0 withOrientation: #East).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'ET 5/16/2021 21:59:52'!
test06

	|rover|
	
	rover := MarsRover in: 0@0 withOrientation: #North.
	
	rover doCommands: 'll'.
	
	self assert: (rover isIn: 0@0 withOrientation: #South).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'ET 5/16/2021 21:12:19'!
test07

	|rover|
	
	rover := MarsRover in: 0@0 withOrientation: #North.
	
	rover doCommands: 'lll'.
	
	self assert: (rover isIn: 0@0 withOrientation: #West).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'ET 5/16/2021 21:38:50'!
test08

	|rover|
	
	rover := MarsRover in: 0@0 withOrientation: #South.
	
	rover doCommands: 'f'.
	
	self assert: (rover isIn: -1@0 withOrientation: #South).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'ET 5/16/2021 21:47:17'!
test09

	|rover|
	
	rover := MarsRover in: 0@0 withOrientation: #East.
	
	rover doCommands: 'b'.
	
	self assert: (rover isIn: 0@-1 withOrientation: #East).! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position orientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'ET 5/16/2021 22:00:25'!
initializeIn: aPoint withOrientation: aCardinalPointSymbol 
	position := aPoint.
	orientation := (Smalltalk at: aCardinalPointSymbol) new.! !


!MarsRover methodsFor: 'testing' stamp: 'ET 5/16/2021 22:00:25'!
isIn: aPoint withOrientation: aCardinalPointSymbol 
	
	^position = aPoint and: [orientation isKindOf: (Smalltalk at: aCardinalPointSymbol)].! !


!MarsRover methodsFor: 'private' stamp: 'ET 5/16/2021 21:56:29'!
headEast

	orientation := East new.! !

!MarsRover methodsFor: 'private' stamp: 'ET 5/16/2021 21:56:17'!
headNorth

	orientation := North new.! !

!MarsRover methodsFor: 'private' stamp: 'ET 5/16/2021 21:56:24'!
headSouth

	orientation := South new.! !

!MarsRover methodsFor: 'private' stamp: 'ET 5/16/2021 21:56:36'!
headWest

	orientation := West new.! !

!MarsRover methodsFor: 'private' stamp: 'ET 5/16/2021 22:00:25'!
moveEast

	position := (position x) @ (position y + 1).! !

!MarsRover methodsFor: 'private' stamp: 'ET 5/16/2021 22:00:25'!
moveNorth

	position := (position x + 1) @ position y.! !

!MarsRover methodsFor: 'private' stamp: 'ET 5/16/2021 22:00:25'!
moveSouth

	position := (position x - 1) @ position y.! !

!MarsRover methodsFor: 'private' stamp: 'ET 5/16/2021 22:00:25'!
moveWest

	position := (position x) @ (position y - 1).! !


!MarsRover methodsFor: 'movement' stamp: 'ET 5/16/2021 22:01:08'!
doCommands: aStringOfCommands
	
	aStringOfCommands do: [:command | 
		command = $f ifTrue: [			orientation moveForward: self.		].
	
		command = $b ifTrue: [orientation moveBackward: self.			].
			
		command = $l ifTrue: [orientation rotateLeft: self].
		
		command = $r ifTrue: [orientation rotateRight: self].
	]
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'ET 5/16/2021 20:52:17'!
in: aPoint withOrientation: aCardinalPointSymbol

	^self new initializeIn: aPoint withOrientation: aCardinalPointSymbol.! !


!classDefinition: #OrientationOfMarsRover category: 'MarsRover'!
Object subclass: #OrientationOfMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!OrientationOfMarsRover methodsFor: 'movement' stamp: 'ET 5/16/2021 21:49:15'!
moveBackward: aMarsRover

	self subclassResponsibility.! !

!OrientationOfMarsRover methodsFor: 'movement' stamp: 'ET 5/16/2021 21:39:39'!
moveForward: aMarsRover

	self subclassResponsibility.! !


!OrientationOfMarsRover methodsFor: 'rotation' stamp: 'ET 5/16/2021 21:19:10'!
rotateLeft: aMarsRover

	self subclassResponsibility.! !

!OrientationOfMarsRover methodsFor: 'rotation' stamp: 'ET 5/16/2021 21:27:48'!
rotateRight: aMarsRover

	self subclassResponsibility.! !


!classDefinition: #East category: 'MarsRover'!
OrientationOfMarsRover subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!East methodsFor: 'movement' stamp: 'ET 5/16/2021 21:49:30'!
moveBackward: aMarsRover

	aMarsRover moveWest.! !

!East methodsFor: 'movement' stamp: 'ET 5/16/2021 21:40:25'!
moveForward: aMarsRover

	aMarsRover moveEast.! !


!East methodsFor: 'rotation' stamp: 'ET 5/16/2021 21:57:16'!
rotateLeft: aMarsRover

	aMarsRover headSouth.! !

!East methodsFor: 'rotation' stamp: 'ET 5/16/2021 21:55:23'!
rotateRight: aMarsRover

	aMarsRover headNorth.! !


!classDefinition: #North category: 'MarsRover'!
OrientationOfMarsRover subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'movement' stamp: 'ET 5/16/2021 21:49:51'!
moveBackward: aMarsRover

	aMarsRover moveSouth.! !

!North methodsFor: 'movement' stamp: 'ET 5/16/2021 21:40:36'!
moveForward: aMarsRover

	aMarsRover moveNorth.! !


!North methodsFor: 'rotation' stamp: 'ET 5/16/2021 21:57:24'!
rotateLeft: aMarsRover

	aMarsRover headEast.! !

!North methodsFor: 'rotation' stamp: 'ET 5/16/2021 21:55:39'!
rotateRight: aMarsRover

	aMarsRover headWest.! !


!classDefinition: #South category: 'MarsRover'!
OrientationOfMarsRover subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'movement' stamp: 'ET 5/16/2021 21:50:03'!
moveBackward: aMarsRover

	aMarsRover moveNorth.! !

!South methodsFor: 'movement' stamp: 'ET 5/16/2021 21:40:45'!
moveForward: aMarsRover

	aMarsRover moveSouth.! !


!South methodsFor: 'rotation' stamp: 'ET 5/16/2021 21:57:32'!
rotateLeft: aMarsRover

	aMarsRover headWest.! !

!South methodsFor: 'rotation' stamp: 'ET 5/16/2021 21:55:49'!
rotateRight: aMarsRover

	aMarsRover headEast.! !


!classDefinition: #West category: 'MarsRover'!
OrientationOfMarsRover subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'movement' stamp: 'ET 5/16/2021 21:50:15'!
moveBackward: aMarsRover

	aMarsRover moveEast.! !

!West methodsFor: 'movement' stamp: 'ET 5/16/2021 21:40:54'!
moveForward: aMarsRover

	aMarsRover moveWest.! !


!West methodsFor: 'rotation' stamp: 'ET 5/16/2021 21:57:42'!
rotateLeft: aMarsRover

	aMarsRover headNorth.! !

!West methodsFor: 'rotation' stamp: 'ET 5/16/2021 21:55:57'!
rotateRight: aMarsRover

	aMarsRover headSouth.! !
