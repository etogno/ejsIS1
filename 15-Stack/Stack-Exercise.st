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

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ET 4/28/2021 18:30:15'!
test01StackVacioDaUnaColeccionVacia

	|unStack unPrefijo finder coleccion |
	
	unStack := OOStack new.
	
	unPrefijo := 'wint'.
	
	finder := SentenceFinderByPrefix new.
	
	coleccion := finder find: unPrefijo enElStack: unStack.
	
	self assert: coleccion isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ET 4/28/2021 18:43:57'!
test02StackConUnElementoYConPrefijoAdecuadoDaColeccionConDichoElemento

	|unStack unPrefijo finder coleccion|
	
	unStack := OOStack new.
	
	unPrefijo := 'wint'.
	
	unStack push: 'winter'.
	
	finder := SentenceFinderByPrefix new.
	
	coleccion :=finder find: unPrefijo enElStack: unStack.
	
	self assert: coleccion size = 1.
	
	self assert: (coleccion at: 1) equals: 'winter'.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ET 4/28/2021 18:32:27'!
test03StackConUnElementoSigueTeniendoElMismoElemento

	|unStack unPrefijo finder coleccion|
	
	unStack := OOStack new.
	
	unPrefijo := 'wint'.
	
	unStack push: 'winter'.
	
	finder := SentenceFinderByPrefix new.
	
	coleccion :=finder find: unPrefijo enElStack: unStack.
	
	self assert: unStack size equals: 1.
	
	self assert: unStack top equals: 'winter'.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ET 4/28/2021 18:33:49'!
test04ElPrefijoEsCaseSensitive

	|unStack unPrefijo finder coleccion|
	
	unStack := OOStack new.
	
	unPrefijo := 'Wint'.
	
	unStack push: 'winter'.
	
	finder := SentenceFinderByPrefix new.
	
	coleccion :=finder find: unPrefijo enElStack: unStack.
	
	self assert: coleccion isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ET 4/28/2021 18:43:31'!
test05BuscaPrefijosYNoSubStringsPropiosOSufijos

	|unStack unPrefijo finder coleccion|
	
	unStack := OOStack new.
	
	unPrefijo := 'wint'.
	
	unStack push: 'the winds of winter'.
	
	unStack push: 'winter is coming'.
	
	unStack push: 'win for wint'.
	
	finder := SentenceFinderByPrefix new.
	
	coleccion :=finder find: unPrefijo enElStack: unStack.
	
	self assert: coleccion size equals: 1.
	
	self assert: (coleccion includes: 'winter is coming').! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ET 4/28/2021 18:45:38'!
test06NoIncluyeStringsQueSeanPrefijosPropiosDelPrefijo

	|unStack unPrefijo finder coleccion|
	
	unStack := OOStack new.
	
	unPrefijo := 'winterisaseason'.
	
	unStack push: 'winter'.
	
	unStack push: 'winteris a season'.
	
	unStack push: 'winterisaseasoneveryyear'.
	
	finder := SentenceFinderByPrefix new.
	
	coleccion :=finder find: unPrefijo enElStack: unStack.
	
	self assert: coleccion size equals: 1.
		
	self assert: (coleccion at: 1) equals: 'winterisaseasoneveryyear'.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ET 4/28/2021 18:42:27'!
test07RetornaTodasLasCoincidencias

	|unStack unPrefijo finder coleccion|
	
	unStack := OOStack new.
	
	unPrefijo := 'wint'.
	
	unStack push: 'winter'.
	
	unStack push: 'win is for victory'.
	
	unStack push: 'winter is a season every year'.
	
	unStack push: 'hola'.
	
	unStack push: 'chau'.
	
	finder := SentenceFinderByPrefix new.
	
	coleccion :=finder find: unPrefijo enElStack: unStack.
	
	self assert: coleccion size equals: 2.
		
	self assert: coleccion includes: 'winter is a season every year'.
	
	self assert: coleccion includes: 'winter'.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ET 4/28/2021 18:39:16'!
test08StackMantieneOrden

	|unStack unPrefijo finder coleccion|
	
	unStack := OOStack new.
	
	unPrefijo := 'wint'.
	
	unStack push: 'winter'.
	
	unStack push: 'win is for victory'.
	
	unStack push: 'winter is a season every year'.
	
	finder := SentenceFinderByPrefix new.
	
	coleccion := finder find: unPrefijo enElStack: unStack.
		
	self assert: unStack pop equals: 'winter is a season every year'.
			
	self assert: unStack pop equals: 'win is for victory'.
	
	self assert: unStack pop equals: 'winter'.
	
	self assert: unStack isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ET 4/28/2021 18:38:29'!
test09canNotUseEmptyPrefix

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

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ET 4/28/2021 18:38:44'!
test10canNotUsePrefixWithEmptySpaces

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

!ElementoDelStack methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 18:29:14'!
elDeAbajo

	self subclassResponsibility.! !

!ElementoDelStack methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 18:29:24'!
elDeAbajo: unElementoDelStack

	self subclassResponsibility.! !

!ElementoDelStack methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 19:07:39'!
esBase

	self subclassResponsibility.! !

!ElementoDelStack methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 18:29:05'!
valor

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ElementoDelStack class' category: 'Stack-Exercise'!
ElementoDelStack class
	instanceVariableNames: ''!

