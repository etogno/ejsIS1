!classDefinition: #LogInWindow category: 'TusLibros-Client'!
Panel subclass: #LogInWindow
	instanceVariableNames: 'usernameTextBoxMorph passwordTextBoxMorph errorMessageMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Client'!

!LogInWindow methodsFor: 'initialization' stamp: 'ET 7/7/2021 19:18:51'!
changeToStoreClientWindow
	StoreClientWindow openWithCartID: self model cartID username: self model usernameText password: self model passwordText.
	
	self delete.! !

!LogInWindow methodsFor: 'initialization' stamp: 'ET 6/28/2021 20:16:27'!
defaultExtent

	^ 567@328
	! !

!LogInWindow methodsFor: 'initialization' stamp: 'ET 6/28/2021 20:31:37'!
initializeWith: aTitle

	self titleMorph showButtonsNamed: #( close collapse ).
	self setLabel: aTitle.
	self model: (LogInWindowModel new).
	self morphExtent: (self defaultExtent).
	self buildMorphicWindow.
	self openInWorld.
	self yourself.
			
	self model when: #successfulLogIn send: #changeToStoreClientWindow to: self.
	
	self model when: #failedLogIn send: #showFailedLogInError to: self.
	! !

!LogInWindow methodsFor: 'initialization' stamp: 'ET 7/1/2021 17:53:27'!
showFailedLogInError

	errorMessageMorph contents: self model errorMessage.

	
	! !


!LogInWindow methodsFor: 'GUI building' stamp: 'ET 6/28/2021 20:17:22'!
build1stRow
	| firstRowLayoutMorph |
	
	usernameTextBoxMorph := TextModelMorph textProvider: self model textGetter: #usernameText textSetter: #usernameText:. 
	usernameTextBoxMorph textMorph setProperty: #keyStroke: toValue: [ :key | usernameTextBoxMorph textMorph acceptContents ] .
	usernameTextBoxMorph  borderWidth: 1; borderColor: Color skyBlue; morphWidth: 300; morphHeight: 10.
	
	
	firstRowLayoutMorph := LayoutMorph newRow.
	firstRowLayoutMorph separation: 25;
	axisEdgeWeight: 0.5;
	addMorph: (LabelMorph contents:'Enter username:');
	addMorph: usernameTextBoxMorph.

	^firstRowLayoutMorph.! !

!LogInWindow methodsFor: 'GUI building' stamp: 'ET 6/28/2021 20:17:34'!
build2ndRow
	| secondRowLayoutMorph |
	
	passwordTextBoxMorph := TextModelMorph textProvider: self model textGetter: #passwordText textSetter: #passwordText:. 
	passwordTextBoxMorph textMorph setProperty: #keyStroke: toValue: [ :key | passwordTextBoxMorph textMorph acceptContents ] .
	passwordTextBoxMorph  borderWidth: 1; borderColor: Color skyBlue; morphWidth: 300; morphHeight: 10.
	
	
	secondRowLayoutMorph := LayoutMorph newRow.
	secondRowLayoutMorph separation: 25;
	axisEdgeWeight: 0.5;
	addMorph: (LabelMorph contents:'Enter password:');
	addMorph: passwordTextBoxMorph.

	^secondRowLayoutMorph.! !

!LogInWindow methodsFor: 'GUI building' stamp: 'ET 6/28/2021 20:18:10'!
build3rdRow
	| sendRequestButtonMorph |	
	sendRequestButtonMorph := PluggableButtonMorph model: self model stateGetter: nil action: #createCartRequest  label: 'Create cart'.
	
	
	^sendRequestButtonMorph! !

!LogInWindow methodsFor: 'GUI building' stamp: 'ET 6/28/2021 21:01:23'!
build4thRow
	
	errorMessageMorph := (LabelMorph contents: '').
	^errorMessageMorph.! !

