!classDefinition: #LogInWindow category: 'TusLibros-Client'!
Panel subclass: #LogInWindow
	instanceVariableNames: 'usernameTextBoxMorph passwordTextBoxMorph errorMessageMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Client'!

!LogInWindow methodsFor: 'initialization' stamp: 'ET 7/7/2021 17:42:09'!
changeToStoreClientWindow
	
	self halt.
	StoreClientWindow openWithCartID: self model cartID username: self model usernameText.
	
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
	instanceVariableNames: 'sentenceTextBoxMorph catalogListMorph quantityTextBoxMorph cartListMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Client'!

!PurchaseListWindow methodsFor: 'initialization' stamp: 'ET 7/7/2021 17:50:12'!
defaultExtent

	^ 1052@445
	! !

!PurchaseListWindow methodsFor: 'initialization' stamp: 'ET 7/7/2021 17:50:12'!
initializeWithCartID: cartID username: anUsername.

	self titleMorph showButtonsNamed: #( close collapse ).
	
	self setLabel: 'Store Client'.
	
	self model: (StoreClientWindowModel withCartID: cartID username: anUsername).
	
	self morphExtent: (self defaultExtent).

	self buildMorphicWindow.
	self openInWorld.
	self yourself.
			
	self model when: #cartListChanged send: #updateCartList to: self.
	
	self model when: #cartCheckedOut send: #showTicket to: self.
	
	self model when: #purchaseListRequested send: #showPurchaseList to: self.! !


!PurchaseListWindow methodsFor: 'access' stamp: 'ET 7/7/2021 17:50:12'!
showPurchaseList
"
	PurchaseListWindow 
		openWithUser: self model user
		purchaseList: self model purchases.
	"
	
	self delete.! !

!PurchaseListWindow methodsFor: 'access' stamp: 'ET 7/7/2021 17:50:12'!
showTicket
"
	TicketWindow 
		openWithCartID: self model cartID
		ticket: self model ticket
		user: self model user.
	
	"
	self delete.! !

!PurchaseListWindow methodsFor: 'access' stamp: 'ET 7/7/2021 17:50:12'!
updateCartList

	cartListMorph updateList.
	
	cartListMorph setSelectionIndex: 0.! !


!PurchaseListWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 17:50:12'!
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

!PurchaseListWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 17:50:12'!
build1stRow

	| rowLayoutMorph |

	rowLayoutMorph := LayoutMorph newRow.
	rowLayoutMorph separation: 25;
	axisEdgeWeight: 0;
	addMorph: self build1stColumn1stRow;
	addMorph: self build2ndColumn1stRow;
	addMorph: self build3rdColumn1stRow.
	
	^rowLayoutMorph.! !

!PurchaseListWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 17:50:12'!
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

!PurchaseListWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 17:50:12'!
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

!PurchaseListWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 17:50:12'!
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

!PurchaseListWindow class methodsFor: 'instance creation' stamp: 'ET 7/7/2021 17:50:12'!
openWithCartID: cartID username: anUsername

	^self new initializeWithCartID: cartID username: anUsername.! !


!classDefinition: #StoreClientWindow category: 'TusLibros-Client'!
Panel subclass: #StoreClientWindow
	instanceVariableNames: 'sentenceTextBoxMorph catalogListMorph quantityTextBoxMorph cartListMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Client'!

!StoreClientWindow methodsFor: 'initialization' stamp: 'ET 7/7/2021 01:49:39'!
defaultExtent

	^ 1052@445
	! !

!StoreClientWindow methodsFor: 'initialization' stamp: 'ET 7/7/2021 02:44:22'!
initializeWithCartID: cartID username: anUsername.

	self titleMorph showButtonsNamed: #( close collapse ).
	
	self setLabel: 'Store Client'.
	
	self model: (StoreClientWindowModel withCartID: cartID username: anUsername).
	
	self morphExtent: (self defaultExtent).

	self buildMorphicWindow.
	self openInWorld.
	self yourself.
			
	self model when: #cartListChanged send: #updateCartList to: self.
	
	self model when: #cartCheckedOut send: #showTicket to: self.
	
	self model when: #purchaseListRequested send: #showPurchaseList to: self.! !


