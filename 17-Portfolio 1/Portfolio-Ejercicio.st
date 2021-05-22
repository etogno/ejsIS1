!classDefinition: #PortfolioTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ET 5/17/2021 20:28:52'!
test01

	|portfolio|
	
	portfolio := Portfolio new.
	
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ET 5/22/2021 17:47:05'!
test02

	|portfolio account|
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	
	portfolio := Portfolio new.
	
	portfolio addFinancialEntity: account.
	
	self assert: 100 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ET 5/22/2021 17:47:05'!
test03

	|portfolio account1 account2|
	
	account1 := ReceptiveAccount new.
	Deposit register: 100 on: account1.
	
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account2.
	
	portfolio := Portfolio new.
	
	portfolio addFinancialEntity: account1.
	portfolio addFinancialEntity: account2.
	
	self assert: 200 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ET 5/22/2021 17:47:05'!
test04

	|portfolio account deposit|
	
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	
	portfolio addFinancialEntity: account.
	
	
	self assert: (portfolio hasRegistered: deposit).
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ET 5/22/2021 17:47:05'!
test05

	|portfolio account deposit|
	
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	deposit := Deposit for: 100.
	
	portfolio addFinancialEntity: account.
	
	
	self deny: (portfolio hasRegistered: deposit).
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ET 5/22/2021 17:47:05'!
test06

	|portfolio account1 account2 deposit|
	
	portfolio := Portfolio new.
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	deposit := Deposit register: 100 on: account2.
	
	portfolio addFinancialEntity: account1.
	
	portfolio addFinancialEntity: account2.
	
	
	self assert: (portfolio hasRegistered: deposit).
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ET 5/22/2021 17:47:05'!
test07

	|portfolio account1 deposit1 |
	
	portfolio := Portfolio new.
	
	account1 := ReceptiveAccount new.
	
	
	deposit1 := Deposit register: 50 on: account1.
	
	portfolio addFinancialEntity: account1.
		
	self assert: 1 equals: portfolio transactions size.
	self assert: (portfolio transactions includes: deposit1).
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ET 5/22/2021 17:47:05'!
test08

	|portfolio account1 account2 deposit withdraw |
	
	portfolio := Portfolio new.
	
	account1 := ReceptiveAccount new.
	
	account2 := ReceptiveAccount new.
	
	deposit := Deposit register: 50 on: account1.
	
	withdraw := Withdraw register: 20 on: account2.
	
	portfolio addFinancialEntity: account1.
	portfolio addFinancialEntity: account2.
		
	self assert: 2 equals: portfolio transactions size.
	self assert: (portfolio transactions includes: deposit).
	self assert: (portfolio transactions includes: withdraw).
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ET 5/22/2021 17:48:32'!
test09

	|portfolioParent portfolioChild|
	
	portfolioParent := Portfolio new.
	
	portfolioChild := Portfolio new.
	
	portfolioParent addFinancialEntity: portfolioChild.
	
	
		
	self assert: 0 equals: portfolioParent balance.
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ET 5/22/2021 17:48:42'!
test10

	|portfolioParent portfolioChild account deposit|
	
	portfolioParent := Portfolio new.
	
	portfolioChild := Portfolio new.
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	
	portfolioChild addFinancialEntity: account.
	
	portfolioParent addFinancialEntity: portfolioChild.
	
	
		
	self assert: 100 equals: portfolioParent balance.
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ET 5/22/2021 17:48:57'!
test11

	|portfolioParent portfolioChild1 portfolioChild2 account1 account2 deposit1 deposit2|
	
	portfolioParent := Portfolio new.
	
	portfolioChild1 := Portfolio new.
	
	portfolioChild2 := Portfolio new.
	
	account1 := ReceptiveAccount new.
	deposit1 := Deposit register: 100 on: account1.
	
	portfolioChild1 addFinancialEntity: account1.
	
	account2 := ReceptiveAccount new.
	deposit2 := Deposit register: 100 on: account2.
	
	portfolioChild2 addFinancialEntity: account2.
	
	portfolioParent addFinancialEntity: portfolioChild1.
	
	portfolioParent addFinancialEntity: portfolioChild2.
	
	
		
	self assert: 200 equals: portfolioParent balance.
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ET 5/22/2021 17:49:07'!
test12

	|portfolioParent portfolioChild  account deposit|
	
	portfolioParent := Portfolio new.
	
	portfolioChild := Portfolio new.
	
	portfolioParent addFinancialEntity: portfolioChild.
	
	account := ReceptiveAccount new.
	
	portfolioParent addFinancialEntity: account.
	
	deposit := Deposit register: 100 on: account.
	
		
	self assert: 100 equals: portfolioParent balance.
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ET 5/22/2021 17:49:16'!
test13

	|portfolioParent portfolioChild account deposit|
	
	portfolioParent := Portfolio new.
	
	portfolioChild := Portfolio new.
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	
	portfolioChild addFinancialEntity: account.
	
	portfolioParent addFinancialEntity: portfolioChild.
	
	
	self assert: (portfolioParent hasRegistered: deposit).
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ET 5/22/2021 17:49:23'!
test14

	|portfolioParent portfolioChild account deposit |
	
	portfolioParent := Portfolio new.
	
	portfolioChild := Portfolio new.
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 on: account.
	
	portfolioChild addFinancialEntity: account.
	
	portfolioParent addFinancialEntity: portfolioChild.
		
	self assert: 1 equals: portfolioParent transactions size.
	self assert: (portfolioParent transactions includes: deposit).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'ET 5/22/2021 17:47:05'!