!LogInWindow methodsFor: 'GUI building' stamp: 'ET 6/28/2021 21:01:40'!
buildMorphicWindow
		
	self layoutMorph beColumn;
	separation: 15;
	axisEdgeWeight: 0;
	addMorph: self build1stRow;
	addMorph: self build2ndRow;
	
	addMorph: self build3rdRow;
	
	addMorph: self build4thRow.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LogInWindow class' category: 'TusLibros-Client'!
LogInWindow class
	instanceVariableNames: ''!

!LogInWindow class methodsFor: 'instance creation' stamp: 'ET 6/28/2021 19:54:34'!
open
	
	^self new initializeWith: 'Store Client Window'.! !


!classDefinition: #PurchaseListWindow category: 'TusLibros-Client'!
Panel subclass: #PurchaseListWindow
	instanceVariableNames: 'cartListMorph purchaseListMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Client'!

!PurchaseListWindow methodsFor: 'initialization' stamp: 'ET 7/7/2021 17:50:12'!
defaultExtent

	^ 1052@445
	! !

!PurchaseListWindow methodsFor: 'initialization' stamp: 'ET 7/7/2021 20:28:15'!
initializeWithPurchaseList: aPurchaseList

	self titleMorph showButtonsNamed: #( close collapse ).
	
	self setLabel: 'Purchase List'.
	
	self model: (PurchaseListWindowModel withPurchaseList: aPurchaseList).
	
	self morphExtent: (self defaultExtent).

	self buildMorphicWindow.
	self openInWorld.
	self yourself.
			
	self model when: #cartListChanged send: #updateCartList to: self.
	
	self model when: #cartCheckedOut send: #showTicket to: self.
	
	self model when: #purchaseListRequested send: #showPurchaseList to: self.! !



!PurchaseListWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 19:28:03'!
build1stRow

	purchaseListMorph := PluggableListMorph model: self model listGetter: #purchaseList indexGetter: #purchaseListIndex indexSetter: #purchaseListIndex:.
	purchaseListMorph  borderColor: Color skyBlue; borderWidth: 1; morphWidth:300.

	
	
	^purchaseListMorph.! !

!PurchaseListWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 19:28:25'!
build2ndRow

	^LabelMorph contents: 'Total: ' , self model totalAmount asString.! !

!PurchaseListWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 17:50:12'!
buildMorphicWindow
		
	self layoutMorph beColumn;
	separation: 25;
	axisEdgeWeight: 0;
	addMorph: self build1stRow;
	
	addMorph: self build2ndRow.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PurchaseListWindow class' category: 'TusLibros-Client'!
PurchaseListWindow class
	instanceVariableNames: ''!

!PurchaseListWindow class methodsFor: 'instance creation' stamp: 'ET 7/7/2021 19:23:31'!
openWithPurchaseList: aPurchaseList

	^self new initializeWithPurchaseList: aPurchaseList.! !


!classDefinition: #StoreClientWindow category: 'TusLibros-Client'!
Panel subclass: #StoreClientWindow
	instanceVariableNames: 'catalogListMorph quantityTextBoxMorph cartListMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Client'!

!StoreClientWindow methodsFor: 'initialization' stamp: 'ET 7/7/2021 01:49:39'!
defaultExtent

	^ 1052@445
	! !

!StoreClientWindow methodsFor: 'initialization' stamp: 'ET 7/7/2021 18:18:57'!
initializeWithCartID: cartID username: anUsername password: aPassword

	self titleMorph showButtonsNamed: #( close collapse ).
	
	self setLabel: 'Store Client'.
	
	self model: (StoreClientWindowModel withCartID: cartID username: anUsername password: aPassword).
	
	self morphExtent: (self defaultExtent).

	self buildMorphicWindow.
	self openInWorld.
	self yourself.
			
	self model when: #cartListChanged send: #updateCartList to: self.
	
	self model when: #cartCheckedOut send: #showTicket to: self.
	
	self model when: #purchaseListRequested send: #showPurchaseList to: self.! !


