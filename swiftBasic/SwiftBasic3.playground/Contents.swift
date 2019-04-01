import UIKit
/*
 1.Swift의 기본 데이터 타입
    (1).Bool
    (2).Int,UInt
    (3).Float,Double
    (4).Character,String
 */

// 2. Bool
var someBool : Bool = true
someBool = false
// someBool = 0 컴파일 오류발생
// someBool = 1 컴파일 오류발생
print(someBool)

// 3.Int,UInt
// Int:정수 타입. 현재는 기본적으로 64비트 정수형
// UInt:양의 정수 타입. 현재는 기본적으로 64비트 정수형.
// Int
var someInt : Int = -100
// someInt = 100.1 컴파일 오류 발생

// UInt
var someUInt : UInt = 100
// someUInt = -100 컴파일 오류발생
// someUInt = someInt 컴파일 오류발생

// 4.Float,Double
// Float : 실수 타입, 32비트 부동소수형
// Double : 실수 타입, 64비트 부동소수형
// Float
var someFloat : Float = 3.14
someFloat = 3
print(someFloat)

// Double
var someDouble : Double = 3.14
someDouble = 3
print(someDouble)
// someDouble = someFloat 컴파일 오류 발생

// 5.Character, String
// Character : 문자 타입, 유니코드 사용. 큰따옴표("") 사용.
// String : 문자열 타입, 유니코드 사용. 큰따옴표("") 사용.

// Character
var someCharacter :  Character = "🇰🇷"
someCharacter = "😄"
print(someCharacter)
someCharacter = "가"
print(someCharacter)
someCharacter = "A"
print(someCharacter)
// someCharacter = "하하하" 컴파일 오류 발생
print(someCharacter)

// String
var someString : String = "하하하 😄"
someString = someString + "웃으면 복이와요"
print(someString)

// someString = someChracter 컴파일 오류발생

// let integer = 100
let integer : UInt = 100
let integer2 : Int = 100 
// let floatingPoint = 12.34
let floatingPoint : Float = 12.34
let floatingPoint2 : Double = 12.34
// let apple = "A"
let apple : Character = "A"
let apple2 : String = "A"
