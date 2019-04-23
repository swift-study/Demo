import UIKit

// 타입 캐스팅
// 1. 스위프트 타입 캐스팅
// 인스턴스 타입을 확인하는 용도.
// 클래스의 인스턴스를 부모 혹은 자식 클래스의 타입으로 사용할 수 있는지 확인 하는 용도.
// is,as 를 사용.
// 형 변환은 let someDouble = Double(2) 타입 캐스팅이 아니라 새로운 값을 생성하는 것.

// 예제 클래스
class Person{
    var name:String = ""
    func breath(){
        print("숨을 쉽니다.")
    }
}

class Student:Person{
    var school:String = ""
    func goToSchool(){
        print("등교를 합니다.")
    }
}

class UniversityStudent:Student{
    var major:String = ""
    func goToMT(){
        print("멤버쉽 트레이닝을 갑니다 신남!")
    }
}

// init instance
var show:Person = Person()
var hana:Student = Student()
var jason:UniversityStudent = UniversityStudent()

// 2. 타입 확인
//  is 를 사용하여 타입을 확인.
var result:Bool

result = show is Person
result = show is Student
result = show is UniversityStudent

result = hana is Person
result = hana is Student
result = hana is UniversityStudent

result = jason is Person
result = jason is Student
result = jason is UniversityStudent

if show is UniversityStudent{
    print("show는 대학생 입니다.")
}else if show is Student{
    print("show는 학생 입니다.")
}else if show is Person{
    print("show는 사람입니다.")
}

switch jason {
case is Person:
    print("jason은 사람 입니다")
case is Student:
    print("jason은 학생 입니다")
case is UniversityStudent:
    print("jason은 대학생 입니다")
default:
    print("jason은 사람도,학생도,대학생도 아닙니다")
}

switch jason {
case is UniversityStudent:
    print("jason은 대학생 입니다")
case is Student:
    print("jason은 학생 입니다")
case is Person:
    print("jason은 사람 입니다")
default:
    print("jason은 사람도,학생도,대학생도 아닙니다")
}

// 3. 업 캐스팅(Up Casting)
// as 를 사용하여 부모클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 타입정보를 전환.
// Any혹은 AnyObject로도 타입정보를 변환할 수 있음.
// 암시적으로 처리되므로 꼭 필요한 경우가 아니라면 생략하도 무방.

// UniversityStudent 인스턴스를 생성하여 Person 행세를 할 수 있도록 업 캐스팅
var mike:Person = UniversityStudent() as Person
var jenny:Student = Student()
var jina:Any = Person()

// 4. 다운 캐스팅(Down Casting)
// as? 또는 as!를 사용하여 자식 클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 인스턴스의 타입정보를 전환.
var optionalCasted:Student?
optionalCasted = mike as? UniversityStudent
optionalCasted = jenny as? UniversityStudent
optionalCasted = jina as? UniversityStudent
optionalCasted = jina as? Student

// 강제 다운 캐스팅
// as!를 사용.
// 캐스팅에 실패하면, 즉 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 런타임 오류가 발생.
// 캐스팅에 성공하면 옵셔널이 아닌 일반 타입을 반환.
var forcedCasted:Student

forcedCasted = mike as! UniversityStudent
//forcedCasted = jenny as! UniversityStudent
//forcedCasted = jina as! UniversityStudent
//forcedCasted = jina as! Student

// 5.활용
func doSomethingWithSwitch(someone:Person){
    switch someone {
    case is UniversityStudent:
        (someone as! UniversityStudent).goToMT()
    case is Student:
        (someone as! Student).goToSchool()
    case is Person:
        (someone as! Person).breath()
    default:
        print("just Default")
    }
}

doSomethingWithSwitch(someone: mike as Person)
doSomethingWithSwitch(someone: mike)
doSomethingWithSwitch(someone: jenny)
doSomethingWithSwitch(someone: show)

func doSomething(someone:Person){
    if let universityStudent = someone as? UniversityStudent{
        universityStudent.goToMT()
    }else if let student = someone as? Student{
        student.goToSchool()
    }else if let person = someone as? Person{
        person.breath()
    }
}

doSomething(someone: mike as Person)
doSomething(someone: mike)
doSomething(someone: jenny)
doSomething(someone: show)

// assert / guard

// 어플리케이션이 동작 도중에 생성하는 다양한 연산 결과값을 동적으로 확인하고 안전하게 처리 할 수 있도록 확인하고 빠르게 처리 할 수 있음.

// 1. Assertion
// assert(_:_:file:line:)함수를 사용
// assert함수는 디버깅 모드에서만 동작
// 배포하는 어플리케이션에서는 제외됨.
// 예산했던 조건의 검증을 위하여 사용.
var someInt:Int = 0

// 검증 조건과 실패시 나타날 문구를 잓겅해 줌.
// 검증 조건에 부합하므로 지나감
assert(someInt == 0,"someInt !=0")
//someInt = 1
//assert(someInt == 0)
//assert(someInt == 0 ,"someInt !=0")

func functionWithAssert(age:Int?){
    assert(age != nil,"age==nil")
    assert((age! >= 0) && (age! <= 130), "나이값 입력이 잘못되었습니다.")
    print("당신의 나이는  \(age!)세 입니다.")
}

functionWithAssert(age: 50)
//functionWithAssert(age: nil)
//functionWithAssert(age: -1)
//functionWithAssert(age: 150)

