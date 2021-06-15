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

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JA 6/14/2021 19:15:17'!
test01CanNotCheckoutEmptyCart

	|cart catalog cashier priceList aSalesBook aMerchantProcessor |
	
	catalog := OrderedCollection new.
	
	cart := Cart acceptingItemsOf: catalog.
	
	priceList := Dictionary new.
	
	aSalesBook := OrderedCollection new.
	aMerchantProcessor := MerchantProcessorSimulator new.
	cashier := Cashier with: priceList registerSalesOn: aSalesBook merchantProcessor: aMerchantProcessor.
	
	self should: [cashier checkout: cart withCreditCard: self validCreditCard.]
	 raise: Error
	 withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier CanNotCheckoutEmptyCart. 
			self assert: aSalesBook isEmpty.]! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JA 6/14/2021 19:15:34'!
test02CanNotCheckoutCartWithNonPricedItem

	|cart catalog cashier priceList aSalesBook aMerchantProcessor |
	
	catalog := OrderedCollection new.
	
	cart := Cart acceptingItemsOf: catalog.
	catalog add: 'book'.
	cart add: 'book'.
	
	priceList := Dictionary new.
	
	aSalesBook := OrderedCollection new.
	aMerchantProcessor := MerchantProcessorSimulator new.
	cashier := Cashier with: priceList registerSalesOn: aSalesBook merchantProcessor: aMerchantProcessor.	
	self should: [cashier checkout: cart withCreditCard: self validCreditCard]
	 raise: Error
	 withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier AnItemIsNotInThePriceList. 
			self assert: aSalesBook isEmpty]! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JA 6/14/2021 19:15:47'!
test03CheckoutCartWithOneItemReturnsThePriceOfThatItem

	|cart catalog cashier priceList aSalesBook aMerchantProcessor |
	
	catalog := OrderedCollection new.
	
	cart := Cart acceptingItemsOf: catalog.
	catalog add: 'book'.
	cart add: 'book'.
	
	
	priceList := Dictionary new.
	
	priceList add: 'book'->1.
	
	
	aSalesBook := OrderedCollection new.
	aMerchantProcessor := MerchantProcessorSimulator new.
	cashier := Cashier with: priceList registerSalesOn: aSalesBook merchantProcessor: aMerchantProcessor.	
	
	self assert: 1 equals:  (cashier checkout: cart withCreditCard: self validCreditCard).
	self assert: 1 equals: aSalesBook size.
	self assert: 1 equals: aSalesBook first.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JA 6/14/2021 19:16:03'!
test04CheckoutCartWithManyItemsReturnsTheSumOfThePricesOfThoseItems

	|cart catalog cashier priceList aSalesBook aMerchantProcessor |
	
	catalog := OrderedCollection new.
	
	cart := Cart acceptingItemsOf: catalog.
	catalog add: 'book'.
	cart add: 'book'.
	cart add: 'book'.
	
	
	priceList := Dictionary new.
	
	priceList add: 'book'->1.
	
	
	aSalesBook := OrderedCollection new.
	aMerchantProcessor := MerchantProcessorSimulator new.		
	cashier := Cashier with: priceList registerSalesOn: aSalesBook merchantProcessor: aMerchantProcessor.		
	self assert: 2 equals:  (cashier checkout: cart withCreditCard: self validCreditCard).
	self assert: 1 equals: aSalesBook size.
	self assert: 2 equals: aSalesBook first.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JA 6/14/2021 19:16:14'!
test05CanNotCheckoutWithExpiratedCreditCard

	|cart catalog cashier priceList creditCard aSalesBook aMerchantProcessor |
	
	catalog := OrderedCollection new.
	
	cart := Cart acceptingItemsOf: catalog.
	catalog add: 'book'.
	cart add: 'book'.
	
	
	priceList := Dictionary new.
	
	priceList add: 'book'->1.
	
	
	aSalesBook := OrderedCollection new.
	aMerchantProcessor := MerchantProcessorSimulator new.
	cashier := Cashier with: priceList registerSalesOn: aSalesBook merchantProcessor: aMerchantProcessor.
		
	creditCard := self expiredCreditCard.

	
	self should: [ (cashier checkout: cart withCreditCard: creditCard)]
	raise: Error
	withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier ExpiredCreditCardError.
			self assert: aSalesBook isEmpty ]	.
		
		
		! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JA 6/14/2021 19:34:50'!
