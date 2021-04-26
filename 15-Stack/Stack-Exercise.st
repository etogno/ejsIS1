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


!OOStack methodsFor: 'removing' stamp: 'ET 4/26/2021 18:27:07'!
pop

	|valor|
	
	valor := tope valor.
	
	tope := tope elDeAbajo.
	
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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
