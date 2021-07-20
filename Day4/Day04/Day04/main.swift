//
//  main.swift
//  Day04
//
//  Created by 최수훈 on 2021/07/19.
//

import Foundation

// 함수

func integerSum(a: Int, b: Int) -> Int {
    return a+b
}

var abSum: Int = integerSum(a: 5, b: 8)
print(abSum)


func greet(person: String) -> String {
    let greeting = "Hello, \(person)!"
    return greeting
}

print(greet(person: "Anna"))
print(greet(person: "Brian"))

func sayHelloWorld() -> String { // 아규먼트 파라미터 아무것도 없음 . Argument >> 함수에 쓰는 거 Parameter >> 불러쓸때 넣는 변수
    return "Hello World!"
}

print(sayHelloWorld())

func buildAddress(_ name: String, address: String, city: String, 우편번호 zipCode: String, /* country: String*/ country: String? = "USA") -> String {
    return """
        name : \(name)
        address: \(address)
        city : \(city)
        zipCode : \(zipCode)
        contury : \(country ?? "")
        """
}

print(buildAddress("유비", address: "중국", city: "상하이", 우편번호: "123", country: "China"))
print(buildAddress("장비", address: "중국", city: "북경", 우편번호: "1234"))
print(buildAddress("유비", address: "중국", city: "상하이", 우편번호: "123", country: nil))

// 가변 매개변수
func sayHelloFriends(me: String, friend: String...) -> String{
    return "Hello \(friend)! I'm \(me)."
}
print(sayHelloFriends(me: "최수훈", friend: "소현", "윤지", "도영"))

// 복수의 값을 반혼하는 함수
func getCountry() -> (dialCode: Int, isoCode: String, name: String) {
    let country = (dialCode: 82, isoCode: "KR", name: "Korea")
    return country
}

let ret = getCountry()
print(ret)
print(ret.dialCode)


//시작 숫자부터 끝 숫자 까지의 합계를 구하는 함수
//1) for 문
//func addRange(start: Int, end: Int) -> String {
//    var sum :Int = 0;
//    for i in start...end{
//        sum += i
//    }
//    return "\(start) 부터 \(end)까지의 합은 \(sum)입니다."
//}
//2) while 문
func addRange(start: Int , end: Int) -> String{
    var sum = 0
    var i = 0
    while i < end {
        sum += start + i
        i += 1
    }
    return "\(start) 부터 \(end)까지의 합은 \(sum)입니다."
}

print(addRange(start:1, end: 100))


//Overloading: 함수의 이름은 중복되도 parameter의 갯수로 구분이 가능
// >> 도형의 면적과 둘레를 구하는 함구
//원
func shape(_ r: Double) {
    let pi = 3.14
    let area = pi * r * r
    let border = 2 * pi * r
    print("원: \(area), \(border)")
}

//직사각형
func shapre(_ w: Int , _ h: Int){
    let area = w * h
    let border = (w + h) * 2
    print("직사각형 : \(area), \(border)")
}
shape(5)
shapre(5,6)

//직각 삼각형
func shape(_ w: Int, _ h: Int , _ hp: Double){
    let hp: Double = Double((w*w) + (h*h))
    let area = (w * h) / 2
    let border: Double = Double((w + h + Int(sqrt(hp))))
    print("직각삼각형 : \(area), \(border)")
}

shape(5,6,7)


/*
 Class : 전통적인 OOP(Objective- Oriendted- Programm 즉, 객체지향 ) 관점에서의 클래스
 - 단일 상속 : IOS와는 다르게 상속을 하나씩 밖에 받지 못함
 - property
 - constructor
 - method
 - 참조 타입 선언 (Call by reference)
 
 Struct
 - 상속 불가
 - property
 - constructor
 - method
 - 값 타입 선언 (Call by value)
 
 */

// Class와 Struct 의 비교
struct ValueType {
    var property = 1
}

class ReferenceType{
    var property = 1
}

let firstStructInstance: ValueType = ValueType()
var secondStructInstace = firstStructInstance
secondStructInstace.property = 2

print("first : \(firstStructInstance.property)")
print("second : \(secondStructInstace.property)")

let firstClassInstance: ReferenceType = ReferenceType()
var secondClassInstance = firstClassInstance
secondClassInstance.property = 2

print("first: \(firstClassInstance.property)")
print("second: \(secondClassInstance.property)")
