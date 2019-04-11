import UIKit
/*
 구조체(struct)
 1. 구조체란?
  - > 스위프트 대부분 타입은 구조체로 이루어져 있음.
  - > 구조체는 값(Value) 타입
  - > 타입이름은 대문자 카멜케이스를 사용하여 정의.
*/

// struct 키워드 사용

struct Sample{
    
    // 가변 프로퍼티(값 변경 가능)
    var mutableProperty:Int = 100
    
    // 불변 프로퍼티(값 변경 불가능)
    let immutableProperty:Int = 100
    
    // 타입 프로퍼티(static키워드를 사용: 타입 자체가 사용하는 프로퍼티)
    static var typeProperty:Int = 100
    
    // 인스턴스 메서드(인스턴스가 사용하는 메서드)
    func instanceMethod(){
        print("instance method")
    }
    
    // 타입 메서드(static 키워드 사용: 타입 자체가 사용하는 메서드)
    static func typeMethod(){
        print("type method")
    }
}


// 구조체 사용
var mutable:Sample = Sample()

print("fix befor : \(mutable.mutableProperty)")
mutable.mutableProperty = 1000;
print("fix after : \(mutable.mutableProperty)")

// 불변 프로퍼티는 인스턴스 생성 후 수정할 수 없음.
//mutable.immutableProperty = 1000;
// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod()

// 학생 구조체 만들기
struct Student{
    // 가변 프로퍼티
    var name:String = "unknown"
    // ``으로 감싸주면 키워드도 변수로 사용가능!
    var `class`:String = "Swift"
    
    // 타입 메서드
    static func selfIntroduce(){
        print("학생 타입입니다!")
    }
    
    // 인스턴스 메서드
    func selfIntroduce(){
        print("저는 \(self.class) 반 \(self.name)입니다.")
    }
}

// 타입 메서드 사용
// 자바 스태틱과 비슷한 개념?
Student.selfIntroduce()

// 가변 인스턴스 설정
var Show:Student = Student()
Show.class = "Wealthnavi"
Show.name = "choi sung hun"
// 인스턴스 메서드 실행
Show.selfIntroduce()

// 불변 인스턴스 생성
let Hana:Student = Student()

// 불변 인스턴스이므로 프로퍼티 값 변경 불가
// 컴파일 오류 발생
//Hana.name = "hana"
Hana.selfIntroduce()


/*
    클래스
    1. 클래스는 참조(reference)타입.
    2. 타입이름은 대문자 카멜케이스를 사용하여 정의.
    3. Swift의 클래스는 다중 상속이 되지 않음.
 */

// 프로퍼티 및 메서드 구현
class ClassSample{
    
    var mutableProperty:Int = 100
    
    let immutableProperty:Int = 100
    
    static var typeProperty:Int = 100
    
    // 인스턴스 메서드
    func instanceMethod(){
        print("Class Instance Method")
    }
    
    // 타입 메서드
    // 상속시 재정의 불가 타입 메서드 - static
    static func typeMethod(){
        print("Class type method - static")
    }
    
    // 상속시 재정의 가능 타입 메서드 - class
    class func classMethod(){
        print("Class type method - static")
    }
}
// 클래스 사용
ClassSample.typeProperty = 200
var mutableReference : ClassSample = ClassSample()

print("Before : \(mutableReference.mutableProperty)")
mutableReference.mutableProperty = 200
print("After : \(mutableReference.mutableProperty)")
print("type Property : \(ClassSample.typeProperty)")

// 불변 프로퍼티는 인스턴스 생성 후 수정할 수 없음.
// mutableReference.immutableProperty = 200

let immutableReference:ClassSample = ClassSample()

// 구조체와의 차이!
// 클래스의 인스턴스는 참조타입이므로 let으로 선언되었더라도 인스턴스 프로퍼티의 값 변경이 가능.
print("Before : \(immutableReference.mutableProperty)")
immutableReference.mutableProperty = 300
print("After : \(immutableReference.mutableProperty)")

// 다만 참조정보를 변경할 수는 없음.
// 컴파일 오류 발생
// immutableReference = mutableReference

// 참조 타입이더라도 불변 인스턴스는 인스턴스 생성 후에 수정할 수 없음.
// immutableReference.immutableProperty = 200

// 타입 프로퍼티 및 메서드
print("Before type Property : \(ClassSample.typeProperty)")
ClassSample.typeProperty = 300
print("Atfer type Property : \(ClassSample.typeProperty)")

// 인스턴스에서는 타입 프로퍼티나 타입 메서드를 사용할수 없음.
// 컴파일 오류 발생.
// mutableReference.typeProperty = 400
// mutableReference.typeMethod()

// 학생 클래스
class ClassStudent {
    
    var name:String = "unknown"
    
    var `class`:String = "Swift"
    
    // 타입 메서드
    class func selfintroduce(){
        print("학생타입입니다.")
    }
    
    // 인스턴스 메서드
    // self 인스턴스 자신을 지칭하며, 몇몇 경우를 제외하고 사용은 선택사항
    func selfintroduce() -> Void {
        print("저는 \(self.name) 반 \(self.class) 입니다.")
    }
}

// 타입 메서드 사용
ClassStudent.selfintroduce()

// 인스턴스 생성
var show:ClassStudent = ClassStudent()
show.name = "show"
show.class = "Java"
show.selfintroduce()

let hana:ClassStudent = ClassStudent()
hana.name = "hana"
hana.class = "Python"
hana.selfintroduce()