!ElementoDelStack class methodsFor: 'associating' stamp: 'ET 4/26/2021 19:02:41'!
with: unElemento

	^ElementoPropio new initializeWith: unElemento.! !


!classDefinition: #Base category: 'Stack-Exercise'!
ElementoDelStack subclass: #Base
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Base methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 18:32:40'!
elDeAbajo

	self error: OOStack stackEmptyErrorDescription.! !

!Base methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 18:32:36'!
elDeAbajo: unElementoDelStack

	self error: OOStack stackEmptyErrorDescription.! !

!Base methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 19:07:56'!
esBase

	^true.! !

!Base methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 18:31:42'!
valor

	self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #ElementoPropio category: 'Stack-Exercise'!
ElementoDelStack subclass: #ElementoPropio
	instanceVariableNames: 'elDeAbajo valor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ElementoPropio methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 18:30:45'!
elDeAbajo

	^elDeAbajo.! !

!ElementoPropio methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 18:31:06'!
elDeAbajo: unElementoDelStack

	elDeAbajo := unElementoDelStack.! !

!ElementoPropio methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 19:08:03'!
esBase

	^false.! !

!ElementoPropio methodsFor: 'as yet unclassified' stamp: 'ET 4/26/2021 18:30:26'!
valor

	^valor.! !


!ElementoPropio methodsFor: 'initialization' stamp: 'ET 4/26/2021 18:35:44'!
initializeWith: unElemento

	
	valor := unElemento.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'tope tamaño'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'ET 4/26/2021 19:08:13'!
isEmpty
	
	^tope esBase.
	"
	^coleccionConLosElementos isEmpty."! !


!OOStack methodsFor: 'accessing' stamp: 'ET 4/26/2021 18:18:32'!
size

	^tamaño.! !

!OOStack methodsFor: 'accessing' stamp: 'ET 4/26/2021 18:18:00'!
top

	^tope valor.
	"
	coleccionConLosElementos isEmpty
		ifTrue: [self error: OOStack stackEmptyErrorDescription]
		ifFalse: [^coleccionConLosElementos first.]"! !


!OOStack methodsFor: 'adding' stamp: 'ET 4/26/2021 19:09:18'!
push: unElemento 

	|nuevoTope|
	
	nuevoTope  := ElementoDelStack with: unElemento.
	
	nuevoTope elDeAbajo: tope.
	
	tope := nuevoTope.
	
	tamaño := tamaño + 1.
	"
	coleccionConLosElementos addFirst: unElemento.
	"! !


!OOStack methodsFor: 'initialization' stamp: 'ET 4/26/2021 18:36:11'!
initialize
	
	tope := Base new.
	
	tamaño := 0.
	"
	coleccionConLosElementos := OrderedCollection new."! !


!OOStack methodsFor: 'removing' stamp: 'ET 4/26/2021 21:13:16'!
pop

	|valor|
	
	valor := tope valor.
	
	tope := tope elDeAbajo.
	
	tamaño := tamaño - 1.
	
	^valor.
	"
	coleccionConLosElementos isEmpty
		ifTrue: [self error: OOStack stackEmptyErrorDescription]
		ifFalse: [^coleccionConLosElementos removeFirst.]"! !

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

!SentenceFinderByPrefix methodsFor: 'finder' stamp: 'ET 4/28/2021 19:15:24'!
find: unPrefijo enElStack: unStack

	| oracionesConElPrefijo |
	
	self asegurarQueElPrefijoEsValido: unPrefijo.
	
	oracionesConElPrefijo := OrderedCollection new.
	
	self porCadaElementoDelStack: unStack 
		hacer: [:elementoDelStack | (elementoDelStack beginsWith: unPrefijo) ifTrue: [oracionesConElPrefijo add: elementoDelStack]].
	
	^oracionesConElPrefijo.
	
	! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'ET 4/28/2021 19:14:23'!
asegurarQueElPrefijoEsValido: unPrefijo

	|espacioVacio|
	
	unPrefijo isEmpty ifTrue: [self error: self class canNotUseEmptyPrefix].
	
	espacioVacio := ' ' at: 1.
	
	(unPrefijo includes: espacioVacio) ifTrue: [self error: self class canNotUsePrefixWithEmptySpaces].
	
	
	! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'ET 4/28/2021 19:26:40'!
desapilar: unStack apilandoSusElementosEn: otroStack ejecutandoPorCadaElemento: unClosureQueRecibeUnElemento
	
	[unStack isEmpty] whileFalse:
	[
		|tope|
		tope := unStack top.
		unClosureQueRecibeUnElemento value: tope.
		unStack pop.
		otroStack push: tope.
		].
	
	
	! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'ET 4/28/2021 19:27:11'!
porCadaElementoDelStack: unStack hacer: unClosureQueRecibeUnElemento

	|otroStack|
	
	otroStack := OOStack new.
	
	self desapilar: unStack apilandoSusElementosEn: otroStack ejecutandoPorCadaElemento: unClosureQueRecibeUnElemento.
	
	self desapilar: otroStack apilandoSusElementosEn: unStack ejecutandoPorCadaElemento: [:elementoDelStack | ].
	
	
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
