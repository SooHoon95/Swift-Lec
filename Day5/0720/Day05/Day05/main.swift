//
//  main.swift
//  Day05
//
//  Created by 최수훈 on 2021/07/20.
//

import Foundation

// ------
// 구조체 : Structure
// : Swift 에서 Data Type을 정의

struct Sample {
    var sampleProperty: Int = 10 // 가변 프로퍼티
    let fixedSampleProperty: Int = 100 // 불변 프로퍼티
    static var typeProperty:Int = 1000// 타입 프로퍼티

    func instanceMethod(){
        print("instance method")
    }
    
    static func typeMethod(){
        print("type method")
    }
}
// Structure 사용
    
var samp: Sample = Sample()
print(samp.sampleProperty)
samp.sampleProperty = 100
print(samp.sampleProperty)

var samp1 = Sample()
print(samp1.sampleProperty)

//Type Property
Sample.typeMethod()
print(Sample.typeProperty)


// 학생 구조체
struct Student{
    var name: String = "unknown"
    var `class`: String = "Swift" // 킬트? 키로 지정할 수 있다.
    
    static func selfIntroduce (){
        print("학생타입입니다.")
    }
    
    func selfIntroduce(){
//        print("저는 \(`class`)반 \(name)입니다")
        print("저는 \(self.class)반 \(name)입니다")
    }
}

Student.selfIntroduce()

var student: Student = Student()
student.name = "James"
student.class = "스위프트"
student.selfIntroduce()
Student.selfIntroduce()

let cathy: Student = Student()
//cathy.name = "Cathy"
cathy.selfIntroduce()


//Class로 바꿔서
class Student1 {
    var name: String = "unknown"
    var `class`: String = "Swift" // 킬트? 키로 지정할 수 있다.
    
    static func selfIntroduce (){
        print("학생타입입니다.")
    }
    
    static func selfItroduce(){
        print("test입니다")
    }
    
    func selfIntroduce(){
        print("저는 \(`class`)반 \(name)입니다")
        print("저는 \(self.class)반 \(name)입니다")
    }
}

Student1.selfIntroduce()
var student1: Student1 = Student1()

// ====================
class Shape{
    var pi: Double = 3.14
    
    func input(_ r: Double){
    
        print("원의 면적은 \(3.14*r*r)이고 둘레는 \(2*3.14*r)")
    }
    
   func input(_ w: Int, _ h: Int){
        print("직사각형의 면적은 \(w*h)이고 둘레는 \(2*(w+h)) 입니다")
    }
    
    func input(_ w: Int, _ h: Int,_ b: Int){
        
        print("직각삼각형의 면적은 \((w*h)/2) 이고  둘레는 \(w+h+b)입니다")
    }
    
}
let sh1: Shape = Shape()
let sh2: Shape = Shape()
let sh3: Shape = Shape()

sh1.input(5) // 원의 면적과 둘레 구하기
sh2.input(5,6) // 직사각형의 면적과 둘레구하기
sh3.input(5,6,8) // 직각삼각형의 면적과 둘레구하기


class Shape1{   // init 보기!
    var area = 0.0
    let pi = 3.14157
    
    init(){
        print("계산시작")
    }
    
    init(radius: Double){
        area = radius * radius * pi
        calc()
    }
    
    init(_ w: Int, _ h: Int){
        area = Double(w * h)
        calc()
    }
    
    func input(r: Double){
        area = r * r * pi
        calc()
    }
    
    func calc(){
        print("원의 면적은 \(Int(area))입니다.")
        
    }
}

let sh4: Shape1 = Shape1()
sh4.input(r: 5.0)

let sh5: Shape1 = Shape1(radius: 5.0)

//
class Shape2{
    var area = 0.0
    var border = 0.0
    
    init(){
        print("start")
    }
    
    init(w: Double, h:Double){
        area = w * h
        border = (w+h) * 2
        calc()
    }
    
    func calc(){
        print("직사각형의 면적은 \(Int(area)) 둘레는 \(Int(border))입니다.")
    }
}




//Extenstion *************** 확장이라는 뜻.. 확장이 무엇인가!!
//구조체, 클래스, 프로토콜 타입에 새로운 기능을 추가할 수 있는 기능.
//기존에 존재하는 기능은 재정의 할 수 없다.

extension Int{
    var isEven : Bool{
        return self % 2 == 0 // 짝수면 true 홀수면 false 내보냄
    }
    
    var isOdd: Bool{
        return self % 2 == 1
    }
}

print(1.isEven)



// Closure 함수이나 이름이 없음 파이썬의 람다함수랑 똑같음. 한번만 쓰는 함수. 나만쓰는 함수.

// 함수
func sumFunction(a:Int ,b:Int) -> Int{
        
    return a + b
}

var sumResult: Int = sumFunction(a: 10, b: 20)
print(sumResult)

//Closure
var sumClosure: (Int,Int) -> Int = {(a:Int, b:Int) -> Int in
    return a + b
}

sumResult = sumClosure(10,20)
print(sumResult)


//---------------
print(Int.random(in: 1..<10))
print(Int.random(in: 1..<10))

func genNum() -> String{
    return String(Int.random(in: 1..<10))
}


print(genNum())
print(genNum())
print(genNum())




