/*
    열거형
     -> 유사한 종류의 여러 값을 한 곳에 모아서 정의.
     -> enum 자체가 하나의 데이터 타입으로, 대문자 카멜케이스를 사용하여 이름을 정의.
     -> 각 case는 소문자 카멜케이스로 정의.
     -> 각 case는 그 자체가 고유의 값.(각 case에 자동으로 정수값이 할당되지 않음.)
     -> 각 case는 한 줄에 개별로도, 한줄에 여러개도 정의가 가능.
 */

// 예제
enum BoostCamp{
    case iosCamp
    case androidCamp
    case webCamp
}

// 열거형 사용
// -> 타입이 명확할 경우, 열거형의 이름을 생략할수 있음.
// -> switch 구문에서 사용하면 좋음.
enum Weekday{
    case mon
    case tue
    case wed
    case thu,fri,sat,sun
}

// 열거형 타입과 케이스를 모두 사용해도 됨.
var day:Weekday = Weekday.mon

// 타입이 명확하다면 .케이스처럼 표현해도 무방.
day = .fri
day = .sat
print(day)

// switch의 비교값에 열거형 타입이 위치할 때
// 모든 열거형 케이스를 포함한다면
// default를 작성할 필요가 없음.
switch day{
    case .mon,.tue,.wed,.thu:
        print("평일 입니다..")
    case Weekday.fri:
        print("불금파티!")
    case .sat,.sun:
        print("신나는 주말!!")
}

// rawValue(원시값)
// -> rawValue는 case별로 각각 다른 값을 가져야 함.
// -> 자동으로 1이 증가된 값이 할당됨.
// -> rawValue를 반드시 지닐 필요가 없다면 굳이 만들지 않아도 됨.
enum Fruit:Int{
    case apple = 0
    case grape = 1
    case peach
    // mango와 apple의 원시값이 같으므로
    // mango 케이스의 원시값을 0으로 정의할 수 없음.
    //case mango = 0
}

print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")
// 정수 타입 뿐만 아니라, Hashable 프로토콜을 따르는 모든 타입을 원시값의 타입으로 지정 할 수 있음/
enum School:String{
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university
}

print("School.middle.rawValue == \(School.middle.rawValue)")

// 열거형의 원시값 타입이 String일 때, 원시값이 지정되지 않았다면
// case의 이름을 원시값으로 사용
print("School.university.rawValue == \(School.university.rawValue)")

// 원시값을 통한 초기화
// -> rawValue를 통해 초기화.
// -> rawValue가 case에 해당하지 않을 수 있으므로, rawValue를 통해 초기화 한 인스턴스는 옵셔널 타입.
let apple:Fruit? = Fruit(rawValue: 0)

// if - let 구문을 사용해 rawValue에 해당하는 케이스를 곧바로 사용할 수 있음.
if let orange:Fruit = Fruit(rawValue: 5){
    print("rawValue = 5에 해당하는 케이스는 \(orange)")
}else{
    print("rawValue = 5에 해당하는 케이스가 없습니다")
}

// 메서드
enum Month{
    
    case dec,jan,feb
    case mar,apr,may
    case jun,jul,aug
    case sep,oct,nov
    
    func printMessage(){
        switch self {
        case .mar,.apr,.may:
            print("따스한 봄~")
        case .jun,.jul,.aug:
            print("여름 더워요~")
        case .sep,.oct,.nov:
            print("가을은 독서의 계절!")
        case .dec,.jan,.feb:
            print("추운 겨울입니다.")
        }
    }
}

Month.apr.printMessage()
Month.aug.printMessage()

/*
  클래스 vs 구조체/열거형
    -> 클래스는 참조타입, 열거형과 구조체는 값 타입 이라는것이 가장 큰 차이.
    -> 클래스는 상속이 가능하지만, 열거형과 구조체는 상속이 불가능.
 */
// 1. 값 타입과 참조 타입 비교
// -> 값 타입(Value Type) : 데이터를 전달 할 때 값을 복사하여 전달.
// -> 참조 타입(Reference Type) : 데이터를 전달 할 때 값의 메모리 위치를 전달한다.
struct ValueType{
    var property = 1
}

class ReferenceType{
    var property = 1
}

// 구조체 인스턴스
let firstStructInstance = ValueType()

// 첫번째 구조체 인스턴스를 복사
var secondStructInstance = firstStructInstance

// 두 번째 구조체 인스턴스 프로퍼티 값 수정
secondStructInstance.property = 2

// 확인
print("first struct instance property : \(firstStructInstance.property)")
print("second struct instance property : \(secondStructInstance.property)")

// 클래스 인스턴스 생성 후 첫 번째 참조 생성
let firstClassReference = ReferenceType()
// 두 번째 참조 변수에 첫 번째 참조 할당
var secondClassReference = firstClassReference
secondClassReference.property = 2

// 확인
print("first class reference property : \(firstClassReference.property)")
print("second class reference property : \(secondClassReference.property)")

// 값 타입을 사용하는 경우
// -> 연관된 몇몇의 값들을 모아서 하나의 데이터 타입으로 표현하고 싶은 경우
// -> 다를 객체 또는 함수 등으로 전달될 때 참조가 아니라 복사(값 복사) 할 경우
// -> 자신을 상속할 필요가 없거나, 다른 타입을 상속 받을 필요가 없는 경우

// 스위프트에서의 사용
// -> 스위프트의 기본 데이터 타입은 모두 구조체로 구현되어있음.
// -> 스위프트는 구조체와 열거형 사용을 선호.
// -> Apple프레임워크는 대부분 클래스를 사용.
// -> 구조체/클래스 선택과 사용은 개발자의 몫.


