!StoreClientWindow methodsFor: 'access' stamp: 'ET 7/7/2021 17:49:38'!
showPurchaseList
"
	PurchaseListWindow 
		openWithUser: self model user
		purchaseList: self model purchases.
	"
	
	self delete.! !

!StoreClientWindow methodsFor: 'access' stamp: 'ET 7/7/2021 17:54:32'!
showTicket

	TicketWindow 
		openWithCartID: self model cartID
		ticket: self model ticket
		user: self model user.
	
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

!StoreClientWindow class methodsFor: 'instance creation' stamp: 'ET 7/7/2021 02:37:27'!
openWithCartID: cartID username: anUsername

	^self new initializeWithCartID: cartID username: anUsername.! !


!classDefinition: #TicketWindow category: 'TusLibros-Client'!
Panel subclass: #TicketWindow
	instanceVariableNames: 'sentenceTextBoxMorph catalogListMorph quantityTextBoxMorph cartListMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Client'!

!TicketWindow methodsFor: 'initialization' stamp: 'ET 7/7/2021 17:49:06'!
defaultExtent

	^ 1052@445
	! !

!TicketWindow methodsFor: 'initialization' stamp: 'ET 7/7/2021 17:53:46'!
initializeWithCartID: cartID ticket: aTicket username: anUsername.

	self titleMorph showButtonsNamed: #( close collapse ).
	
	self setLabel: 'Store Client'.
	
	self model: TicketWindowModel new.
	
	self morphExtent: (self defaultExtent).

	self buildMorphicWindow.
	self openInWorld.
	self yourself.! !

!TicketWindow methodsFor: 'initialization' stamp: 'ET 7/7/2021 17:49:06'!
initializeWithCartID: cartID username: anUsername.

	self titleMorph showButtonsNamed: #( close collapse ).
	
	self setLabel: 'Store Client'.
	
	self model: (StoreClientWindowModel withCartID: cartID username: anUsername).
	
	self morphExtent: (self defaultExtent).

	self buildMorphicWindow.
	self openInWorld.
	self yourself.
			
	self model when: #cartListChanged send: #updateCartList to: self.
	
	self model when: #cartCheckedOut send: #showTicket to: self.
	
	self model when: #purchaseListRequested send: #showPurchaseList to: self.! !


!TicketWindow methodsFor: 'access' stamp: 'ET 7/7/2021 17:49:55'!
showPurchaseList
! !

!TicketWindow methodsFor: 'access' stamp: 'ET 7/7/2021 17:49:07'!
showTicket
"
	TicketWindow 
		openWithCartID: self model cartID
		ticket: self model ticket
		user: self model user.
	
	"
	self delete.! !

!TicketWindow methodsFor: 'access' stamp: 'ET 7/7/2021 17:49:07'!
updateCartList

	cartListMorph updateList.
	
	cartListMorph setSelectionIndex: 0.! !


!TicketWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 17:49:07'!
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

!TicketWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 17:49:07'!
build1stRow

	| rowLayoutMorph |

	rowLayoutMorph := LayoutMorph newRow.
	rowLayoutMorph separation: 25;
	axisEdgeWeight: 0;
	addMorph: self build1stColumn1stRow;
	addMorph: self build2ndColumn1stRow;
	addMorph: self build3rdColumn1stRow.
	
	^rowLayoutMorph.! !

!TicketWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 17:49:07'!
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

!TicketWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 17:49:07'!
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

!TicketWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 17:49:07'!
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

!TicketWindow methodsFor: 'GUI building' stamp: 'ET 7/7/2021 17:55:58'!
buildMorphicWindow
		
	self layoutMorph beColumn;
	separation: 25;
	axisEdgeWeight: 0;
	addMorph: (LabelMorph contents: 'Check-out done!!!!');
	
	addMorph: (LabelMorph contents: '<this is where your ticket would show up, but its not supported in this version>').! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicketWindow class' category: 'TusLibros-Client'!
TicketWindow class
	instanceVariableNames: ''!

!TicketWindow class methodsFor: 'instance creation' stamp: 'ET 7/7/2021 17:52:24'!
openWithCartID: cartID 		ticket: aTicket 		user: anUsername.

	^self new initializeWithCartID: cartID ticket: aTicket username: anUsername.! !


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
	instanceVariableNames: 'selectedIndex restInterface items quantity cartID cartList cartListIndex indexedCartList ticket user purchases'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Client'!

!PurchaseListWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 17:50:30'!
cartID

	^ticket.
! !

!PurchaseListWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 17:50:30'!
cartList
	|showList|
	showList := OrderedCollection new.
	indexedCartList := OrderedCollection new.
	cartList asSet do: [:anItem | showList add: (anItem asString, ' | ', (cartList occurrencesOf: anItem) asString).
				                  indexedCartList add: anItem].
	
	^showList.
! !

!PurchaseListWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 17:50:30'!
cartListIndex
	
	^cartListIndex.! !

!PurchaseListWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 17:50:30'!
cartListIndex: anIndex
	
	cartListIndex := anIndex.
	
	^true.! !

!PurchaseListWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 17:50:30'!
items
	
	^items.
! !

!PurchaseListWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 17:50:30'!
itemsListIndex
	
	^selectedIndex.! !

!PurchaseListWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 17:50:30'!
itemsListIndex: anIndex
	
	selectedIndex := anIndex.! !

!PurchaseListWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 17:50:30'!
purchases

	^purchases.
! !

!PurchaseListWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 17:50:30'!
ticket

	^ticket.
! !

!PurchaseListWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 17:50:30'!
user

	^user.
! !


!PurchaseListWindowModel methodsFor: 'initialization' stamp: 'ET 7/7/2021 17:50:30'!
initializeWithCartID: aCartID username: anUsername

	cartID := aCartID.
	items := OrderedCollection new.
	cartList := OrderedCollection new.
	user := anUsername.
	selectedIndex := 0.
	restInterface := StoreClientRestInterface new.
	
	items := restInterface catalog.
	
	quantity := ''.
	
	cartListIndex := 0.! !


!PurchaseListWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ET 7/7/2021 17:50:30'!
quantityText

	^quantity.! !

!PurchaseListWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ET 7/7/2021 17:50:30'!
quantityText: aQuantity

	quantity := aQuantity.
	
	^true.! !


!PurchaseListWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 7/7/2021 17:50:30'!
addItemToCart
	|selectedItem |
	
	self itemsListIndex = 0 ifTrue: [^self].
	"self assertQuantityIsPositiveInteger."
	
	selectedItem := (self items) at: self itemsListIndex.
	
	restInterface addToCart: cartID item: selectedItem quantity: quantity.
	
	cartList := restInterface listCart: cartID.
		
	self triggerEvent: #cartListChanged with: self.
	"^cartID"
	
	
	
	
! !

!PurchaseListWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 7/7/2021 17:50:30'!
assertQuantityIsPositiveInteger
	
	(quantity allSatisfy: [:aDigit | aDigit isDigit]) ifFalse: ['no es numero'].
	
	quantity asNumber.
	
	
! !

!PurchaseListWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 7/7/2021 17:50:30'!
checkOutCartItems
	|ticketID|

	ticketID := restInterface checkOutCart: cartID.
	
	ticket := restInterface ticketOfTransaction: ticketID.
		
	self triggerEvent: #cartCheckedOut with: self.
	
	
	
	
! !

!PurchaseListWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 7/7/2021 17:50:30'!
listPurchases

	purchases := restInterface listPurchasesOf: user.
		
	self triggerEvent: #purchaseListRequested with: self.
	
	
	
	
! !

!PurchaseListWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 7/7/2021 17:50:31'!
removeSelectedItemFromCart
	|selectedItem |
	
	"self assertItemIsSelected."
	"self assertQuantityIsPositiveInteger."
	
	selectedItem := indexedCartList at: self cartListIndex.
	
	restInterface removeFromCart: cartID AllItems: selectedItem.
	
	cartList := restInterface listCart: cartID.
		
	self triggerEvent: #cartListChanged with: self.
	"^cartID"
	
	
	
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PurchaseListWindowModel class' category: 'TusLibros-Client'!
PurchaseListWindowModel class
	instanceVariableNames: ''!

!PurchaseListWindowModel class methodsFor: 'as yet unclassified' stamp: 'ET 7/7/2021 17:50:31'!
withCartID: aCartID username: anUsername

	^self new initializeWithCartID: aCartID username: anUsername.! !


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