test06CanNotCheckoutWithACreditCardWithoutCredit

	|cart catalog cashier priceList creditCard aSalesBook aMerchantProcessor |
	
	catalog := OrderedCollection new.
	
	cart := Cart acceptingItemsOf: catalog.
	catalog add: 'book'.
	cart add: 'book'.
	
	
	priceList := Dictionary new.
	
	priceList add: 'book'->1.
	
	
	aSalesBook := OrderedCollection new.
	aMerchantProcessor := MerchantProcessorSimulator new.
	aMerchantProcessor raiseErrorOnCharge: Cashier CreditCardWithoutCreditError.
	cashier := Cashier with: priceList registerSalesOn: aSalesBook merchantProcessor: aMerchantProcessor.
		
	creditCard := self validCreditCard.
	
	
	self should: [ (cashier checkout: cart withCreditCard: creditCard)]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier CreditCardWithoutCreditError.
			self assert: aSalesBook isEmpty ]	.
		
		
		! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JA 6/14/2021 19:35:28'!
test07CanNotCheckoutWithAStolenCreditCard

	|cart catalog cashier priceList creditCard aSalesBook aMerchantProcessor |
	
	catalog := OrderedCollection new.
	
	cart := Cart acceptingItemsOf: catalog.
	catalog add: 'book'.
	cart add: 'book'.
	
	
	priceList := Dictionary new.
	
	priceList add: 'book'->1.
	
	
	aSalesBook := OrderedCollection new.
	aMerchantProcessor := MerchantProcessorSimulator new.
	aMerchantProcessor raiseErrorOnCharge: Cashier StolenCreditCardError.
	cashier := Cashier with: priceList registerSalesOn: aSalesBook merchantProcessor: aMerchantProcessor.
		
	creditCard := self validCreditCard.
	
	
	self should: [ (cashier checkout: cart withCreditCard: creditCard)]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier StolenCreditCardError.
			self assert: aSalesBook isEmpty ]	.
		
		
		! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JA 6/14/2021 19:35:59'!
test08CanNotCheckoutWithAFakeCreditCard

	|cart catalog cashier priceList creditCard aSalesBook aMerchantProcessor |
	
	catalog := OrderedCollection new.
	
	cart := Cart acceptingItemsOf: catalog.
	catalog add: 'book'.
	cart add: 'book'.
	
	
	priceList := Dictionary new.
	
	priceList add: 'book'->1.
	
	
	aSalesBook := OrderedCollection new.
	aMerchantProcessor := MerchantProcessorSimulator new.
	aMerchantProcessor raiseErrorOnCharge: Cashier FakeCreditCardError.
	cashier := Cashier with: priceList registerSalesOn: aSalesBook merchantProcessor: aMerchantProcessor.
		
	creditCard := self validCreditCard.
	
	
	self should: [ (cashier checkout: cart withCreditCard: creditCard)]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier FakeCreditCardError.
			self assert: aSalesBook isEmpty ]	.
		
		
		! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'ET 6/10/2021 20:38:58'!
validCreditCard

	^ CreditCard owner: 'owner' number: '1234567891011121' expiration: GregorianMonthOfYear current next! !


!classDefinition: #CreditCardTest category: 'TusLibros'!
TestCase subclass: #CreditCardTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'JA 6/14/2021 21:27:03'!
test01CanNotCreateCreditCardWithIncorrectSizeNumber
	self should: [ CreditCard owner: 'Juan' number: '1234' expiration: GregorianMonthOfYear current.]
	 	raise:  Error
		withExceptionDo:[ :anException | self assert: CreditCard InvalidCreditCardError equals: anException messageText	] ! !

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'JA 6/14/2021 21:28:29'!
test02CanNotCreateCreditCardWithAlphaNumericNumber
	self should: [ CreditCard owner: 'Juan' number: '1234567890ABCDEF' expiration: GregorianMonthOfYear current.]
	 	raise:  Error
		withExceptionDo:[ :anException | self assert: CreditCard InvalidCreditCardError equals: anException messageText	] ! !

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'JA 6/14/2021 21:29:10'!
test03CanNotCreateCreditCardWithBlankOwner
	self should: [ CreditCard owner: '    ' number: '1234567890123456' expiration: GregorianMonthOfYear current.]
	 	raise:  Error - MessageNotUnderstood 
		withExceptionDo:[ :anException | self assert: CreditCard InvalidCreditCardError equals: anException messageText	] ! !


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
	instanceVariableNames: 'priceList salesBook merchantProcessorSimulator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'initialization' stamp: 'JA 6/14/2021 19:06:29'!
