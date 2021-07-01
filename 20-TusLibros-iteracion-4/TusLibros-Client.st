!classDefinition: #LogInWindow category: 'TusLibros-Client'!
Panel subclass: #LogInWindow
	instanceVariableNames: 'usernameTextBoxMorph passwordTextBoxMorph wordsListMorph errorMessageMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Client'!

!LogInWindow methodsFor: 'initialization' stamp: 'ET 7/1/2021 17:57:45'!
changeToStoreClientWindow
	

	StoreClientWindow openWith: self model cartID.
	
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


!LogInWindow methodsFor: 'access' stamp: 'ET 6/28/2021 19:53:40'!
refreshListOfWords
	
	wordsListMorph updateList.
	wordsListMorph setSelectionIndex: 0.
	! !


!LogInWindow methodsFor: 'GUI building' stamp: 'ET 6/28/2021 19:53:40'!
build1stColumn2ndRow
	| firstColumnLayoutMorphOfSecondRow |
	
	wordsListMorph := PluggableListMorph model: self model listGetter: #words indexGetter: #wordsListIndex indexSetter: #wordsListIndex:.
	wordsListMorph  borderColor: Color skyBlue; borderWidth: 1; morphWidth:300.
		
	firstColumnLayoutMorphOfSecondRow := LayoutMorph newColumn.
	firstColumnLayoutMorphOfSecondRow separation: 5; 
	axisEdgeWeight: 0.5;
	addMorph: (LabelMorph contents:'Results');
	addMorph: wordsListMorph.
	
	"Dos opciones para jugar con los layouts... ¿Qué diferencia hay?"
	firstColumnLayoutMorphOfSecondRow layoutSpec fixedWidth: 390.
	"wordsListMorph layoutSpec proportionalWidth: 100.
	wordsListMorph layoutSpec proportionalHeight: 100."
		
	^firstColumnLayoutMorphOfSecondRow.
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


!classDefinition: #StoreClientWindow category: 'TusLibros-Client'!
Panel subclass: #StoreClientWindow
	instanceVariableNames: 'sentenceTextBoxMorph wordsListMorph cartID quantityTextBoxMorph cartListMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Client'!

!StoreClientWindow methodsFor: 'initialization' stamp: 'NR 6/22/2021 08:25:04'!
defaultExtent

	^ 1035@485
	! !

!StoreClientWindow methodsFor: 'initialization' stamp: 'ET 7/1/2021 18:09:16'!
initializeWith: aCartID

	self titleMorph showButtonsNamed: #( close collapse ).
	
	self setLabel: 'Store Client'.
	
	self model: (StoreClientWindowModel with: aCartID).
	
	self morphExtent: (self defaultExtent).

	self buildMorphicWindow.
	self openInWorld.
	self yourself.
			
	self model when: #cartListChanged send: #updateCartList to: self.! !

!StoreClientWindow methodsFor: 'initialization' stamp: 'ET 7/1/2021 18:10:28'!
updateCartList

	cartListMorph updateList.
	
	cartListMorph setSelectionIndex: 0.! !


!StoreClientWindow methodsFor: 'access' stamp: 'NR 6/23/2021 06:58:02'!
refreshListOfWords
	
	wordsListMorph updateList.
	wordsListMorph setSelectionIndex: 0.
	! !


!StoreClientWindow methodsFor: 'GUI building' stamp: 'ET 6/28/2021 21:42:04'!
build1stColumn
	| firstRowLayoutMorph |
	
	wordsListMorph := PluggableListMorph model: self model listGetter: #items indexGetter: #itemsListIndex indexSetter: #itemsListIndex:.
	wordsListMorph  borderColor: Color skyBlue; borderWidth: 1; morphWidth:300.

	firstRowLayoutMorph := LayoutMorph newColumn.
	firstRowLayoutMorph separation: 25;
	axisEdgeWeight: 0;
	addMorph: (LabelMorph contents:'Catalog');
	addMorph: wordsListMorph.

	
	^firstRowLayoutMorph.! !

!StoreClientWindow methodsFor: 'GUI building' stamp: 'NR 6/28/2021 19:01:09'!
build1stColumn2ndRow
	| firstColumnLayoutMorphOfSecondRow |
	
	wordsListMorph := PluggableListMorph model: self model listGetter: #words indexGetter: #wordsListIndex indexSetter: #wordsListIndex:.
	wordsListMorph  borderColor: Color skyBlue; borderWidth: 1; morphWidth:300.
		
	firstColumnLayoutMorphOfSecondRow := LayoutMorph newColumn.
	firstColumnLayoutMorphOfSecondRow separation: 5; 
	axisEdgeWeight: 0.5;
	addMorph: (LabelMorph contents:'Results');
	addMorph: wordsListMorph.
	
	"Dos opciones para jugar con los layouts... ¿Qué diferencia hay?"
	firstColumnLayoutMorphOfSecondRow layoutSpec fixedWidth: 390.
	"wordsListMorph layoutSpec proportionalWidth: 100.
	wordsListMorph layoutSpec proportionalHeight: 100."
		
	^firstColumnLayoutMorphOfSecondRow.
	! !

