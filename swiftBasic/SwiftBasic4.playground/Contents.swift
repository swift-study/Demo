import UIKit

/*
 1. Any : Swift의 모든 타입을 지칭하는 키워드
 2. AnyObject : 모든 클래스 타입을 지칭하는 프로토콜
 3. nil : '없음'을 의미하는 키워드
 */
// 1. Any
var someAny : Any  = 100
someAny = "어떤 타입도 수용 가능합니다"
someAny = 123.12

// Any 타입에 Double 자료를 넣어두었더라도 Any는 Double 타입이 아니기 때문에 할당할수 없음.
// 명시적으로 타입을 변환해주어야됨.
//let someDouble : Double = someAny 컴파일오류

// 2. AnyObject
class SomeClass{}
var someAnyObject : AnyObject = SomeClass()

// AnyObject는 클래스의 인스턴스만 수용 가능하기 때문에 클래스의 인스턴스가 아니면 할당할 수 없습니다.
//someAnyObject = 123.122

// 3.nill
// someAny2는 Any타입이고, someAnyObject는 AnyObject타입 이기 때문에 nil을 할당할 수 없음.
var someAny2 : Any = 100
var someAnyObject2 : AnyObject = SomeClass()
//someAny2 = nil
//someAnyObject2 = nil

/*
  Array - 순서가 있는 리스트 컬렉션
  Dictionary - '키'와'값'의 쌍으로 이루어진 컬렉션
  Set - 순서가 없고, 멤버가 유일한 컬렉션 (중복허용 안함)
 */

 // 1. Array
 // 멤버가 순서(인덱스)를 가진 리스트 형태의 컬렉션 타입
 // 여러가지 리터럴 문법을 활용할 수 있어 표현 방법이 다양.

 // 선언
 var integers : Array<Int> = Array<Int>()
 var integers2 : Array<Int> = [Int]()
 var integers3 : Array<Int> = []
 var integers4 : [Int] = Array<Int>()
 var integers5 : [Int] = [Int]()
 var integers6 = [Int]()

 // 활용
 integers.append(100)
 integers.append(1)
 // Error because not Integer type
 // integers.append(100.1)
 print(integers)
 // 멤버 포함 여부 확인
 print(integers.contains(20))
 print(integers.contains(100))

 // 멤버 교체
 integers[0] = 200

 // 멤버 삭제
 integers.remove(at: 0)
 integers.removeLast()
 integers.removeAll()

 // 멤버 수 확인
 print(integers.count)

 // 인덱스를 벗어나 접근하려면 익셉션 런타임 오류발생
 //integers[0]

 // 불변 Array: let을 사용하여 Array선언
 let immutableArray = [1,2,3]

 // 수정이 불가능한 Array이므로 멤버를 추가하거나 삭제하는것이 불가능.
 //immutableArray.append(contentsOf: 4)
 //mmutableArray.removeAll()

 // 2.Dictionary
 // 'key'와'Value'의 쌍으로 이루어진 컬렉션 타입
 // Array와 비슷하게 여러가지 리터럴 문법을 활용할 수 있음.

 // 선언과 생성
 // key = String Value = Any
 var anyDictionary : Dictionary<String,Any> = [String:Any]()
 var anyDictionary2 : Dictionary<String,Any> = Dictionary<String,Any>()
 var anyDictionary3 : Dictionary<String,Any> = [:]
 var anyDictionary4 : [String:Any] = Dictionary<String,Any>()
 var anyDictionary5 : [String:Any] = [String:Any]()
 var anyDictionary6 : [String:Any] = [:]
 var anyDictionary7 = [String:Any]()

 anyDictionary["someKey"] = "value"
 anyDictionary["anotherKey"] = 100
 print(anyDictionary)
 // key 에 해당하는 value변경
 anyDictionary["someKey"] = "dictionary"
 print(anyDictionary)
 // key 에 해당하는 값 제거
 anyDictionary.removeValue(forKey: "someKey")
 anyDictionary["anotherKey"] = nil
 print(anyDictionary)

 // 불변 Dictionary let 을 사용하여 Dictionary선언
 let emptyDictionary : [String:String] = [:]
 let initalizedDictionary : [String:String] = ["name":"show","gender":"male"]

 // 불변 이므로 값 변경 불가
 // initalizedDictionary["name"] = nil
 // "name" 이라는 키에 해당하는 값이 없을 수도 있으므로 String 타입의 값이 나올 것이라는 보장이 없음.
 //  컴파일 오류
 // let someValue:String = initalizedDictionary["name"]

 // Set
 // 중복되지 않는 멤버가 순서없이 존재하는 컬렉션
 // Array,Dictionary와 다르게 축약형이 존재하지 않음
 // 생성
 var integerSet:Set<Int> = Set<Int>()
 // 새로운 멤버 입력
 // 동일한 값은 여러번 입력해도 한번만저장됨.
 integerSet.insert(1)
 integerSet.insert(99)
 integerSet.insert(99)
 integerSet.insert(99)
 integerSet.insert(100)
 print(integerSet)
 // 포함여부 확인
 print(integerSet.contains(1))
 print(integerSet.contains(99))
 // 삭제
 integerSet.remove(99)
 integerSet.removeFirst()
 // 멤버 갯수
 print(integerSet.count)

 // Set의 활용
 // 멤버의 유일성이 보장되기 때문에 집합 연산에 활용하면 유용
 let setA : Set<Int> = [1,2,3,4,5]
 let setB : Set<Int> = [3,4,5,6,7]

 // 합집합
 let union : Set<Int> = setA.union(setB)
 print(union)

 // 합집합 오름차순 정렬
 let sortedUnion : [Int] = union.sorted()
 print(sortedUnion)

 // 교집합
 let intersection : Set<Int> = setA.intersection(setB)
 print(intersection)

 // 차집합
 let subtracting : Set<Int> = setA.subtracting(setB)
 print(subtracting)

 // 7 function Basic
 // 1. 함수선언의 기본형태