!StoreClientRestInterface methodsFor: 'sending requests' stamp: 'ET 7/1/2021 17:06:48'!
catalog


	| resp |
	

	resp:= WebClient htmlSubmit: (self url,'/catalog') fields: Dictionary new.
	
	
	
	resp isSuccess
		ifTrue:[^(WebUtils jsonDecode: ((resp content) readStream)) asOrderedCollection.] 
		
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

!StoreClientRestInterface methodsFor: 'sending requests' stamp: 'ET 7/1/2021 17:06:57'!
correctlyEncodeSpacesForUrlRequestParameter: aParameter
	
	
	^ aParameter copyReplaceAll: ' ' with: '%20'. ! !

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

!StoreClientRestInterface methodsFor: 'sending requests' stamp: 'ET 7/1/2021 17:07:44'!
sendRequest: sentence


	| fieldDict resp urlEncodedSentence |

	urlEncodedSentence := self correctlyEncodeSpacesForUrlRequestParameter: sentence.	
	
	fieldDict := Dictionary newFromPairs: {'sentence'. urlEncodedSentence.}.		
	
	resp:= WebClient htmlSubmit: (self url,'/words') fields: fieldDict.
	
	resp isSuccess 
		ifTrue:[^(WebUtils jsonDecode: ((resp content) readStream)) asOrderedCollection .] 
		
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
	instanceVariableNames: 'selectedIndex restInterface items quantity cartID cartList cartListIndex indexedCartList ticket user purchases'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Client'!

!StoreClientWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 17:46:52'!
cartID

	^ticket.
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

!StoreClientWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 6/28/2021 21:42:20'!
items
	
	^items.
! !

!StoreClientWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 6/28/2021 21:42:29'!
itemsListIndex
	
	^selectedIndex.! !

!StoreClientWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 6/28/2021 21:42:35'!
itemsListIndex: anIndex
	
	selectedIndex := anIndex.! !

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


!StoreClientWindowModel methodsFor: 'initialization' stamp: 'ET 7/7/2021 02:42:24'!
initializeWithCartID: aCartID username: anUsername

	cartID := aCartID.
	items := OrderedCollection new.
	cartList := OrderedCollection new.
	user := anUsername.
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


!StoreClientWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 7/1/2021 18:49:16'!
addItemToCart
	|selectedItem |
	
	self itemsListIndex = 0 ifTrue: [^self].
	"self assertQuantityIsPositiveInteger."
	
	selectedItem := (self items) at: self itemsListIndex.
	
	restInterface addToCart: cartID item: selectedItem quantity: quantity.
	
	cartList := restInterface listCart: cartID.
		
	self triggerEvent: #cartListChanged with: self.
	"^cartID"
	
	
	
	
! !

!StoreClientWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 7/1/2021 18:48:10'!
assertQuantityIsPositiveInteger
	
	(quantity allSatisfy: [:aDigit | aDigit isDigit]) ifFalse: ['no es numero'].
	
	quantity asNumber.
	
	
! !

!StoreClientWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 7/7/2021 02:11:14'!
checkOutCartItems
	|ticketID|

	ticketID := restInterface checkOutCart: cartID.
	
	ticket := restInterface ticketOfTransaction: ticketID.
		
	self triggerEvent: #cartCheckedOut with: self.
	
	
	
	
! !

!StoreClientWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 7/7/2021 02:12:00'!
listPurchases

	purchases := restInterface listPurchasesOf: user.
		
	self triggerEvent: #purchaseListRequested with: self.
	
	
	
	
! !

!StoreClientWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 7/1/2021 18:36:06'!
removeSelectedItemFromCart
	|selectedItem |
	
	"self assertItemIsSelected."
	"self assertQuantityIsPositiveInteger."
	
	selectedItem := indexedCartList at: self cartListIndex.
	
	restInterface removeFromCart: cartID AllItems: selectedItem.
	
	cartList := restInterface listCart: cartID.
		
	self triggerEvent: #cartListChanged with: self.
	"^cartID"
	
	
	
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StoreClientWindowModel class' category: 'TusLibros-Client'!
StoreClientWindowModel class
	instanceVariableNames: ''!

!StoreClientWindowModel class methodsFor: 'as yet unclassified' stamp: 'ET 7/7/2021 02:43:07'!
withCartID: aCartID username: anUsername

	^self new initializeWithCartID: aCartID username: anUsername.! !