!StoreClientWindow methodsFor: 'GUI building' stamp: 'NR 6/28/2021 18:34:12'!
build1stRow
	| sendRequestButtonMorph firstRowLayoutMorph |
	
	sendRequestButtonMorph := PluggableButtonMorph model: self model stateGetter: nil action: #sendWordsFromSentenceRequest  label: 'Send Request To Server'.
	
	sentenceTextBoxMorph := TextModelMorph textProvider: self model textGetter: #sentenceText textSetter: #sentenceText:. 
	sentenceTextBoxMorph textMorph setProperty: #keyStroke: toValue: [ :key | sentenceTextBoxMorph textMorph acceptContents ] .
	sentenceTextBoxMorph  borderWidth: 1; borderColor: Color skyBlue; morphWidth: 300. 
		
	firstRowLayoutMorph := LayoutMorph newRow.
	firstRowLayoutMorph separation: 25;
	axisEdgeWeight: 0.5;
	addMorph: (LabelMorph contents:'Enter sentence:');
	addMorph: sentenceTextBoxMorph;
 	addMorph: sendRequestButtonMorph.
	
	^firstRowLayoutMorph.! !

!StoreClientWindow methodsFor: 'GUI building' stamp: 'ET 7/1/2021 18:56:46'!
build2ndColumn
	| showInTranscriptButtonMorph secondRowLayoutMorph |
	
	showInTranscriptButtonMorph := PluggableButtonMorph model: self model stateGetter: nil  action: #addItemToCart label: 'add to cart'.		
	quantityTextBoxMorph := TextModelMorph textProvider: self model textGetter: #quantityText textSetter: #quantityText:. 
	quantityTextBoxMorph textMorph setProperty: #keyStroke: toValue: [ :key | quantityTextBoxMorph textMorph acceptContents ] .
	quantityTextBoxMorph  borderWidth: 1; borderColor: Color skyBlue; morphWidth: 100; morphHeight: 10.
	
	
	secondRowLayoutMorph := LayoutMorph newColumn.
	secondRowLayoutMorph separation: 25;
	axisEdgeWeight: 0;
	addMorph: (LabelMorph contents:'quantity to add');
	
	addMorph: quantityTextBoxMorph;
	
	addMorph: showInTranscriptButtonMorph.
	
	^secondRowLayoutMorph.
	! !

!StoreClientWindow methodsFor: 'GUI building' stamp: 'NR 6/23/2021 06:37:31'!
build2ndRow
	| showInTranscriptButtonMorph secondRowLayoutMorph |
	
	showInTranscriptButtonMorph := PluggableButtonMorph model: self model stateGetter: nil  action: #showWordInTranscript label: 'Show Selected Word In Transcript'.	
	
	secondRowLayoutMorph := LayoutMorph newRow.
	secondRowLayoutMorph separation: 25;
	axisEdgeWeight: 0.5;
	addMorph: self build1stColumn2ndRow;
	addMorph: showInTranscriptButtonMorph.
	
	^secondRowLayoutMorph.
	! !

!StoreClientWindow methodsFor: 'GUI building' stamp: 'ET 7/1/2021 18:28:56'!
build3rdColumn
	| firstRowLayoutMorph showInTranscriptButtonMorph|
	showInTranscriptButtonMorph := PluggableButtonMorph model: self model stateGetter: nil  action: #removeSelectedItemFromCart label: 'remove from cart'.	
	cartListMorph := PluggableListMorph model: self model listGetter: #cartList indexGetter: #cartListIndex indexSetter: #cartListIndex:.
	cartListMorph  borderColor: Color skyBlue; borderWidth: 1; morphWidth:300.

	firstRowLayoutMorph := LayoutMorph newColumn.
	firstRowLayoutMorph separation: 25;
	axisEdgeWeight: 0;
	addMorph: (LabelMorph contents:'Cart list');
	addMorph: cartListMorph;
	addMorph: showInTranscriptButtonMorph.

	
	^firstRowLayoutMorph.! !

!StoreClientWindow methodsFor: 'GUI building' stamp: 'ET 6/28/2021 21:34:24'!
buildMorphicWindow
		
	self layoutMorph beRow;
	separation: 15;
	axisEdgeWeight: 0;
	addMorph: self build1stColumn;
	addMorph: self build2ndColumn;
	
	addMorph: self build3rdColumn.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StoreClientWindow class' category: 'TusLibros-Client'!
StoreClientWindow class
	instanceVariableNames: ''!

!StoreClientWindow class methodsFor: 'instance creation' stamp: 'NR 6/23/2021 06:32:18'!
open
	
	^self new initializeWith: 'Words-Service Client Window'.! !