// 2. guard(빠른종료 - Early Exit)
//  guard를 사용하여 잘못된 값의 전달 시 특정 실행구문을 빠르게 종료함.
//  디버깅 모드 뿐만 아니라 어떤 조건에서도 동작.
//  guard의 else블럭 내부에는 특정 코드블럭을 종료하는 지시어(break,return 등)가 꼭 있어야 함.
//  타입캐스팅, 옵셔널과도 자주 사용됨.
//  그 외에도 단순 조건 판단 후 빠르게 종료할 때도 용이.

func functionWithGuard(age:Int?){
    
    guard let unwrappedAge = age,
              unwrappedAge < 130,
              unwrappedAge >= 0 else{
              print("나이값 입력이 잘못되었습니다.")
              return
    }
    
    print("당신의 나이는 \(unwrappedAge)세입니다")
}

var count = 1

while true {
    guard count < 3 else{
        break
    }
    print(count)
    count += 1
}

func someFunction(info:[String:Any]){
    guard let name = info["name"] as? String else{
        return
    }
    guard let age = info["age"] as? Int, age>=0 else {
        return
    }
    print("\(name):\(age)")
}

someFunction(info:["name":"show","age":"10"])
someFunction(info:["name":"mike"])
someFunction(info:["name":"show","age":10])

// 프로토콜
//  프로토콜은 특정 역할을 수행하기 위한 메서드,프로퍼티,기타 요구사항등의 청사진을 정의
//  구조체,클래스,열거형은 프로토콜을 채택(Adopted)해서 특정 기능을 수행하기 위한 프로토콜의 요구사항을 실제로 구현할 수 있음.
//  어떤 프로토콜의 요구사항을 모두 따르는 타입은 그 프로토콜을 준수한다(Conform)고 표현.
//  타입에서 프로토콜의 요구사항을 충족시키려면 프로토콜이 제시하는 청사진의 기능을 모두 구현 해야 함.
//  즉, 프로토콜은 기능을 정희하고 제시 할 뿐이지 스스로 기능을 구현하지는 않음.
//  자바의 인터페이스와비슷??

// 정의
// protocol 키워드를 사용하여 정의
// 프로퍼티 요구는 항상 var 키워드를 사용.
// get은 읽기만 가능해도 상관 없다는 뜻이며 get과 set을 모두 명시하면 읽기 쓰기 모두 가능한 프로퍼티여야 함.
protocol Talkable{
    // 프로퍼티 요구
    var topic:String {get set}
    var language:String{get}
    
    // 메서드 요구
    func talk()
    
    // 이니셜라이저 요구
    init(topic:String,language:String)
}

// 프로토콜 채택 및 준수
struct protocolTest : Talkable{
    
    // 프로퍼티 요구 준수
    var topic: String
    let language: String
    // 읽기전용 프로퍼티 요구는 연산 프로퍼티로 대체할 수 있음.
    //var language:String{return "korean"}
    
    // 물론 읽기,쓰기 프로퍼티도 연산 프로퍼티로 대체가 가능.
//    var subject:String = ""
//    var topic:String{
//        set{
//            self.subject = newValue
//        }
//        get{
//            return self.subject
//        }
//    }
    //  메서드 요구 준수
    func talk() {
        print("\(topic)에 대해 \(language)로 말합니다")
    }
    
    // 이니셜라이저 요구 준수
    init(topic:String,language:String) {
        self.topic = topic
        self.language = language
    }
}

// 프로토콜 상속
// 프로토콜은 하나 이상의 프로토콜을 상속받아 기존 프로토콜의 요구사항보다 더 많은 요구사항을 추가할 수 있음.
// 프로토콜 상속 문법은 클래스의 상속 문법과 유사하지만, 프로토콜은 클래스와 다르게 다중 상속이 가능.
protocol Readable{
    func read()
}

protocol Writeable{
    func write()
}

protocol ReadSpeakable:Readable{
    func speak()
}

protocol ReadWriteSpeakable: Readable,Writeable{
    func speak()
}

struct someType:ReadWriteSpeakable{
    func read(){
        print("Read")
    }
    
    func write() {
        print("Write")
    }
    
    func speak() {
        print("Speak")
    }
}

// 클래스 상속과 프로토콜
// 클래스에서 상속과 프로토콜 채택을 동시에 하려면 상속받으려는 클래스를 먼저 명시하고 그 뒤에 채택할 프로토콜 목록을 작성합니다.
class SuperClass:Readable{
    func read(){}
}

class SubClass: SuperClass, Writeable, ReadSpeakable{
    func write() {
        
    }
    
    func speak() {
        
    }
}

// 프로토콜 준수 확인
// is,as 연산자를 사용해서 인스턴스가 특정 프로토콜을 준수하는지 확인할 수 있음.
let sup:SuperClass = SuperClass()
let sub:SubClass = SubClass()

var someAny:Any = sup
someAny is Readable
someAny is ReadSpeakable

someAny = sub
someAny is Readable
someAny is ReadSpeakable

someAny = sup

if let someReadable:Readable = someAny as? Readable{
    someReadable.read()
}

if let someReadSpeakable: ReadSpeakable = someAny as? ReadSpeakable{
    someReadSpeakable.speak()
}

someAny = sub

if let someReadable: Readable = someAny as? Readable{
    someReadable.read()
}