!classDefinition: #TicketWindowModel category: 'TusLibros-Client'!
Object subclass: #TicketWindowModel
	instanceVariableNames: 'selectedIndex restInterface items quantity cartID cartList cartListIndex indexedCartList ticket user purchases'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Client'!

!TicketWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 17:49:27'!
cartID

	^ticket.
! !

!TicketWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 17:49:27'!
cartList
	|showList|
	showList := OrderedCollection new.
	indexedCartList := OrderedCollection new.
	cartList asSet do: [:anItem | showList add: (anItem asString, ' | ', (cartList occurrencesOf: anItem) asString).
				                  indexedCartList add: anItem].
	
	^showList.
! !

!TicketWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 17:49:27'!
cartListIndex
	
	^cartListIndex.! !

!TicketWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 17:49:27'!
cartListIndex: anIndex
	
	cartListIndex := anIndex.
	
	^true.! !

!TicketWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 17:49:27'!
items
	
	^items.
! !

!TicketWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 17:49:27'!
itemsListIndex
	
	^selectedIndex.! !

!TicketWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 17:49:27'!
itemsListIndex: anIndex
	
	selectedIndex := anIndex.! !

!TicketWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 17:49:27'!
purchases

	^purchases.
! !

!TicketWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 17:49:27'!
ticket

	^ticket.
! !

!TicketWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 7/7/2021 17:49:27'!
user

	^user.
! !


!TicketWindowModel methodsFor: 'initialization' stamp: 'ET 7/7/2021 17:49:27'!
initializeWithCartID: aCartID username: anUsername

	cartID := aCartID.
	items := OrderedCollection new.
	cartList := OrderedCollection new.
	user := anUsername.
	selectedIndex := 0.
	restInterface := StoreClientRestInterface new.
	
	items := restInterface catalog.
	
	quantity := ''.
	
	cartListIndex := 0.! !


!TicketWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ET 7/7/2021 17:49:27'!
quantityText

	^quantity.! !

!TicketWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ET 7/7/2021 17:49:27'!
quantityText: aQuantity

	quantity := aQuantity.
	
	^true.! !


!TicketWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 7/7/2021 17:49:27'!
addItemToCart
	|selectedItem |
	
	self itemsListIndex = 0 ifTrue: [^self].
	"self assertQuantityIsPositiveInteger."
	
	selectedItem := (self items) at: self itemsListIndex.
	
	restInterface addToCart: cartID item: selectedItem quantity: quantity.
	
	cartList := restInterface listCart: cartID.
		
	self triggerEvent: #cartListChanged with: self.
	"^cartID"
	
	
	
	
! !

!TicketWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 7/7/2021 17:49:27'!
assertQuantityIsPositiveInteger
	
	(quantity allSatisfy: [:aDigit | aDigit isDigit]) ifFalse: ['no es numero'].
	
	quantity asNumber.
	
	
! !

!TicketWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 7/7/2021 17:49:27'!
checkOutCartItems
	|ticketID|

	ticketID := restInterface checkOutCart: cartID.
	
	ticket := restInterface ticketOfTransaction: ticketID.
		
	self triggerEvent: #cartCheckedOut with: self.
	
	
	
	
! !

!TicketWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 7/7/2021 17:49:27'!
listPurchases

	purchases := restInterface listPurchasesOf: user.
		
	self triggerEvent: #purchaseListRequested with: self.
	
	
	
	
! !

!TicketWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 7/7/2021 17:49:27'!
removeSelectedItemFromCart
	|selectedItem |
	
	"self assertItemIsSelected."
	"self assertQuantityIsPositiveInteger."
	
	selectedItem := indexedCartList at: self cartListIndex.
	
	restInterface removeFromCart: cartID AllItems: selectedItem.
	
	cartList := restInterface listCart: cartID.
		
	self triggerEvent: #cartListChanged with: self.
	"^cartID"
	
	
	
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicketWindowModel class' category: 'TusLibros-Client'!
TicketWindowModel class
	instanceVariableNames: ''!

!TicketWindowModel class methodsFor: 'as yet unclassified' stamp: 'ET 7/7/2021 17:49:27'!
withCartID: aCartID username: anUsername

	^self new initializeWithCartID: aCartID username: anUsername.! !
