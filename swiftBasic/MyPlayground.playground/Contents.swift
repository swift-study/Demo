import UIKit

/*
    상속
    1. 스위프트 상속
        -> 상속은 클래스,프로토콜 등에서 가능.
        -> 열거형,구조체는 상속이 불가능.
        -> 스위프트의 클래스는 단일상속으로, 다중상속을 지원하지 않음.
        -> 이번 파트에서는 클래스의 상속에 대해서 알아봄.
 */

// 2.문법
//class name:ParentClassName{
//  구현부
//}

// 3. 사용
//  -> final 키워드를 사용하면 재정의(override)를 방지할 수 있음.
//  -> static 키워드를 사용해 타입 메서드를 만들면 재정의가 불가능.
//  -> class 키워드를 사용해 타입 메서드를 만들면 재정의가 가능.
//  -> class 앞에 final을 붙이면 static키워드를 사용한것과 동일하게 동작.
//  -> override 키워드를 사용해 부모 클래스의 메서드를 재정의 할 수 있음.

class Person{
    
    var name:String = ""
    
    func selfIntroduce() {
        print("저는 \(name)입니다.")
    }
    // final 키워드를 사용하여 재정의를 방지할 수 있음.
    final func sayHello(){
        print("hello")
    }
    
    // 타입 메서드
    // 재정의 불가 타입 메서드 - static
    static func typeMethod(){
        print("type method - static")
    }
    
    // 재정의 가능 타입 메서드 - class
    class func classMethod(){
        print("type method - class")
    }
    
    // 재정의 가능한 class메서드라도
    // final 키워드를 사용하면 재정의 할 수 없음.
    // 메서드 앞의 static과 final class는 똑같은 역할.
    final class func finalClassMethod(){
        print("type method - final class")
    }
}

class Student:Person{
    
    var major:String = ""
    
    override func selfIntroduce() {
        print("저는 \(self.name)이고, 전공은 \(self.major) 입니다.")
    }
    
    override class func classMethod(){
        print("overriden type method - class")
    }
    
    // static을 사용한 타입 메서드는 재정의 할 수 없음.
    // override static func typeMethod()
    // final 키워드를 사용한 메서드, 프로퍼티는 재정의 할 수 없음.
    // override func sayHello()
    // override class func finalClassMethod()

}

//  사용
let show : Person = Person()
let hana : Student = Student()

show.name = "show"
hana.name = "hana"
hana.major = "Swift"

show.selfIntroduce()
hana.selfIntroduce()

Person.classMethod()

Person.typeMethod()

Person.finalClassMethod()

Student.classMethod()

Student.typeMethod()

Student.finalClassMethod()



