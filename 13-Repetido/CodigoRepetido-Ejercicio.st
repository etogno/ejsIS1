!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'paulMcCartney johnLennon'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'assertions' stamp: 'JA 4/12/2021 22:13:38'!
assertThat: aCustomerBook hasActiveCustomers: aNumberOfActiveCustomers andSuspendedCustomers: aNumberOfSuspendedCustomers andTotalCustomers: aNumberOfTotalCustomers
	
	self assert: aNumberOfActiveCustomers equals: aCustomerBook numberOfActiveCustomers.
	self assert: aNumberOfSuspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: aNumberOfTotalCustomers equals: aCustomerBook numberOfCustomers.
	
	

	
! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'JA 4/12/2021 21:44:35'!
assertThatExecute: aBlock doesNotTakeMoreThan: aTimeLapse

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aBlock value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < aTimeLapse
	
! !


!CustomerBookTest methodsFor: 'testing' stamp: 'JA 4/14/2021 19:12:16'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	self assertThatExecute: [customerBook addCustomerNamed: johnLennon.] doesNotTakeMoreThan: 50*millisecond 
		
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JA 4/14/2021 19:11:48'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook |
	customerBook := self newCustomerBookAdding: paulMcCartney.
	
	self assertThatExecute: [customerBook removeCustomerNamed: paulMcCartney.] 
		doesNotTakeMoreThan: 100 * millisecond
			
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'HernanWilkinson 5/9/2012 18:12'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JA 4/14/2021 19:12:16'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook |
	customerBook := self newCustomerBookAdding: johnLennon.
	
	[ customerBook removeCustomerNamed: paulMcCartney.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JA 4/14/2021 19:11:48'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook |	
	customerBook := self newCustomerBookAdding: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assertThat: customerBook hasActiveCustomers: 0  andSuspendedCustomers:  1 andTotalCustomers: 1.	
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JA 4/14/2021 19:11:48'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook |	
	customerBook := self newCustomerBookAdding: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertThat: customerBook hasActiveCustomers: 0  andSuspendedCustomers:  0 andTotalCustomers: 0.	
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JA 4/14/2021 19:12:16'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook |
	customerBook := self newCustomerBookAdding: johnLennon.
	
	[ customerBook suspendCustomerNamed: 'George Harrison'.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JA 4/14/2021 19:12:16'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook |
	customerBook := self newCustomerBookAdding: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	[ customerBook suspendCustomerNamed: johnLennon.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !


!CustomerBookTest methodsFor: 'initialization' stamp: 'JA 4/14/2021 19:20:39'!
initialize
	johnLennon:='John Lennon'.
	paulMcCartney := 'Paul McCartney'.
! !


!CustomerBookTest methodsFor: 'utils' stamp: 'ET 4/14/2021 16:59:14'!
newCustomerBookAdding: aName
	
	| customerBook  |
			
	customerBook := CustomerBook new.

	customerBook addCustomerNamed: aName.
	
	^customerBook.
	

! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'ET 4/14/2021 00:16:45'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'ET 4/14/2021 00:37:12'!
removeCustomerNamed: aName 
 
	((self removeFrom: active  aCustomerNamed: aName) or: 
	[self removeFrom: suspended aCustomerNamed: aName.]) 
	
	ifFalse: 	[^ NotFound signal.]
! !

!CustomerBook methodsFor: 'customer management' stamp: 'ET 4/14/2021 00:35:36'!
removeFrom: aCollection aCustomerNamed: aName 
 
	1 to: aCollection size do: 
	[ :index |
		aName = (aCollection at: index)
			ifTrue: [
				aCollection removeAt: index.
				^true 
			] 
	].
	^false.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/12/2021 16:39:13'!
customerAlreadyExistsErrorMessage

	^'customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/12/2021 16:39:09'!
customerCanNotBeEmptyErrorMessage

	^'customer name cannot be empty!!!!!!'! !