test15

	|portfolio account|
	
	portfolio:= Portfolio new.
	
	account := ReceptiveAccount new.
	
	portfolio addFinancialEntity: account.
	
	self should:[portfolio addFinancialEntity: account]
	raise: Error 
	withExceptionDo: [ :anError | self assert: anError messageText equals: (Portfolio canNotAddAlreadyAddedAccount) ].! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:52'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/17/2021 17:29:53'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: 'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'ET 5/22/2021 17:32:35'!
modifiesBalance: balance 

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'ET 5/22/2021 17:32:09'!
modifiesBalance: balance

	^balance + value.! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'ET 5/22/2021 17:32:18'!
modifiesBalance: balance

	^balance - value.! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #FinancialEntity category: 'Portfolio-Ejercicio'!
Object subclass: #FinancialEntity
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!FinancialEntity methodsFor: 'balance' stamp: 'ET 5/22/2021 17:35:47'!
balance

	self subclassResponsibility.! !


!FinancialEntity methodsFor: 'testing' stamp: 'ET 5/22/2021 17:36:18'!
hasRegistered: aTransaction

	self subclassResponsibility.! !


!FinancialEntity methodsFor: 'transactions' stamp: 'ET 5/22/2021 17:36:31'!
transactions

	self subclassResponsibility.! !


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
FinancialEntity subclass: #Portfolio
	instanceVariableNames: 'financialEntities'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'balance' stamp: 'ET 5/22/2021 17:51:04'!
balance
	
	^(financialEntities sum: [:aFinancialEntity | aFinancialEntity balance] ifEmpty: [0])! !


!Portfolio methodsFor: 'testing' stamp: 'ET 5/22/2021 17:50:48'!
hasRegistered: aTransaction 
	
	^(financialEntities anySatisfy: [:aFinancialEntity | aFinancialEntity hasRegistered: aTransaction])! !


!Portfolio methodsFor: 'transactions' stamp: 'ET 5/22/2021 17:50:31'!
transactions

	|transactions|
	transactions := OrderedCollection new.
	financialEntities do: [:aFinancialEntity | transactions addAllFirst: aFinancialEntity transactions].
	
	^transactions.! !


!Portfolio methodsFor: 'as yet unclassified' stamp: 'ET 5/22/2021 17:47:28'!
addFinancialEntity: aFinancialEntity
	
	(financialEntities includes: aFinancialEntity) ifTrue: [self error: self class canNotAddAlreadyAddedAccount].
	
	financialEntities add: aFinancialEntity.! !


!Portfolio methodsFor: 'initialization' stamp: 'ET 5/22/2021 17:50:15'!
initialize

	financialEntities := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'ET 5/20/2021 21:07:07'!
canNotAddAlreadyAddedAccount
	
	^'This account has been added in the portfolio before!!!!'! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
FinancialEntity subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'ET 5/22/2021 17:33:11'!
balance

	^transactions inject: 0 into: [:balance :aTransaction |  aTransaction modifiesBalance: balance ].! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !
