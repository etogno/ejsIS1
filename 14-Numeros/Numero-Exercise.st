!classDefinition: #NumeroTest category: 'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 4/15/2021 16:45:35'!
test27EnteroSubstractsEnteroCorrectly

	self assert: four - one equals: three! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'ET 4/22/2021 00:21:37'!
ifNegativeDo: aBlock

	self subclassResponsibility.! !

!Numero methodsFor: 'testing' stamp: 'ET 4/22/2021 00:21:33'!
ifOneDo: aBlock

	self subclassResponsibility.! !

!Numero methodsFor: 'testing' stamp: 'ET 4/22/2021 00:21:30'!
ifZeroDo: aBlock

	self subclassResponsibility.! !

!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'ET 4/22/2021 00:24:01'!
divideAUnEntero: unDividendo

	self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'ET 4/22/2021 00:24:10'!
divideAUnaFraccion: unDividendo

	self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'ET 4/22/2021 00:24:31'!
multiplicaAUnEntero: aMultiplier

	self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'ET 4/22/2021 00:24:25'!
multiplicaAUnaFraccion: aMultiplier

	self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'ET 4/21/2021 01:01:55'!
nuevoNumeroConNumerador: unNumerador denominador: unDenominador

	| newDenominator newNumerator |

	newNumerator := unNumerador.
	newDenominator := unDenominador.
		
	^Fraccion with: newNumerator over: newDenominator.! !

!Numero methodsFor: 'private' stamp: 'ET 4/22/2021 00:25:10'!
restaAUnEntero: unMinuendo

	self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'ET 4/22/2021 00:25:16'!
restaAUnaFraccion: unMinuendo

	self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'ET 4/22/2021 00:25:22'!
sumaAUnEntero: anAdder

	self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'ET 4/22/2021 00:25:28'!
sumaAUnaFraccion: anAdder

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:02'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero!!!!!!'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:09'!
invalidNumberTypeErrorDescription
	
	^ 'Tipo de n�mero inv�lido!!!!!!'! !


!classDefinition: #Entero category: 'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'arithmetic operations' stamp: 'JA 4/21/2021 17:19:09'!
* aMultiplier 
	
	^aMultiplier multiplicaAUnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JA 4/21/2021 17:19:17'!
+ anAdder

	^anAdder sumaAUnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JA 4/21/2021 17:19:29'!
- aSubtrahend 

	^aSubtrahend restaAUnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JA 4/21/2021 17:19:38'!
/ aDivisor 

	^aDivisor divideAUnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JA 4/21/2021 17:20:07'!
fibonacci

	self subclassResponsibility.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'private' stamp: 'ET 4/21/2021 01:10:29'!
divideAUnEntero: unDividendo
	
	^self nuevoNumeroConNumerador: unDividendo 
		denominador: self.
	! !

!Entero methodsFor: 'private' stamp: 'ET 4/21/2021 01:10:24'!
divideAUnaFraccion: unDividendo

	^self nuevoNumeroConNumerador: unDividendo numerator 
		denominador: unDividendo denominator * self.
	! !

!Entero methodsFor: 'private' stamp: 'ET 4/19/2021 21:02:50'!
multiplicaAUnEntero: aMultiplier 
	
	^self class with: value * aMultiplier integerValue.! !

!Entero methodsFor: 'private' stamp: 'ET 4/20/2021 00:19:58'!
multiplicaAUnaFraccion: aMultiplier 

	^aMultiplier multiplicaAUnEntero: self.
	
	! !

!Entero methodsFor: 'private' stamp: 'ET 4/20/2021 00:02:36'!
restaAUnEntero: unMinuendo

	^ self class with: unMinuendo integerValue - value.
! !

!Entero methodsFor: 'private' stamp: 'ET 4/21/2021 01:11:20'!
restaAUnaFraccion: unMinuendo

	^self nuevoNumeroConNumerador: unMinuendo numerator - (unMinuendo denominator * self)
		denominador: unMinuendo denominator.! !

!Entero methodsFor: 'private' stamp: 'ET 4/19/2021 21:06:32'!
sumaAUnEntero: anAdder

	^self class with: value + anAdder integerValue.! !

!Entero methodsFor: 'private' stamp: 'ET 4/20/2021 00:23:23'!
sumaAUnaFraccion: anAdder

	^anAdder sumaAUnEntero: self.
	
	! !


!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'ET 4/22/2021 00:21:00'!
ifNegativeDo: aBlock

	self subclassResponsibility.
	
	! !

!Entero methodsFor: 'testing' stamp: 'ET 4/22/2021 00:21:13'!
ifOneDo: aBlock

	self subclassResponsibility.! !

!Entero methodsFor: 'testing' stamp: 'ET 4/22/2021 00:21:19'!
ifZeroDo: aBlock

	self subclassResponsibility.
	
	! !

!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/15/2021 16:42:24'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no est� definido aqu� para Enteros Negativos!!!!!!'! !

!Entero class methodsFor: 'instance creation' stamp: 'ET 4/22/2021 00:05:44'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	aValue < 0 ifTrue: [^Negativo new initalizeWith: aValue].
	aValue = 0 ifTrue: [^Cero new initalize].
	aValue = 1 ifTrue: [^Uno new initalize].
	aValue > 1 ifTrue: [^MayorAUno new initalizeWith: aValue].! !


!classDefinition: #Cero category: 'Numero-Exercise'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Cero methodsFor: 'testing' stamp: 'ET 4/22/2021 00:12:13'!
ifNegativeDo: aBlock! !

!Cero methodsFor: 'testing' stamp: 'ET 4/22/2021 00:12:18'!
ifOneDo: aBlock! !

!Cero methodsFor: 'testing' stamp: 'JA 4/21/2021 18:16:20'!
ifZeroDo: aBlock
	aBlock value.! !


!Cero methodsFor: 'initialization' stamp: 'ET 4/22/2021 00:19:45'!
initalize
	"Si bien est� de m�s el colaborador value para instancias de Cero, lo dejamos porque sino tendr�amos que redefinir casi todos los m�todos del protocolo Entero para Cero"
	value := 0.! !


!Cero methodsFor: 'arithmetic operations' stamp: 'ET 4/20/2021 16:26:33'!
fibonacci

	^Entero with: 1.! !


!classDefinition: #NegativoOMayorAUno category: 'Numero-Exercise'!
Entero subclass: #NegativoOMayorAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NegativoOMayorAUno methodsFor: 'initialization' stamp: 'ET 4/22/2021 00:20:30'!
initalizeWith: aValue
	
	value := aValue.! !


!NegativoOMayorAUno methodsFor: 'testing' stamp: 'ET 4/22/2021 00:13:29'!
ifNegativeDo: aBlock
	
	self subclassResponsibility.! !

!NegativoOMayorAUno methodsFor: 'testing' stamp: 'ET 4/22/2021 00:13:43'!
ifOneDo: aBlock! !

!NegativoOMayorAUno methodsFor: 'testing' stamp: 'ET 4/22/2021 00:13:38'!
ifZeroDo: aBlock! !


!NegativoOMayorAUno methodsFor: 'arithmetic operations' stamp: 'ET 4/21/2021 23:59:57'!
fibonacci

	self subclassResponsibility.! !


!classDefinition: #MayorAUno category: 'Numero-Exercise'!
NegativoOMayorAUno subclass: #MayorAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!MayorAUno methodsFor: 'testing' stamp: 'ET 4/22/2021 00:14:02'!
ifNegativeDo: aBlock! !

!MayorAUno methodsFor: 'testing' stamp: 'ET 4/22/2021 00:14:06'!
ifOneDo: aBlock! !

!MayorAUno methodsFor: 'testing' stamp: 'ET 4/22/2021 00:14:09'!
ifZeroDo: aBlock! !


!MayorAUno methodsFor: 'arithmetic operations' stamp: 'ET 4/20/2021 16:27:56'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	^ (self - one) fibonacci + (self - two) fibonacci.! !


!classDefinition: #Negativo category: 'Numero-Exercise'!
NegativoOMayorAUno subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Negativo methodsFor: 'arithmetic operations' stamp: 'ET 4/20/2021 16:28:20'!
fibonacci

	self error: Entero negativeFibonacciErrorDescription.! !


!Negativo methodsFor: 'testing' stamp: 'JA 4/21/2021 18:23:04'!
ifNegativeDo: aBlock
	aBlock value.! !