initializeWith: aPriceList registerSalesOn: aSalesBook merchantProcessor: aMerchantProcessorSimulator 
	
	priceList := aPriceList.
	salesBook := aSalesBook.
	merchantProcessorSimulator := aMerchantProcessorSimulator.! !


!Cashier methodsFor: 'as yet unclassified' stamp: 'JA 6/14/2021 19:08:26'!
checkout: aCart withCreditCard: aCreditCard 
	|totalPrice|
	self assertCartIsNotEmpty: aCart.
	self assertCreditCardIsValid: aCreditCard.
	totalPrice := 0.
	aCart do: [:anElement | totalPrice := totalPrice + priceList at: anElement ifAbsent: [self itemNotInPriceListError].].
	merchantProcessorSimulator charge: totalPrice  on: aCreditCard .
	salesBook add: totalPrice .
	^totalPrice.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'ET 6/10/2021 20:14:57'!
itemNotInPriceListError

	^ self error: self class AnItemIsNotInThePriceList! !


!Cashier methodsFor: 'assertions' stamp: 'ET 6/10/2021 20:14:38'!
assertCartIsNotEmpty: aCart

	^ aCart isEmpty ifTrue: [	self error: self class CanNotCheckoutEmptyCart]! !

!Cashier methodsFor: 'assertions' stamp: 'ET 6/10/2021 20:45:42'!
assertCreditCardIsValid: aCreditCard
	
	aCreditCard expirationDate < GregorianMonthOfYear current ifTrue: [self error: self class ExpiredCreditCardError].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'instance creation' stamp: 'JA 6/14/2021 19:06:11'!
with: aPriceList registerSalesOn: aSalesBook merchantProcessor: aMerchantProcessorSimulator 
	^self new initializeWith: aPriceList registerSalesOn: aSalesBook merchantProcessor: aMerchantProcessorSimulator ! !


!Cashier class methodsFor: 'as yet unclassified' stamp: 'ET 6/10/2021 19:54:00'!
AnItemIsNotInThePriceList
	^'An item in the cart is not in the price list'.! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'ET 6/10/2021 19:49:19'!
CanNotCheckoutEmptyCart
	^'The cart is empty'.! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'JA 6/14/2021 19:13:08'!
CreditCardWithoutCreditError
	^ 'La tarjeta no tiene suficiente crédito.'! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'ET 6/10/2021 20:43:48'!
ExpiredCreditCardError
	^'The credit card is expired'.! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'JA 6/14/2021 19:32:16'!
FakeCreditCardError
	^'La tarjeta de crédito es falsa'! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'JA 6/14/2021 19:31:11'!
StolenCreditCardError
 	^ 'La tarjeta de crédito es robada'! !


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

!CreditCard class methodsFor: 'instance creation' stamp: 'JA 6/14/2021 19:59:51'!
owner: anOwnerString number: aCreditCardNumberString expiration: aGregorianMonthOfYear 
	self assertCreditCardNumberIsValid: aCreditCardNumberString.
	self assertNonBlankOwner: anOwnerString.
	^self new initializeOwner: anOwnerString number: aCreditCardNumberString expiration: aGregorianMonthOfYear ! !


!CreditCard class methodsFor: 'as yet unclassified' stamp: 'JA 6/14/2021 19:47:59'!
InvalidCreditCardError
	^'Los datos de la tarjeta de crédito son inválidos'! !

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'JA 6/14/2021 19:56:53'!
assertCreditCardNumberIsValid: aString 
	
	aString size = 16 ifFalse: [self error: self InvalidCreditCardError ].
	(aString allSatisfy: [:aDigit | aDigit isDigit]	) ifFalse: [self error: self InvalidCreditCardError ].! !

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'JA 6/14/2021 20:57:02'!
assertNonBlankOwner: anOwnerString
	anOwnerString withBlanksTrimmed isEmpty ifTrue: [self error: self InvalidCreditCardError ]
	
	! !


!classDefinition: #MerchantProcessorSimulator category: 'TusLibros'!
Object subclass: #MerchantProcessorSimulator
	instanceVariableNames: 'messageError'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessorSimulator methodsFor: 'as yet unclassified' stamp: 'JA 6/14/2021 19:21:11'!
charge: aCharge on: aCreditCard 
	messageError ifNotNil: [	self error: messageError].! !

!MerchantProcessorSimulator methodsFor: 'as yet unclassified' stamp: 'JA 6/14/2021 19:20:19'!
raiseErrorOnCharge: aMessageError 
	messageError := aMessageError.! !