!StoreClientWindow methodsFor: 'access' stamp: 'ET 7/7/2021 19:37:22'!
showPurchaseList

	PurchaseListWindow openWithPurchaseList: self model purchases.! !

!StoreClientWindow methodsFor: 'access' stamp: 'ET 7/7/2021 18:42:30'!
showTicket

	TicketWindow 
		openWithCartID: self model cartID
		ticket: self model ticket
		user: self model user
		password: self model password.
	
	self delete.! !

!StoreClientWindow methodsFor: 'access' stamp: 'ET 7/1/2021 18:10:28'!
updateCartList

	cartListMorph updateList.
	
	cartListMorph setSelectionIndex: 0.! !


!StoreClientWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 01:33:36'!
build1stColumn1stRow

	| colLayoutMorph |
	
	
	catalogListMorph := PluggableListMorph model: self model listGetter: #items indexGetter: #itemsListIndex indexSetter: #itemsListIndex:.
	catalogListMorph  borderColor: Color skyBlue; borderWidth: 1; morphWidth:300.

	colLayoutMorph := LayoutMorph newColumn.
	colLayoutMorph separation: 25;
	axisEdgeWeight: 0;
	addMorph: (LabelMorph contents:'Catalog');
	addMorph: catalogListMorph.

	
	^colLayoutMorph.! !

!StoreClientWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 01:35:22'!
build1stRow

	| rowLayoutMorph |

	rowLayoutMorph := LayoutMorph newRow.
	rowLayoutMorph separation: 25;
	axisEdgeWeight: 0;
	addMorph: self build1stColumn1stRow;
	addMorph: self build2ndColumn1stRow;
	addMorph: self build3rdColumn1stRow.
	
	^rowLayoutMorph.! !

!StoreClientWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 01:33:49'!
build2ndColumn1stRow
	| addToCartButtonMorph colLayoutMorph |
	
	addToCartButtonMorph := PluggableButtonMorph model: self model stateGetter: nil  action: #addItemToCart label: 'add to cart'.		
	quantityTextBoxMorph := TextModelMorph textProvider: self model textGetter: #quantityText textSetter: #quantityText:. 
	quantityTextBoxMorph textMorph setProperty: #keyStroke: toValue: [ :key | quantityTextBoxMorph textMorph acceptContents ] .
	quantityTextBoxMorph  borderWidth: 1; borderColor: Color skyBlue; morphWidth: 100; morphHeight: 10.
	
	
	colLayoutMorph := LayoutMorph newColumn.
	colLayoutMorph separation: 25;
	axisEdgeWeight: 0;
	addMorph: (LabelMorph contents:'quantity to add');
	
	addMorph: quantityTextBoxMorph;
	
	addMorph: addToCartButtonMorph.
	
	^colLayoutMorph.
	! !

!StoreClientWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 01:45:46'!
build2ndRow

	| rowLayoutMorph checkOutButtonMorph listPurchasesButtonMorph |
	checkOutButtonMorph := PluggableButtonMorph model: self model stateGetter: nil  action: #checkOutCartItems label: 'Check out'.	
	listPurchasesButtonMorph := PluggableButtonMorph model: self model stateGetter: nil  action: #listPurchases label: 'List purchases'.	

	rowLayoutMorph := LayoutMorph newRow.
	rowLayoutMorph separation: 50@0;
	axisEdgeWeight: 0.5;
	addMorph: checkOutButtonMorph;
	addMorph: listPurchasesButtonMorph.

	
	^rowLayoutMorph.! !

!StoreClientWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 01:33:56'!
build3rdColumn1stRow
	| colLayoutMorph removeFromCartButtonMorph|
	removeFromCartButtonMorph := PluggableButtonMorph model: self model stateGetter: nil  action: #removeSelectedItemFromCart label: 'remove from cart'.	
	cartListMorph := PluggableListMorph model: self model listGetter: #cartList indexGetter: #cartListIndex indexSetter: #cartListIndex:.
	cartListMorph  borderColor: Color skyBlue; borderWidth: 1; morphWidth:300.

	colLayoutMorph := LayoutMorph newColumn.
	colLayoutMorph separation: 25;
	axisEdgeWeight: 0;
	addMorph: (LabelMorph contents:'Cart list');
	addMorph: cartListMorph;
	addMorph: removeFromCartButtonMorph.

	
	^colLayoutMorph.! !

!StoreClientWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 02:12:48'!
buildMorphicWindow
		
	self layoutMorph beColumn;
	separation: 25;
	axisEdgeWeight: 0;
	addMorph: self build1stRow;
	
	addMorph: self build2ndRow.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StoreClientWindow class' category: 'TusLibros-Client'!
StoreClientWindow class
	instanceVariableNames: ''!

!StoreClientWindow class methodsFor: 'instance creation' stamp: 'ET 7/7/2021 18:18:02'!
openWithCartID: cartID username: anUsername password: aPassword

	^self new initializeWithCartID: cartID username: anUsername password: aPassword.! !


!classDefinition: #TicketWindow category: 'TusLibros-Client'!
Panel subclass: #TicketWindow
	instanceVariableNames: 'ticketListMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Client'!

!TicketWindow methodsFor: 'initialization' stamp: 'ET 7/7/2021 17:49:06'!
defaultExtent

	^ 1052@445
	! !

!TicketWindow methodsFor: 'initialization' stamp: 'ET 7/7/2021 20:36:52'!
initializeWithCartID: cartID ticket: aTicket username: anUsername password: aPassword

	self titleMorph showButtonsNamed: #( close collapse ).
	
	self setLabel: 'Ticket'.
	
	self model: (TicketWindowModel 
				withTicket: aTicket
				username: anUsername
				password: aPassword	).
	
	self morphExtent: (self defaultExtent).

	self buildMorphicWindow.
	self openInWorld.
	self yourself.
	
	self model when: #userWantsToLogOut send: #delete to: self.
	
	self model when: #successfulLogIn send: #changeToStoreClientWindow to: self.
	
	! !


!TicketWindow methodsFor: 'access' stamp: 'ET 7/7/2021 19:01:54'!
changeToStoreClientWindow

	StoreClientWindow openWithCartID: self model cartID username: self model user password: self model password.
	
	self delete.

	
! !


!TicketWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 18:27:56'!
build1stRow
	
	ticketListMorph := PluggableListMorph model: self model listGetter: #ticketList indexGetter: #ticketListIndex indexSetter: #ticketListIndex:.
	ticketListMorph  borderColor: Color skyBlue; borderWidth: 1; morphWidth:300.

	
	
	^ticketListMorph.! !

!TicketWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 18:46:11'!
build2ndRow

	^LabelMorph contents: 'Total: ' , self model totalAmount asString.! !

!TicketWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 18:51:48'!
build3rdRow

	| rowLayoutMorph continueButtonMorph logOutButtonMorph |
	continueButtonMorph := PluggableButtonMorph model: self model stateGetter: nil  action: #createCart label: 'Continue buying'.	
	logOutButtonMorph := PluggableButtonMorph model: self model stateGetter: nil  action: #logOut label: 'Log out'.	

	rowLayoutMorph := LayoutMorph newRow.
	rowLayoutMorph separation: 50@0;
	axisEdgeWeight: 0.5;
	addMorph: continueButtonMorph;
	addMorph: logOutButtonMorph.

	
	^rowLayoutMorph.! !

!TicketWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 18:25:45'!
buildMorphicWindow
		
	self layoutMorph beColumn;
	separation: 25;
	axisEdgeWeight: 0;
	addMorph: self build1stRow;
	
	addMorph: self build2ndRow;
	
	addMorph: self build3rdRow.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicketWindow class' category: 'TusLibros-Client'!
