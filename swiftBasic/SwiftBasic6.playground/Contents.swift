import UIKit

/*
    클로저 기본
    1. 클로저
      -> 클로저는 실행가능한 코드 블럭.
      -> 함수와는 다르게 이름의 정의는 필요하지 않지만, 매개변수 전달과 반환 값이 존재 할 수 있다는 점이 동일.
      -> 함수는 이름이 있는 클로저.
      -> 일급객체로 전달인자,변수,상수 등에 저장 및 전달이 가능.
 
    2. 기본 클로저 문법
      -> 클로저는 중괄호 {}로 감싸져있다.
      -> 괄호를 이용해 파라미터를 정의.
      -> ->을 이용해 반환타입을 명시.
      -> "in"키워드를 이용해 실행코드와 분리.
 */

// sum이라는 상수에 클로저를 할당
let sum : (Int,Int) -> Int = {
    (a:Int, b:Int) in
    return a+b
}

let sumResult = sum(1,2)
print(sumResult)

// 함수의 전달인자로서의 클로저
// -> 클로저는 주로 함수의 전달인자로 많이 사용됨.
// -> 함수 내부에서 원하는 코드블럭을 실행 할 수 있음.
let add : (Int,Int) -> Int
add = {(a:Int,b:Int) in
    return a+b
}
let substract : (Int,Int) -> Int
substract = {(a:Int,b:Int) in
    return a-b
}
let divide : (Int,Int) -> Int
divide = {(a:Int,b:Int) in
    return a/b
}

func calculate(a:Int,b:Int,method:(Int,Int)->Int) -> Int{
    return method(a,b)
}

var calculated:Int
calculated = calculate(a: 50, b: 10, method: add)
print(calculated)

calculated = calculate(a: 50, b: 10, method: substract)
print(calculated)

calculated = calculate(a: 50, b: 10, method: divide)
print(calculated)

// 따로 클러저를 상수/변수에 넣어 전달하지 않고,
// 함수를 호출할 때 클로저를 작성하여 전달 할 수도 있음.
calculated = calculate(a: 10, b: 100, method: {(a:Int,b:Int)->Int in
    return a*b
})
print(calculated)

// 클로저 고급 - 다양한 클로저 표현
// 클로저는 아래 규칙을 통해 다양한 모습으로 표현.
// 1. 후행 클로저 : 함수의 매개변수 마지막으로 전달되는 클로저는 후행클로저(trailing closure)로 함수 밖에서 구현할 수 있음.
// 2. 반환타입 생략 : 컴파일러가 클로저의 타입을 유추할 수 있는 경우 매개변수,반환 타입을 생략할 수 있음.
// 3. 단축 인자 이름: 전달자의 이름이 굳이 필요없고, 컴파일러가 타입을 유추할 수 있는 경우 축약된 전달인자 이름($0,$1,$3..)을 사용 할 수 있음.
// 4. 암시적 반환 표현 : 반환 값이 있는 경우, 암시적으로 클러저의 맨 마지막 줄은 return키워드를 생략하더라도 반환 값으로 취급.
// 기본적인 클로저 표현
func cl1(a:Int,b:Int,method:(Int,Int)->Int) -> Int {
    return method(a,b)
}
var result:Int
// 후행 클로저
// 클로저가 함수의 마지막 전달인자일때, 마지막 매개변수 이름을 생략한 후 함수 외부에 클로저를 구현할수 있다.
result = cl1(a: 10, b: 10)  {(left:Int,right:Int)->Int in
    return left+right
}
print(result)

result = cl1(a: 30, b: 30){(a:Int,b:Int)->Int in
    return a*b
}
print(result)

result = cl1(a: 100, b: 20){(a:Int,b:Int) -> Int in
    return a/b
}
print(result)

// 반환타입 생략
// cl1(a:b:method:)함수의 method 매개변수 Int타입을 반환할 것이라는 사실을 컴파일러도 알것.
// 클로저에서 반환타입을 명시해 주지 않아도 됨. 대신 in 키워드는 생략불가.
func cl2(a:Int,b:Int,method:(Int,Int)->Int) -> Int{
    return method(a,b)
}
var result2:Int
result2 = cl2(a: 30, b: 30){(a:Int,b:Int) in
    return a+b
}
print(result2)
result2 = cl2(a: 40, b: 30){(a:Int,b:Int) in
    return a*b
}
print(result2)
result2 = cl2(a: 100, b: 10){(a:Int,b:Int) in
    return a/b
}
print(result2)
result2 = cl2(a: 30, b: 30, method: {(a:Int,b:Int) in return a*b*100})
print(result2)

// 단축 인자이름
// 클로저의 매개변수 이름이 굳이 불필요하다면 단축 인자이름을 활용 할 수 있음.
// 단축 인자이름은 클로저의 매개변수의 순서대로 $0,$1,$2 ... 처럼 표현됨.
func cl3(a:Int,b:Int,method:(Int,Int)->Int)->Int{
    return method(a,b)
}
var result3:Int
result3 = cl3(a: 10, b: 10, method: {return $0 + $1})
print(result3)
result3 = cl3(a: 20, b: 20){return $0 * $1}
print(result3)
result3 = cl3(a: 100, b: 20){return $0 * $1 / 200}
print(result3)

// 암시적 반환 표현
// 클로저가 반환하는 값이 있다면 클로저의 마지막 줄의 결과값은 암시적으로 반환값으로 취급.
func cl4(a:Int,b:Int,method:(Int,Int)->Int) -> Int{
    return method(a,b)
}
var result4:Int
result4 = cl4(a: 10, b: 10){$0+$1}
print(result4)
result4 = cl4(a: 100, b: 200){$0*$1}
print(result4)

// 축약 전과 후 비교
// 축약 전
func cl5(a:Int,b:Int,method:(Int,Int)->Int)->Int{
    return method(a,b)
}
var result5:Int
result5 = cl5(a: 10, b: 10, method: {(aa:Int,bb:Int)->Int in return aa+bb})
print(result5)

result5 = cl5(a: 20, b: 30){$0 * $1}
print(result5)




