!Negativo methodsFor: 'testing' stamp: 'ET 4/22/2021 00:15:16'!
ifOneDo: aBlock! !

!Negativo methodsFor: 'testing' stamp: 'ET 4/22/2021 00:15:13'!
ifZeroDo: aBlock! !


!classDefinition: #Uno category: 'Numero-Exercise'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Uno methodsFor: 'arithmetic operations' stamp: 'ET 4/21/2021 23:59:12'!
fibonacci
	^self.! !


!Uno methodsFor: 'initialization' stamp: 'ET 4/22/2021 00:18:30'!
initalize

	"Si bien est� de m�s el colaborador value para instancias de Uno, lo dejamos porque sino tendr�amos que redefinir casi todos los m�todos del protocolo Entero para Uno"

	value := 1.! !


!Uno methodsFor: 'testing' stamp: 'ET 4/22/2021 00:12:55'!
ifNegativeDo: aBlock! !

!Uno methodsFor: 'testing' stamp: 'JA 4/21/2021 18:34:06'!
ifOneDo: aBlock
	aBlock value.! !

!Uno methodsFor: 'testing' stamp: 'ET 4/22/2021 00:12:51'!
ifZeroDo: aBlock! !


!classDefinition: #Fraccion category: 'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JA 4/21/2021 17:20:44'!
* aMultiplier 
	
	^aMultiplier multiplicaAUnaFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JA 4/21/2021 17:20:51'!
+ anAdder 
	
	^anAdder sumaAUnaFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JA 4/21/2021 17:20:59'!
- aSubtrahend 
	^aSubtrahend restaAUnaFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JA 4/21/2021 17:21:06'!
/ aDivisor 

	^aDivisor divideAUnaFraccion: self.! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'JA 4/21/2021 18:42:36'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator ifZeroDo: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator ifOneDo: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'private' stamp: 'ET 4/21/2021 01:05:42'!
divideAUnEntero: unDividendo

	^self nuevoNumeroConNumerador: unDividendo * denominator 
		denominador: numerator.
	! !

!Fraccion methodsFor: 'private' stamp: 'ET 4/21/2021 01:06:20'!
divideAUnaFraccion: unDividendo

	^self nuevoNumeroConNumerador: unDividendo numerator * denominator
		denominador: unDividendo denominator *  numerator.! !

!Fraccion methodsFor: 'private' stamp: 'ET 4/21/2021 01:06:55'!
multiplicaAUnEntero: unEntero

	^self nuevoNumeroConNumerador: unEntero * numerator
		denominador: denominator.! !

!Fraccion methodsFor: 'private' stamp: 'ET 4/21/2021 01:07:33'!
multiplicaAUnaFraccion: aMultiplier

	^self nuevoNumeroConNumerador: aMultiplier numerator * numerator
		denominador: aMultiplier denominator * denominator.
	! !

!Fraccion methodsFor: 'private' stamp: 'ET 4/21/2021 01:08:00'!
restaAUnEntero: unMinuendo

	^self nuevoNumeroConNumerador: unMinuendo * denominator - numerator
		denominador: denominator.! !

!Fraccion methodsFor: 'private' stamp: 'ET 4/21/2021 01:08:44'!
restaAUnaFraccion: unMinuendo

	^self nuevoNumeroConNumerador: unMinuendo numerator * denominator - (unMinuendo denominator * numerator)
		denominador: unMinuendo denominator * denominator.! !

!Fraccion methodsFor: 'private' stamp: 'ET 4/21/2021 01:09:24'!
sumaAUnEntero: anAdder 
	
	^self nuevoNumeroConNumerador: denominator * anAdder + numerator
		denominador: denominator.! !

!Fraccion methodsFor: 'private' stamp: 'ET 4/21/2021 01:09:57'!
sumaAUnaFraccion: anAdder
	
	^self nuevoNumeroConNumerador: anAdder denominator * numerator + (anAdder numerator * denominator)
		denominador: anAdder denominator * denominator.! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'JA 4/21/2021 18:37:45'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor ifZeroDo: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend ifZeroDo: [ ^aDividend ].
	
	aDivisor ifNegativeDo: 	[ ^aDividend negated / aDivisor negated].
		
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
		
	denominator ifOneDo: [ ^numerator ].
	
	^self new initializeWith: numerator over: denominator
	! !
