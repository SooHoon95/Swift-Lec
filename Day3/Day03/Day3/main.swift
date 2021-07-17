//
//  main.swift
//  Day3
//
//  Created by 최수훈 on 2021/07/16.
//

import Foundation

//Dictinary
// Key와 Value로 구성된

//var scoreDictinary: Dictionary<String, Int> = [String: Int]() // 키값은 String으로, value값으 Int로!
var scoreDictinary: [String: Int] = [:]
scoreDictinary["유비"] = 100 // key는 유비 데이터는 100 이라고 지정
scoreDictinary["관우"] = 90
scoreDictinary["장비"] = 80

print(scoreDictinary) //순서는 01234가 아니라 key구성이다. >> 무슨 말?? 순서가 저대로 나올 수도 있고 섞여나올 수도 있다.
// 초기값을 가지는 Dictionary
let initializedDictionary: [String: String] = ["name":"James", "gender":"male"] // 중요한건 얘네는 순서가 없는 애들임.

// Set
// Set은 집합연산에 사용되고, 중복 데이터를 적용하지 않는다.

let oddDigits: Set = [1,3,5,7,9,9,9,9,9,9,9] // 중복데이터 허락하지않는다.
let evenDigits: Set = [0,2,4,6,8]
let singleDigitPrimeNumbers: Set = [2,3,5,7]

//print(oddDigits) // 마찬가지로 순서 맘대로. 즉, 순서는 Array에만 존재.

// 합집합
print(oddDigits.union(evenDigits).sorted()) // .sorted는 오름차순 정렬

// 교집합
print(oddDigits.intersection(evenDigits).sorted())

// 차집합
print(oddDigits.subtracting(singleDigitPrimeNumbers.sorted()))

// Set의 동등 비교
let houseAnimals: Set = ["dog", "cat"]
let farmAnimals: Set = ["cow","chicken","sheep","dog","cat"]
let cityAnimals: Set = ["duck", "rabbit"]

print(houseAnimals.isSubset(of: farmAnimals)) // 부분집합이냐
print(farmAnimals.isSuperset(of: houseAnimals)) // 모집합이냐 ; 반대개념
// 만약에 house에 잇는 데이터 중에 하나라도 빠지면 부분집합, 모집합 모두 False나온다.
print(farmAnimals.isDisjoint(with: cityAnimals)) // 서로 관련이 없냐. 즉, 틀리냐

print("====================")
//If
var isCar = true
var isNew = true

if isCar, isNew{
    print("New Car")
}

isNew = false
if isCar, isNew{ // =  isCar && isNew
    print("New Car")
}else {
    print("Old Car")
}


//Switch 조건문
// Before Switch

let personAge = 14
if personAge < 1{
    print("baby")
}else if personAge < 3{
    print("toddler")
}else if personAge < 5 {
    print("preschooler")
}else if personAge < 13{
    print("gradeschooler")
}else if personAge < 18 {
    print("teen")
}else{
    print("adult")
}


//  After using Swich statement
switch personAge{ //break가 없다. 자바와는 다르게 기본이 안 흘러내려가는 거. 필요시 그렇게 만들어야한다.
case 0..<1:
    print("baby")
case 1..<3:
    print("toddler")
case 3..<5:
    print("preschooler")
case 5..<13:
    print("gradeschooler")
case 13..<18:
    print("teen")
default:
    print("adult")
}

let someInteger = 123456
switch someInteger{
case 0:
    print("zero")
case 1..<100:
    print("1~99")
case 101...Int.max:
    print("over 100")
default:
    print("unknow")
}

print(Int.max)

let aCharacter: Character = "A"
switch aCharacter{
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}

// 국어 영어 수학 점수로 총점 평균을 구하고 등급을 정하기

let name = "유비"
let kor = 91
let eng = 97
let math = 95

var tot = 0
var avg: Double = 0

tot = kor + eng + math
avg = Double(tot) / 3

//점수 등급 출력 -1
var grade: String

// if 문을 이용한 등급 출력
if avg > 90 {
    grade = "수"
}else if avg > 80 {
    grade = "우"
}else if avg < 70{
    grade = "미"
}else if avg < 60{
    grade = "양"
}else{
    grade = "가"
}


//switch case 문을 이용한 등급 출력
switch avg{
case 90..<100:
    grade = "수"
case 80..<90:
    grade = "우"
case 70..<80:
    grade = "미"
default:
    grade = "가"
}


// 삼항연산자 등급 출력
grade = avg >= 90 ? "Su" :
    avg >= 80 ? "Wu" :
    avg >= 80 ? "Mi" :
    avg >= 70 ? "Yang" : "Ga"
print(grade)

//배열과 반복문
var score = [90 , 80 , 70, 60, 0 ]
var level = ["A", "B","C","D","F"]

for i in 0..<score.count{
    if avg >= Double(score[i]){
        grade = level[i]
        print(grade)
        break
    }
}

//반복문

let names = ["Anna", "Alex", "Brian", "Jack"]

for i in 0..<names.count{
    print(names[i])
}

for name in names {
    print(name)
}


// Dictionary 반복문
let numberOfLegs = ["Spider" : 8, "Ant" : 6, "Cat" : 4]

for(animalName, LegCount) in numberOfLegs{
    print("\(animalName) have \(LegCount) legs")
}

let seq1 = 1...5
for i in seq1{
    print("\(i) * 5 = \(i*5)")
}

for i in seq1.reversed(){
    print("\(i) * 5 = \(i*5)")
}

let minutes = 60
let hourInterval = 5
for tickMark in stride(from: 0, to: minutes, by: hourInterval){ // 이렇게 하면 마지막 값인 60 은 안나옴
    print(tickMark)
}

for tickMark in stride(from: 0, through: minutes, by: hourInterval).reversed(){ // to -> through
    print(tickMark)
}

//while  자바랑 똑같이쓴다.
var startIndex = 0
var endIndex = 100
var sum = 0

while startIndex <= endIndex{
    sum += startIndex
    startIndex += 1
}
print(sum)

// 1부터 100 까지의 짝수의 합 ( 단 if,문 사용금지)
var num1 = 0
sum = 0

while num1 <= 100{
    sum += num1
    num1 += 2
}
print(sum)


// 입력한 한 자릿수 정수의 합을 구하는 프로그램을 작성하라.
// ex ) 12345678 >> 36
//print("Enter an Integer(0~9) : ", terminator: " ")
//var number = Int(readLine()!)!
//var sumD = 0
//
//while number > 0{
//    sumD += (number % 10)
//    number /= 10
////    print(number)
//}
//print(sumD)

//바인딩사용해서 풀기
print("Enter an Integer(0~9) : ", terminator: " ")
var repNum = 0
var remainder = 0
var sumNo = 0

var inpNum = Int(readLine()!)

if let _: Int = inpNum{ // 안쓰는 변수에 대해서  _ 쓰면 문법상 반드시 필요해지만 쓸일 없을 때에 사용
    repNum = inpNum!
    while repNum != 0{
        remainder = repNum % 10
        sumNo += remainder
        repNum /= 10
    }
    print("Sum of digits = \(sumNo)")
}else{
    print("Input values is wrong")
}