TicketWindow class
	instanceVariableNames: ''!

!TicketWindow class methodsFor: 'instance creation' stamp: 'ET 7/7/2021 18:34:39'!
openWithCartID: cartID 		ticket: aTicket 		user: anUsername password: aPassword

	^self new initializeWithCartID: cartID ticket: aTicket username: anUsername password: aPassword.! !


!classDefinition: #LogInWindowModel category: 'TusLibros-Client'!
Object subclass: #LogInWindowModel
	instanceVariableNames: 'restInterface username password errorMessage cartID'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Client'!

!LogInWindowModel methodsFor: 'initialization' stamp: 'ET 7/7/2021 02:06:43'!
initialize

	restInterface := StoreClientRestInterface new.
	
	username := ''.
	
	password := ''.
	
	errorMessage := ''.! !


!LogInWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ET 6/28/2021 20:52:26'!
errorMessage
	^errorMessage.! !

!LogInWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ET 6/28/2021 20:34:17'!
passwordText
	
	^password.! !

!LogInWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ET 6/28/2021 20:34:05'!
passwordText: aPassword
	
	password := aPassword.
	
	^true.! !

!LogInWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ET 6/28/2021 20:33:29'!
usernameText
	
	^username.! !

!LogInWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ET 6/28/2021 20:33:48'!
usernameText: aUsername
	
	username := aUsername.
	
	^true.! !


!LogInWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 7/1/2021 17:55:14'!
cartID

	^cartID.

	! !

!LogInWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 7/1/2021 17:54:41'!
createCartRequest
	
	[cartID := restInterface createCartFor: username password: password.
	self triggerEvent: #successfulLogIn with: self.]
	on: Error
	do: [:anError | errorMessage := anError messageText.
		self triggerEvent: #failedLogIn with: self.].

	! !


!classDefinition: #PurchaseListWindowModel category: 'TusLibros-Client'!
Object subclass: #PurchaseListWindowModel
	instanceVariableNames: 'selectedIndex items totalAmount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Client'!

!PurchaseListWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 19:38:45'!
purchaseList

	|showList|
	showList := OrderedCollection new.
	items asSet do: [:anItem | showList add: (anItem asString, ' | ', (items occurrencesOf: anItem) asString).].
	
	^showList.
	
	! !

!PurchaseListWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 19:30:48'!
purchaseListIndex

	^selectedIndex.
	
	! !

!PurchaseListWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 19:31:03'!
purchaseListIndex: anIndex

	selectedIndex := anIndex.
	
	^true.
	
	! !


!PurchaseListWindowModel methodsFor: 'initialization' stamp: 'ET 7/7/2021 19:36:08'!
initializeWithPurchaseList: aPurchaseList.

	items := aPurchaseList asOrderedCollection.
	totalAmount := items removeFirst.
	
	selectedIndex := 0.! !


!PurchaseListWindowModel methodsFor: 'Label' stamp: 'ET 7/7/2021 19:32:09'!
totalAmount
	^totalAmount.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PurchaseListWindowModel class' category: 'TusLibros-Client'!
PurchaseListWindowModel class
	instanceVariableNames: ''!

!PurchaseListWindowModel class methodsFor: 'as yet unclassified' stamp: 'ET 7/7/2021 19:25:23'!
withPurchaseList: aPurchaseList

	^self new initializeWithPurchaseList: aPurchaseList.! !


!classDefinition: #StoreClientRestInterface category: 'TusLibros-Client'!
Object subclass: #StoreClientRestInterface
	instanceVariableNames: 'port'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Client'!

!StoreClientRestInterface methodsFor: 'sending requests' stamp: 'ET 7/1/2021 17:43:23'!
addToCart: cartID item: anItem quantity: aQuantity

	| fieldDict resp |
	fieldDict := Dictionary new.
	fieldDict add: 'cartId'->cartID.	
	fieldDict add: 'bookIsbn'->anItem.
	fieldDict add: 'quantityIsbn'->aQuantity.
	
	resp:= WebClient htmlSubmit: (self url,'/addToCart') fields: fieldDict.
	
	resp isSuccess 
		ifTrue:[
			^(WebUtils jsonDecode: ((resp content) readStream)) .] 
		
		ifFalse:[^self error: resp content].! !

!StoreClientRestInterface methodsFor: 'sending requests' stamp: 'ET 7/7/2021 19:50:30'!
catalog


	| resp |
	

	resp:= WebClient htmlSubmit: (self url,'/catalog') fields: Dictionary new.
	
	
	
	resp isSuccess
		ifTrue:[^(WebUtils jsonDecode: ((resp content) readStream)).] 
		
		ifFalse:[^self error: resp content].! !

!StoreClientRestInterface methodsFor: 'sending requests' stamp: 'ET 7/7/2021 02:14:20'!
checkOutCart: cartID

	| fieldDict resp |
	fieldDict := Dictionary new.
	fieldDict add: 'cartId'->cartID.	

	
	resp:= WebClient htmlSubmit: (self url,'/checkOutCart') fields: fieldDict.
	
	resp isSuccess 
		ifTrue:[
			^(WebUtils jsonDecode: ((resp content) readStream)) .] 
		
		ifFalse:[^self error: resp content].! !

!StoreClientRestInterface methodsFor: 'sending requests' stamp: 'ET 7/1/2021 17:45:23'!
createCartFor: aUser password: aPassword

	| fieldDict resp |
	fieldDict := Dictionary new.
	fieldDict add: 'clientId'->aUser.	
	fieldDict add: 'password'->aPassword.
	
	resp:= WebClient htmlSubmit: (self url,'/createCart') fields: fieldDict.
	
	resp isSuccess 
		ifTrue:[^(WebUtils jsonDecode: ((resp content) readStream)) .] 
		
		ifFalse:[^self error: resp content].! !

!StoreClientRestInterface methodsFor: 'sending requests' stamp: 'ET 7/1/2021 18:06:40'!
listCart: cartID

	| fieldDict resp |
	fieldDict := Dictionary new.
	fieldDict add: 'cartId'->cartID.	

	
	resp:= WebClient htmlSubmit: (self url,'/listCart') fields: fieldDict.
	
	resp isSuccess 
		ifTrue:[
			^(WebUtils jsonDecode: ((resp content) readStream)) .] 
		
		ifFalse:[^self error: resp content].! !

!StoreClientRestInterface methodsFor: 'sending requests' stamp: 'ET 7/7/2021 19:21:19'!
listPurchasesOf: anUsername password: aPassword

	| fieldDict resp |
	fieldDict := Dictionary new.
	fieldDict add: 'clientId'->anUsername.	
	fieldDict add: 'password'->aPassword.	

	
	resp:= WebClient htmlSubmit: (self url,'/listPurchases') fields: fieldDict.
	
	resp isSuccess 
		ifTrue:[
			^(WebUtils jsonDecode: ((resp content) readStream)) .] 
		
		ifFalse:[^self error: resp content].! !

!StoreClientRestInterface methodsFor: 'sending requests' stamp: 'ET 7/1/2021 18:36:53'!
removeFromCart: aCartID AllItems: anItem

	| fieldDict resp |
	fieldDict := Dictionary new.
	fieldDict add: 'cartId'->aCartID.	
	fieldDict add: 'bookIsbn'->anItem.

	
	resp:= WebClient htmlSubmit: (self url,'/removeFromCart') fields: fieldDict.
	
	resp isSuccess 
		ifTrue:[
			^(WebUtils jsonDecode: ((resp content) readStream)) .] 
		
		ifFalse:[^self error: resp content].! !

!StoreClientRestInterface methodsFor: 'sending requests' stamp: 'ET 7/7/2021 02:16:25'!
ticketOfTransaction: ticketID

	| fieldDict resp |
	fieldDict := Dictionary new.
	fieldDict add: 'transactionId'-> ticketID.	

	
	resp:= WebClient htmlSubmit: (self url,'/transaction') fields: fieldDict.
	
	resp isSuccess 
		ifTrue:[
			^(WebUtils jsonDecode: ((resp content) readStream)) .] 
		
		ifFalse:[^self error: resp content].! !


!StoreClientRestInterface methodsFor: 'initialization' stamp: 'ET 7/1/2021 17:07:56'!
port
	
	^port ifNil: [port:=8080].! !

!StoreClientRestInterface methodsFor: 'initialization' stamp: 'ET 7/1/2021 17:08:00'!
url
	
	^'http://localhost:', self port asString! !


!classDefinition: #StoreClientWindowModel category: 'TusLibros-Client'!
Object subclass: #StoreClientWindowModel
	instanceVariableNames: 'selectedIndex restInterface items quantity cartID cartList cartListIndex indexedCartList ticket user purchases password indexedKeyItems'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Client'!

!StoreClientWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 19:01:28'!
cartID

	^cartID.
! !

!StoreClientWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/1/2021 18:33:58'!
cartList
	|showList|
	showList := OrderedCollection new.
	indexedCartList := OrderedCollection new.
	cartList asSet do: [:anItem | showList add: (anItem asString, ' | ', (cartList occurrencesOf: anItem) asString).
				                  indexedCartList add: anItem].
	
	^showList.
! !

!StoreClientWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/1/2021 17:37:24'!
cartListIndex
	
	^cartListIndex.! !

!StoreClientWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/1/2021 17:37:44'!
cartListIndex: anIndex
	
	cartListIndex := anIndex.
	
	^true.! !

!StoreClientWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 19:56:59'!
items
	
	|showList|
	showList := OrderedCollection new.
	indexedKeyItems := OrderedCollection new.
	items  keysAndValuesDo: [:aKey :aValue | showList add: (aKey asString, ' - ', aValue asString).
				                  indexedKeyItems add: aKey].
	
	^showList.
! !

!StoreClientWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 6/28/2021 21:42:29'!
itemsListIndex
	
	^selectedIndex.! !

!StoreClientWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 6/28/2021 21:42:35'!
itemsListIndex: anIndex
	
	selectedIndex := anIndex.! !

!StoreClientWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 18:43:15'!
password

	^password.
! !

!StoreClientWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 02:46:37'!
purchases

	^purchases.
! !

!StoreClientWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 02:40:26'!
ticket

	^ticket.
! !

!StoreClientWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 02:40:20'!
user

	^user.
! !


!StoreClientWindowModel methodsFor: 'initialization' stamp: 'ET 7/7/2021 19:52:25'!
initializeWithCartID: aCartID username: anUsername password: aPassword

	cartID := aCartID.
	items := OrderedCollection new.
	cartList := OrderedCollection new.
	user := anUsername.
	password := aPassword.
	selectedIndex := 0.
	restInterface := StoreClientRestInterface new.
	
	items := restInterface catalog.
	
	quantity := ''.
	
	cartListIndex := 0.! !


!StoreClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ET 7/1/2021 17:26:59'!
quantityText

	^quantity.! !

!StoreClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ET 7/1/2021 17:26:46'!
quantityText: aQuantity

	quantity := aQuantity.
	
	^true.! !


!StoreClientWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 7/7/2021 20:29:43'!
addItemToCart
	|selectedItem |
	
	self itemsListIndex = 0 ifTrue: [^self].
	quantity ifEmpty: [^self].
	(quantity allSatisfy: [:aDigit | aDigit isDigit]) ifFalse: [^self].
	
	selectedItem := indexedKeyItems at: self itemsListIndex.
	
	restInterface addToCart: cartID item: selectedItem quantity: quantity.
	
	cartList := restInterface listCart: cartID.
		
	self triggerEvent: #cartListChanged with: self.
	
	
	
	
! !

!StoreClientWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 7/7/2021 20:17:14'!
checkOutCartItems
	|ticketID|
	
	cartList ifEmpty: [^self].
	ticketID := restInterface checkOutCart: cartID.
	
	ticket := restInterface ticketOfTransaction: ticketID.
		
	self triggerEvent: #cartCheckedOut with: self.
	
	
	
	
! !

!StoreClientWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 7/7/2021 19:21:48'!
listPurchases

	purchases := restInterface listPurchasesOf: user password: password.
		
	self triggerEvent: #purchaseListRequested with: self.
	
	
	
	
! !

!StoreClientWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 7/7/2021 20:30:04'!
removeSelectedItemFromCart
	|selectedItem |
	
	cartListIndex = 0 ifTrue: [^self].
	
	selectedItem := indexedCartList at: self cartListIndex.
	
	restInterface removeFromCart: cartID AllItems: selectedItem.
	
	cartList := restInterface listCart: cartID.
		
	self triggerEvent: #cartListChanged with: self.
	
	
	
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StoreClientWindowModel class' category: 'TusLibros-Client'!
StoreClientWindowModel class
	instanceVariableNames: ''!

!StoreClientWindowModel class methodsFor: 'as yet unclassified' stamp: 'ET 7/7/2021 18:20:00'!
withCartID: aCartID username: anUsername password: aPassword

	^self new initializeWithCartID: aCartID username: anUsername password: aPassword.! !


!classDefinition: #TicketWindowModel category: 'TusLibros-Client'!
Object subclass: #TicketWindowModel
	instanceVariableNames: 'restInterface cartID user password ticketItems totalAmount ticketListIndex'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Client'!

!TicketWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 20:40:12'!
cartID

	^cartID.
! !

!TicketWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 18:57:04'!
password

	^password.
! !

!TicketWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 18:47:53'!
ticketList
	|showList|
	showList := OrderedCollection new.
	ticketItems asSet do: [:anItem | showList add: (anItem asString, ' | ', (ticketItems occurrencesOf: anItem) asString).].
	
	^showList.
! !

!TicketWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 18:41:08'!
ticketListIndex
	
	^ticketListIndex.! !

!TicketWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 18:40:59'!
ticketListIndex: anIndex
	
	ticketListIndex := anIndex.
	
	^true.! !

!TicketWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 18:39:19'!
totalAmount

	^totalAmount.
! !

!TicketWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 17:49:27'!
user

	^user.
! !


!TicketWindowModel methodsFor: 'initialization' stamp: 'ET 7/7/2021 20:45:13'!
initializeWithTicket: aTicket username: anUsername password: aPassword.

	user := anUsername.
	password := aPassword.
	ticketItems := aTicket asOrderedCollection.
	totalAmount := ticketItems removeFirst.

	restInterface := StoreClientRestInterface new.
	
	ticketListIndex := 0.! !


!TicketWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 7/7/2021 18:53:21'!
createCart

	cartID := restInterface createCartFor: user password: password.
	self triggerEvent: #successfulLogIn with: self.
	
	
	
	
! !

!TicketWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 7/7/2021 18:49:20'!
logOut
			
	self triggerEvent: #userWantsToLogOut with: self.
	
	
	
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicketWindowModel class' category: 'TusLibros-Client'!
TicketWindowModel class
	instanceVariableNames: ''!

!TicketWindowModel class methodsFor: 'as yet unclassified' stamp: 'ET 7/7/2021 18:35:54'!
withTicket: aTicket 				username: anUsername 				password: aPassword

	^self new initializeWithTicket: aTicket username: anUsername password: aPassword.! !
