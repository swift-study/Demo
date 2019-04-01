import UIKit
/* 명명법/콘솔로그/문자열 보간법 */
/* 1.명명법 : 기본적으로 카멜케이스를 사용
    Lower Camel Case : function,method,variable,constant
        ex) someVariableName
    Upper Camel Case : type(class,struct,enum,extension...)
        ex) Person,Point,Week
    * Swift는 모든 대소문자를 구분.
   2.콘솔로그 남기기
    print 함수 : 단순 문자열 출력
    dump 함수 : 인스턴스의 자세한 설명(description 프로퍼티)까지 출력
 
   3.문자열 보간법(String Interpolation)
    프로그램 실행 중 문자열 내에 변수 또는 상수의 실질적인 값을 표현하기 위해 사용.
    \()
*/

let age : Int = 29
"안녕하세요! 저는 \(age)살입니다."
"안녕하세요! 저는 \(age+5)살입니다."

print("안녕하세요! 저는 \(age+5)살입니다.")
print("\n#########################\n")

class Person{
    var name : String = "choi"
    var age : Int = 29
}

let show : Person = Person()
print(show)
print("\n#########################\n")
dump(show)