func sum(a:Int, b:Int) -> Int{
    return a+b
}
func printMyName(name:String) -> Void{
    print(name)
}
func maximumIntegerValue()-> Int{
    return Int.max
}
func printYourName(name:String){
    print(name)
}
func hello()->Void{print("hello")}
func bye(){print("bye")}

// call function
sum(a: 3, b: 5)
printMyName(name: "show")
printYourName(name: "hana")
hello()
bye()

// 함수 고급
// 매개변수 기본 값
// 1. 매개변수에 기본적으로 전달될 값을 미리 지정해 둘수 있음.
// 2. 기본값을 갖는 매개변수는 매개변수 목록 중 뒤쪽에 위치하는게 좋음.
func greeting(friend:String,me:String = "show"){
    print("Hello \(friend)! I'm \(me)")
}

// 매개변수 기본값을 가지는 매개변수는 호출시 생략이 가능!
greeting(friend: "hana")
greeting(friend: "john", me: "eric")

// 전달인자 레이블(Argument Label)
// 1. 함수를 호출할 때 함수 사용자의 입장에서 매개변수의 역할을 좀 더 명확하게 표현하고자 할 때 사용.
// 2. 전달인자 레이블은 변경하여 동일한 이름의 함수를 중복적으로 생성가능.

// 함수 내부에서 전달인자를 사용할 때에는 매개변수 이름을 사용.
func greeting(to friend:String,from me:String){
    print("Hello \(friend)! I'm \(me)")
}
// 함수를 호출할 때에는 전달인자 레이블을 사용.
greeting(to: "hana", from: "show")

// 가변 매개변수
// 1. 전달 받을 값의 개수를 알기 어려울 때 사용.
// 2. 가변 매개변수는 함수당 하나만 가질 수 있음.
// 3. 기본값이 있는 매개변수와 같이 가변 매개변수 역시 매개변수 목록 중 뒤쪽에 위치하는 것이 좋음.
func sayHelloToFriends(me:String,friends:String...) -> String{
    return "Hello \(friends)! I'm \(me)"
}
print(sayHelloToFriends(me: "show", friends: "motu,mami,namiki,towa"))
//print(sayHelloToFriends(me: "show")

// 데이터 타임으로서의 함수
// 1. 스위프트는 함수형 프로그래밍 패러다임을 포함하는 다중 패러다임 언어이므로 스위프트의 함수는 일급객체.
//    함수를 변수,상수 등에 할당이 가능하고 매개변수를 통해 전달도 가능.
// 2. 함수의 타입 표현 : 반환 타입을 생략할 수 없음.
//var someFunction: (String,String) -> Void = greeting(to: String,from: String)
//someFunction("eric","show")

