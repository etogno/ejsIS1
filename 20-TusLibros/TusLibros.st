!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !


!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
defaultCatalog
	
	^ Array with: self itemSellByTheStore! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !


!classDefinition: #CashierTest category: 'TusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'as yet unclassified' stamp: 'ET 6/10/2021 20:40:54'!
expiredCreditCard

	^ CreditCard owner: 'owner' number: '1234567891011121' expiration: GregorianMonthOfYear current previous.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'ET 6/10/2021 20:50:24'!
test01CanNotCheckoutEmptyCart

	|cart catalog cashier priceList |
	
	catalog := OrderedCollection new.
	
	cart := Cart acceptingItemsOf: catalog.
	
	priceList := Dictionary new.
	
	cashier := Cashier with: priceList.
	
	self should: [cashier checkout: cart withCreditCard: self validCreditCard.]
	 raise: Error
	 withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier CanNotCheckoutEmptyCart. ]! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'ET 6/10/2021 20:51:03'!
test02CanNotCheckoutCartWithNonPricedItem

	|cart catalog cashier priceList |
	
	catalog := OrderedCollection new.
	
	cart := Cart acceptingItemsOf: catalog.
	catalog add: 'book'.
	cart add: 'book'.
	
	priceList := Dictionary new.
	
	cashier := Cashier with: priceList.
	
	self should: [cashier checkout: cart withCreditCard: self validCreditCard]
	 raise: Error
	 withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier AnItemIsNotInThePriceList. ]! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'ET 6/10/2021 20:51:53'!
test03CheckoutCartWithOneItemReturnsThePriceOfThatItem

	|cart catalog cashier priceList |
	
	catalog := OrderedCollection new.
	
	cart := Cart acceptingItemsOf: catalog.
	catalog add: 'book'.
	cart add: 'book'.
	
	
	priceList := Dictionary new.
	
	priceList add: 'book'->1.
	
	
	cashier := Cashier with: priceList.
	
	
	self assert: 1 equals:  (cashier checkout: cart withCreditCard: self validCreditCard).! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'ET 6/10/2021 20:52:25'!
test04CheckoutCartWithManyItemsReturnsTheSumOfThePricesOfThoseItems

	|cart catalog cashier priceList |
	
	catalog := OrderedCollection new.
	
	cart := Cart acceptingItemsOf: catalog.
	catalog add: 'book'.
	cart add: 'book'.
	cart add: 'book'.
	
	
	priceList := Dictionary new.
	
	priceList add: 'book'->1.
	
	
	cashier := Cashier with: priceList.
	
	
	self assert: 2 equals:  (cashier checkout: cart withCreditCard: self validCreditCard).! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'ET 6/10/2021 20:52:47'!
test05CanNotCheckoutWithExpiratedCreditCard

	|cart catalog cashier priceList creditCard |
	
	catalog := OrderedCollection new.
	
	cart := Cart acceptingItemsOf: catalog.
	catalog add: 'book'.
	cart add: 'book'.
	
	
	priceList := Dictionary new.
	
	priceList add: 'book'->1.
	
	
	cashier := Cashier with: priceList.
	
	creditCard := self expiredCreditCard.

	
	self should: [ (cashier checkout: cart withCreditCard: creditCard)]
	raise: Error
	withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier ExpiredCreditCardError ]	.
		
		
		! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'ET 6/10/2021 20:38:58'!
validCreditCard

	^ CreditCard owner: 'owner' number: '1234567891011121' expiration: GregorianMonthOfYear current next! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidItem: anItem

	(catalog includes: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

!Cart methodsFor: 'adding' stamp: 'ET 6/10/2021 20:09:25'!
do: aBlockClosure

	items do: aBlockClosure.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: 'priceList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'initialization' stamp: 'ET 6/10/2021 19:48:32'!
initializeWith: aPriceList 

	priceList := aPriceList.! !


!Cashier methodsFor: 'as yet unclassified' stamp: 'ET 6/10/2021 20:14:38'!
assertCartIsNotEmpty: aCart

	^ aCart isEmpty ifTrue: [	self error: self class CanNotCheckoutEmptyCart]! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'ET 6/10/2021 20:45:42'!
assertCreditCardIsValid: aCreditCard
	
	aCreditCard expirationDate < GregorianMonthOfYear current ifTrue: [self error: self class ExpiredCreditCardError].! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'ET 6/10/2021 20:43:17'!
checkout: aCart withCreditCard: aCreditCard 
	|totalPrice|
	self assertCartIsNotEmpty: aCart.
	self assertCreditCardIsValid: aCreditCard.
	totalPrice := 0.
	aCart do: [:anElement | totalPrice := totalPrice + priceList at: anElement ifAbsent: [self itemNotInPriceListError].].
	
	^totalPrice.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'ET 6/10/2021 20:14:57'!
itemNotInPriceListError

	^ self error: self class AnItemIsNotInThePriceList! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'instance creation' stamp: 'ET 6/10/2021 19:48:18'!
with: aPriceList 
	^self new initializeWith: aPriceList! !


!Cashier class methodsFor: 'as yet unclassified' stamp: 'ET 6/10/2021 19:54:00'!
AnItemIsNotInThePriceList
	^'An item in the cart is not in the price list'.! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'ET 6/10/2021 19:49:19'!
CanNotCheckoutEmptyCart
	^'The cart is empty'.! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'ET 6/10/2021 20:43:48'!
ExpiredCreditCardError
	^'The credit card is expired'.! !


!classDefinition: #CreditCard category: 'TusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: 'ownerString creditCardNumberString gregorianMonthOfYear'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'ET 6/10/2021 20:46:08'!
expirationDate

	^gregorianMonthOfYear! !

!CreditCard methodsFor: 'initialization' stamp: 'ET 6/10/2021 20:34:00'!
initializeOwner: anOwnerString number: aCreditCardNumberString expiration: aGregorianMonthOfYear 

	ownerString := anOwnerString.
	creditCardNumberString := aCreditCardNumberString.
	gregorianMonthOfYear := aGregorianMonthOfYear.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'TusLibros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'ET 6/10/2021 20:32:45'!
owner: anOwnerString number: aCreditCardNumberString expiration: aGregorianMonthOfYear 
	self assertCreditCardNumberIsValid: aCreditCardNumberString.
	^self new initializeOwner: anOwnerString number: aCreditCardNumberString expiration: aGregorianMonthOfYear ! !


!CreditCard class methodsFor: 'as yet unclassified' stamp: 'ET 6/10/2021 20:33:37'!
assertCreditCardNumberIsValid: aString 
	
	aString size = 16 ifFalse: [self error: self creditCardIsInvalid]! !
