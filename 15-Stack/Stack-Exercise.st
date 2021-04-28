!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 4/22/2021 17:25:26'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstObject'.
	secondPushedObject := 'secondObject'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 21:00:03'!
test01StackVacioConCualquierPrefijoDaUnaColeccionVacia

	|unStack unPrefijo finder|
	
	unStack := OOStack new.
	
	unPrefijo := 'wint'.
	
	finder := SentenceFinderByPrefix new.
	
	self assert: (finder find: unPrefijo enElStack: unStack) isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 21:08:02'!
test02StackConUnElementoYConElMismoPrefijoDaColeccionConElMismoElemento

	|unStack unPrefijo finder coleccion|
	
	unStack := OOStack new.
	
	unPrefijo := 'winter'.
	
	unStack push: 'winter'.
	
	finder := SentenceFinderByPrefix new.
	
	coleccion :=finder find: unPrefijo enElStack: unStack.
	
	self deny: coleccion isEmpty.
	
	self assert: coleccion size = 1.
	
	self assert: (coleccion at: 1) equals: 'winter'.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 21:11:22'!
test03StackConUnElementoSigueTeniendoElMismoElemento

	|unStack unPrefijo finder coleccion|
	
	unStack := OOStack new.
	
	unPrefijo := 'win'.
	
	unStack push: 'winter'.
	
	finder := SentenceFinderByPrefix new.
	
	coleccion :=finder find: unPrefijo enElStack: unStack.
	
	self assert: unStack size equals: 1.
	
	self assert: unStack top equals: 'winter'.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 21:21:53'!
test04ElPrefijoEsCaseSensitive

	|unStack unPrefijo finder coleccion|
	
	unStack := OOStack new.
	
	unPrefijo := 'Win'.
	
	unStack push: 'winter'.
	
	finder := SentenceFinderByPrefix new.
	
	coleccion :=finder find: unPrefijo enElStack: unStack.
	
	self assert: coleccion isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 21:48:18'!
test05BuscaPrefijosYNoSubStringsPropiosOSufijos

	|unStack unPrefijo finder coleccion|
	
	unStack := OOStack new.
	
	unPrefijo := 'wint'.
	
	unStack push: 'the winds of winter'.
	
	unStack push: 'winter is coming'.
	
	unStack push: 'win for wint'.
	
	finder := SentenceFinderByPrefix new.
	
	coleccion :=finder find: unPrefijo enElStack: unStack.
	
	self assert: (coleccion includes: 'winter is coming').
	
	self deny: (coleccion includes: 'win for wint').
	
	self deny: (coleccion includes: 'the winds of winter').! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 21:50:05'!
test06NoIncluyePrefijosDelPrefijo

	|unStack unPrefijo finder coleccion|
	
	unStack := OOStack new.
	
	unPrefijo := 'winterisaseason'.
	
	unStack push: 'winter'.
	
	unStack push: 'win is for victory'.
	
	unStack push: 'winterisaseasoneveryyear'.
	
	finder := SentenceFinderByPrefix new.
	
	coleccion :=finder find: unPrefijo enElStack: unStack.
	
	self assert: coleccion size equals: 1.
		
	self assert: (coleccion at: 1) equals: 'winterisaseasoneveryyear'.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 21:35:14'!
test07RetornaTodasLasCoincidencias

	|unStack unPrefijo finder coleccion|
	
	unStack := OOStack new.
	
	unPrefijo := 'win'.
	
	unStack push: 'winter'.
	
	unStack push: 'win is for victory'.
	
	unStack push: 'winter is a season every year'.
	
	unStack push: 'hola'.
	
	unStack push: 'chau'.
	
	finder := SentenceFinderByPrefix new.
	
	coleccion :=finder find: unPrefijo enElStack: unStack.
	
	self assert: coleccion size equals: 3.
		
	self assert: coleccion includes: 'winter is a season every year'.
	
	self assert: coleccion includes: 'win is for victory'.
	
	self assert: coleccion includes: 'winter'.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 21:38:33'!
test08StackMantieneOrden

	|unStack unPrefijo finder coleccion|
	
	unStack := OOStack new.
	
	unPrefijo := 'win'.
	
	unStack push: 'winter'.
	
	unStack push: 'win is for victory'.
	
	unStack push: 'winter is a season every year'.
	
	finder := SentenceFinderByPrefix new.
	
	coleccion :=finder find: unPrefijo enElStack: unStack.
		
	self assert: unStack pop equals: 'winter is a season every year'.
			
	self assert: unStack pop equals: 'win is for victory'.
	
	self assert: unStack pop equals: 'winter'.
	
	self assert: unStack isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 21:52:32'!
test09PrefijoVacioDaError

	|unStack unPrefijo finder|
	
	unStack := OOStack new.
	
	unPrefijo := ''.
	
	unStack push: 'winter'.
	
	unStack push: 'win is for victory'.
	
	unStack push: 'winter is a season every year'.
	
	finder := SentenceFinderByPrefix new.
	
		
	self 
		should: [ finder find: unPrefijo enElStack: unStack.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix canNotUseEmptyPrefix].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 21:54:58'!
test10PrefijoConEspaciosVaciosDaError

	|unStack unPrefijo finder|
	
	unStack := OOStack new.
	
	unPrefijo := 'winter is'.
	
	unStack push: 'winter'.
	
	unStack push: 'win is for victory'.
	
	unStack push: 'winter is a season every year'.
	
	finder := SentenceFinderByPrefix new.
	
		
	self 
		should: [ finder find: unPrefijo enElStack: unStack.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix canNotUsePrefixWithEmptySpaces].! !


!classDefinition: #ElementoDelStack category: 'Stack-Exercise'!
Object subclass: #ElementoDelStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ElementoDelStack methodsFor: 'accessing' stamp: 'JA 4/28/2021 19:42:15'!
elementoPrevio

	self subclassResponsibility.! !

!ElementoDelStack methodsFor: 'accessing' stamp: 'ET 4/26/2021 18:29:05'!
valor

	self subclassResponsibility.! !


!ElementoDelStack methodsFor: 'testing' stamp: 'ET 4/26/2021 19:07:39'!
esBase

	self subclassResponsibility.! !


!classDefinition: #Base category: 'Stack-Exercise'!
ElementoDelStack subclass: #Base
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Base methodsFor: 'testing' stamp: 'ET 4/26/2021 19:07:56'!
esBase

	^true.! !


!Base methodsFor: 'accessing' stamp: 'JA 4/28/2021 19:42:15'!
elementoPrevio

	self error: OOStack stackEmptyErrorDescription.! !

!Base methodsFor: 'accessing' stamp: 'ET 4/26/2021 18:31:42'!
valor

	self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #ElementoPropio category: 'Stack-Exercise'!
ElementoDelStack subclass: #ElementoPropio
	instanceVariableNames: 'previousStackElement valor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ElementoPropio methodsFor: 'initialization' stamp: 'JA 4/28/2021 19:48:33'!
initializeWith: unValor andAPreviousElement: aPreviousStackElement.

	
	valor := unValor.
	previousStackElement := aPreviousStackElement ! !


!ElementoPropio methodsFor: 'testing' stamp: 'ET 4/26/2021 19:08:03'!
esBase

	^false.! !


!ElementoPropio methodsFor: 'accessing' stamp: 'JA 4/28/2021 19:48:33'!
elementoPrevio

	^previousStackElement.! !

!ElementoPropio methodsFor: 'accessing' stamp: 'ET 4/26/2021 18:30:26'!
valor

	^valor.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ElementoPropio class' category: 'Stack-Exercise'!
ElementoPropio class
	instanceVariableNames: ''!

!ElementoPropio class methodsFor: 'as yet unclassified' stamp: 'JA 4/28/2021 19:47:02'!
with: unValor andAPreviousElement: aPreviousStackElement

	^self new initializeWith: unValor andAPreviousElement: aPreviousStackElement.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'tope tamaño'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'JA 4/28/2021 18:49:07'!
isEmpty
	
	^tope esBase.! !


!OOStack methodsFor: 'accessing' stamp: 'ET 4/26/2021 18:18:32'!
size

	^tamaño.! !

!OOStack methodsFor: 'accessing' stamp: 'JA 4/28/2021 18:49:30'!
top

	^tope valor.! !


!OOStack methodsFor: 'adding' stamp: 'JA 4/28/2021 19:49:56'!
push: unValor 
	
	tope  := ElementoPropio with: unValor andAPreviousElement: tope.	
	tamaño := tamaño + 1.
	! !


!OOStack methodsFor: 'initialization' stamp: 'JA 4/28/2021 19:15:34'!
initialize
	
	tope := Base new.	
	tamaño := 0.! !


!OOStack methodsFor: 'removing' stamp: 'JA 4/28/2021 19:43:13'!
pop

	|valor|
	
	valor := tope valor.	
	tope := tope elementoPrevio .	
	tamaño := tamaño - 1.
	
	^valor.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 4/22/2021 17:22:41'!
stackEmptyErrorDescription
	
	^ 'Stack is empty!!!!!!'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 22:02:30'!
find: unPrefijo enElStack: unStack

	|otroStack oracionesConElPrefijo|
	
	unPrefijo isEmpty ifTrue: [self error: self class canNotUseEmptyPrefix].
	
	(unPrefijo includes: (' ' at: 1)) ifTrue: [self error: self class canNotUsePrefixWithEmptySpaces].
	
	oracionesConElPrefijo := OrderedCollection new.
	
	otroStack := OOStack new.
	
	[unStack isEmpty] whileFalse:
	[
		|tope|
		tope := unStack top.
		(tope beginsWith: unPrefijo) ifTrue: [oracionesConElPrefijo add: tope].
		unStack pop.
		otroStack push: tope.
		].
	
	[otroStack isEmpty] whileFalse:
	[
		|tope|
		tope := otroStack top.
		otroStack pop.
		unStack push: tope.
		].
	
	^oracionesConElPrefijo.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 21:52:52'!
canNotUseEmptyPrefix

	^'No se puede usar prefijo vacío!!!!'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 21:55:13'!
canNotUsePrefixWithEmptySpaces

	^'No se puede usar prefijo con espacios vacío!!!!'.! !