//var someFunction = greeting(friend:me:)
//someFunction("eric","show")

func runAnother(function : (String,String) -> Void){
    function("show","dong")
}

//runAnother(function: greeting(to:from:))
//runAnother(function: greeting(friend:me:))

// 조건문
// if-else
let someIntger = 20000

if someIntger<100 {
    print("100미만")
}else if someIntger>100 {
    print("100 초과")
}else {
    print("100")
}

// switch
switch someIntger {
case 0:
    print("zero")
case 1..<100:
    print("1~99")
case 100:
    print("100")
case 101...Int.max:
    print("over 100")
default:
    print("unknown")
}

switch "show" {
case "show":
    print("show")
default:
    print("unknown")
}

//  반복문
// for-in
var targetIntegers = [1,2,3]
let people=["show":30,"hana":1,"sa":29]

for integer in targetIntegers{
    print(integer)
}

for (name,age) in people{
    print("\(name):\(age)")
}
// while
while integers.count>1 {
    integers.removeLast()
}
// repeat-while
//repeat{
//    integers.removeLast()
//}
    //while integers.count>0

// 옵셔널
// 자바의 옵셔널과 비슷한 역할..
// 이득을 보는점.
// 1. 명시적 표현
//   nil의 가능성을 코드만으로 표현가능.
//   문서/주석 작성 시간 절약(이건뭐,... 평소에도 안쓰니 패스)
// 2. 안전한 사용
//   전달받은 값이 옵셔널이 아니라면 nil체크를 하지 않고 사용가능.
//   예외 상황을 최소화 하는 안전한 코딩
//   효율적 코딩

// 느낌표(!)를 이용한 암시적 추출 옵셔널
//var optionalTestInteger:Int! = 100
//switch optionalTestInteger {
//case .none:
//    print("This Optional variable is nil")
//case .some(let value):
//    print("Value is \(value)")
//default:
//    print("default")
//}

// 기존 변수처럼 사용 가능.
//optionalTestInteger = optionalTestInteger + 1
// nil할당 가능
//optionalTestInteger = nil
// 잘못된 접근으로 인한 런타임 오류발생
//optionalTestInteger = optionalTestInteger + 1

// 물음표(?)를 이용한 옵셔널
var optionalTestInteger2:Int? = 100

switch optionalTestInteger2 {
case .none:
    print("This Optional variables is nil")
case .some(let value):
    print("Value is \(value)")
}
// nil할당 가능
optionalTestInteger2 = nil
// 기존 변수처럼 사용불가 - 옵셔널과 일반값은 다른 타입이므로 연산 불가
//optionalTestInteger2 = optionalTestInteger2 + 1

// 옵셔널을 사용하자!!
// 옵셔널 추출이란?!
//  옵셔널에 들어있는 값을 사용하기 위해 꺼내오는 행위!
// 옵셔널 바인딩
// 1. nil체크 + 안전한 추출
// 2. 옵셔널 안에 값이 들어있는지 먼저 확인하고 값이 있으면 값을 꺼내옴.
// 3. if-let 방식 사용
func printName(name: String){
    print(name)
}

var myName : String? = nil
// 전달되는 값의 타입이 다르기 때문에 컴파일 오류 발생
//print(myName)
if let name:String = myName{
    print(name)
}else{
    print("myName==nil")
}

var yourName:String!=nil

if let name:String = yourName{
    print(name)
}else{
    print("youName == nil")
}

// name 상수는 if-let 구문 내에서만 사용가능.
// 상수 사용범위를 벗어났기 때문에 컴파일 오류발생
//print(name)
// .을 사용해 한 번에 여러 옵셔널을 바인딩 할 수 있음.
// 모든 옵셔널에 값이 있을 때만 동작.
myName = "show"
yourName = nil

if let name = myName, let friend = yourName{
    print(name)
    print(friend)
}

yourName = "hana"

if let name = myName, let friend = yourName{
    print(name)
    print(friend)
}

// 옵셔널 강제 추출
// 옵셔널에 값이 들어있는지 아닌지 확인하지 않고 강제로 값을 꺼내는 방식.
// 만약 값이 없을경우(nil)런타임 오류가 발생됨.
//var myName:String? = show
//var yourName:String! = nil
//
//print(myName)
//myName=nil