!StoreClientWindow class methodsFor: 'instance creation' stamp: 'ET 7/1/2021 17:59:19'!
openWith: cartID

	^self new initializeWith: cartID.! !


!classDefinition: #LogInWindowModel category: 'TusLibros-Client'!
Object subclass: #LogInWindowModel
	instanceVariableNames: 'sentence words selectedIndex restInterface username password errorMessage acartID cartID'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Client'!

!LogInWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 6/28/2021 20:31:13'!
words
	
	^words.
! !

!LogInWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 6/28/2021 20:31:13'!
wordsListIndex
	
	^selectedIndex.! !

!LogInWindowModel methodsFor: 'PluggableListSelectors' stamp: 'ET 6/28/2021 20:31:13'!
wordsListIndex: anIndex
	
	selectedIndex := anIndex.! !


!LogInWindowModel methodsFor: 'initialization' stamp: 'ET 6/28/2021 20:33:07'!
initialize

	words := OrderedCollection new.
	sentence := ''.
	selectedIndex := 0.
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

!LogInWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ET 6/28/2021 20:31:13'!
sentenceText
	
	^sentence.! !

!LogInWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ET 6/28/2021 20:31:13'!
sentenceText: aSentence

	sentence := aSentence.
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

!LogInWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 6/28/2021 20:31:14'!
sendWordsFromSentenceRequest
		
	words := restInterface sendRequest: sentence.
	
	self triggerEvent: #newWordsArrived with: self.
	! !

!LogInWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ET 6/28/2021 20:31:14'!
showWordInTranscript
	
	(selectedIndex = 0) ifFalse: 
		[TranscriptWindow openTranscript.
		Transcript clear.
		Transcript show: 'The word selected is: '.
		Transcript show: (words at: selectedIndex).
		Transcript show: ' '.].
! !


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


!StoreClientRestInterface methodsFor: 'initialization' stamp: 'ET 7/1/2021 17:07:56'!
port
	
	^port ifNil: [port:=8080].! !

!StoreClientRestInterface methodsFor: 'initialization' stamp: 'ET 7/1/2021 17:08:00'!
url
	
	^'http://localhost:', self port asString! !


!classDefinition: #StoreClientWindowModel category: 'TusLibros-Client'!
Object subclass: #StoreClientWindowModel
	instanceVariableNames: 'sentence words selectedIndex restInterface items quantity cartID cartList cartListIndex indexedCartList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Client'!

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

!StoreClientWindowModel methodsFor: 'PluggableListSelectors' stamp: 'NR 6/23/2021 06:56:13'!
words
	
	^words.
! !

!StoreClientWindowModel methodsFor: 'PluggableListSelectors' stamp: 'NR 6/23/2021 06:56:37'!
wordsListIndex
	
	^selectedIndex.! !

!StoreClientWindowModel methodsFor: 'PluggableListSelectors' stamp: 'NR 6/23/2021 06:56:49'!
wordsListIndex: anIndex
	
	selectedIndex := anIndex.! !


!StoreClientWindowModel methodsFor: 'initialization' stamp: 'ET 6/28/2021 21:43:20'!
initialize
	items := OrderedCollection new.
	
	words := OrderedCollection new.
	sentence := ''.
	selectedIndex := 0.
	restInterface := StoreClientRestInterface new.
	
	items := restInterface catalog.! !

!StoreClientWindowModel methodsFor: 'initialization' stamp: 'ET 7/1/2021 18:22:30'!
initializeWith: aCartID
	cartID := aCartID.
	items := OrderedCollection new.
	cartList := OrderedCollection new.
	words := OrderedCollection new.
	sentence := ''.
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

!StoreClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'NR 6/25/2019 21:43:32'!
sentenceText
	
	^sentence.! !

!StoreClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'NR 6/23/2021 07:08:56'!
sentenceText: aSentence

	sentence := aSentence.
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

!StoreClientWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'NR 6/23/2021 07:56:07'!
sendWordsFromSentenceRequest
		
	words := restInterface sendRequest: sentence.
	
	self triggerEvent: #newWordsArrived with: self.
	! !

!StoreClientWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'NR 6/23/2021 06:51:02'!
showWordInTranscript
	
	(selectedIndex = 0) ifFalse: 
		[TranscriptWindow openTranscript.
		Transcript clear.
		Transcript show: 'The word selected is: '.
		Transcript show: (words at: selectedIndex).
		Transcript show: ' '.].
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StoreClientWindowModel class' category: 'TusLibros-Client'!
StoreClientWindowModel class
	instanceVariableNames: ''!

!StoreClientWindowModel class methodsFor: 'as yet unclassified' stamp: 'ET 7/1/2021 17:31:31'!
with: aCartID

	^self new initializeWith: aCartID.! !
