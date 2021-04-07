!classDefinition: #I category: 'Numeros Naturales'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Numeros Naturales'!
I class
	instanceVariableNames: 'next'!

!I class methodsFor: 'as yet unclassified' stamp: 'JA 4/6/2021 23:14:35'!
* aNumber
	^ aNumber! !

!I class methodsFor: 'as yet unclassified' stamp: 'ET 4/5/2021 20:46:35'!
+ unSumando

	^unSumando next! !

!I class methodsFor: 'as yet unclassified' stamp: 'ET 4/6/2021 19:04:10'!
- unNumero

	self error: self descripcionDeErrorDeNumerosNegativosNoSoportados.! !

!I class methodsFor: 'as yet unclassified' stamp: 'ET 4/7/2021 15:50:56'!
/ unDivisor

	unDivisor = self ifTrue: [^self] ifFalse: [^self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].! !

!I class methodsFor: 'as yet unclassified' stamp: 'ET 4/7/2021 15:50:08'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'El divisor es más grande que el dividendo.'! !

!I class methodsFor: 'as yet unclassified' stamp: 'ET 4/6/2021 19:03:51'!
descripcionDeErrorDeNumerosNegativosNoSoportados

	^'El resultado no es un numero natural'! !

!I class methodsFor: 'as yet unclassified' stamp: 'ET 4/7/2021 16:06:18'!
esMayorA: unNumero
	^false.! !

!I class methodsFor: 'as yet unclassified' stamp: 'ET 4/6/2021 19:02:18'!
esRestadoA: unNumero

	^unNumero previous! !

!I class methodsFor: 'as yet unclassified' stamp: 'ET 4/7/2021 16:07:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := II.! !

!I class methodsFor: 'as yet unclassified' stamp: 'ET 4/5/2021 20:43:50'!
next
	next ifNil: [next := self cloneNamed: self name, 'I'].
	^next! !


!classDefinition: #II category: 'Numeros Naturales'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Numeros Naturales'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'as yet unclassified' stamp: 'JA 4/6/2021 23:14:13'!
* aNumber
	^ (self previous * aNumber)+aNumber ! !

!II class methodsFor: 'as yet unclassified' stamp: 'ET 4/5/2021 20:55:44'!
+ unSumando

	^self previous + unSumando next! !

!II class methodsFor: 'as yet unclassified' stamp: 'ET 4/6/2021 19:00:55'!
- unNumero

	^unNumero esRestadoA: self.

"
		|aux resultado|
	
	resultado := self.
	aux := unNumero.
	[aux = I] whileFalse: [
		resultado := resultado previous.		
		aux := aux previous.
		].
	^resultado previous.

	"! !

!II class methodsFor: 'as yet unclassified' stamp: 'ET 4/7/2021 16:02:53'!
/ unDivisor

	(unDivisor esMayorA: self) ifTrue: [^self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ] 
	ifFalse: [
		(II*unDivisor esMayorA: self) ifTrue: [^I]
		ifFalse: [^(self - unDivisor / unDivisor) next]
	].! !

!II class methodsFor: 'as yet unclassified' stamp: 'ET 4/7/2021 15:50:26'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'El divisor es más grande que el dividendo.'! !

!II class methodsFor: 'as yet unclassified' stamp: 'ET 4/7/2021 16:06:09'!
esMayorA: unNumero

	unNumero = I ifTrue:[^true]
	ifFalse: [
		^self isDescendantOf: unNumero].! !

!II class methodsFor: 'as yet unclassified' stamp: 'ET 4/6/2021 19:01:59'!
esRestadoA: unNumero

	^unNumero previous - previous.! !

!II class methodsFor: 'as yet unclassified' stamp: 'ET 4/7/2021 16:07:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !

!II class methodsFor: 'as yet unclassified' stamp: 'ET 4/5/2021 21:08:09'!
next
	next ifNil: [
		next := self createChildNamed: self name, 'I'.
		next previous: self.
		].
	^next! !

!II class methodsFor: 'as yet unclassified' stamp: 'ET 4/5/2021 20:56:43'!
previous
	^previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'JA 4/6/2021 22:35:53'!
previous: aPrevious
	previous:=aPrevious! !


!classDefinition: #III category: 'Numeros Naturales'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'Numeros Naturales'!
III class
	instanceVariableNames: ''!

!III class methodsFor: 'as yet unclassified' stamp: 'ET 4/7/2021 16:07:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !

!III class methodsFor: 'as yet unclassified' stamp: 'ET 4/5/2021 21:09:00'!
previous: aNumber
	previous := aNumber.! !


!classDefinition: #IIII category: 'Numeros Naturales'!
III subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: 'Numeros Naturales'!
IIII class
	instanceVariableNames: ''!

!IIII class methodsFor: 'as yet unclassified' stamp: 'ET 4/7/2021 16:07:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := III.! !


!classDefinition: #IIIII category: 'Numeros Naturales'!
IIII subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: 'Numeros Naturales'!
IIIII class
	instanceVariableNames: ''!

!IIIII class methodsFor: 'as yet unclassified' stamp: 'ET 4/7/2021 16:07:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := IIII.! !

I initializeAfterFileIn!
II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!
IIIII initializeAfterFileIn!