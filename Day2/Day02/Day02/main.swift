//
//  main.swift
//  Day02
//
//  Created by 최수훈 on 2021/07/15.
//

import Foundation

//Optional

var str1: String!
str1 = "Apple"
str1 = "Google"
//str1 = nil // nil은 optional변수에만 들어간다. String에는 못 들어감.


print(str1)

var str2: String?
str2 = "Apple"
str2 = "Google"
str2 = "123"
//str2 = nil
var int1: Int = Int(str2!)! // 첫번째 !는 데이터에 optional 풀어주기 두번째는 Type에 대한 언랩핑

print(int1 + 10)

// 비교 연산자
print( 1 == 1)
print("zebra" < "apple")

//Tuple에서의 비교 연산
print((1, "zebra") < (2, "apple")) // true로 출력 ( 앞에거먼저 비교해서 판단끝나면 뒤에꺼는 판단하지도 않는다.)
print((3,"apple") < (3, "bird")) // 3으로 판단안되기 때문에 문자열로 비교해서 결과값 출력

//삼항 조건 연산자
let contentHeight = 40
let hasHeader = true

let rowHeight = contentHeight + (hasHeader ? 50 : 20) // hasHeader가 true이면 50 아니면 20
print(rowHeight)

// 범위 연산자

//닫힌 범위 연산자
for i in 1...10{
    print(i)
}

var sum: Int = 0
for i in 1...10{
    sum += i
}
print ("1~10 까지의 합계는 \(sum) 입니다.")

for i in 1...9{
    print("5 X \(i) = \(i*5)")
}

for i in 1..<10{
    print("5 X \(i) = \(i*5)")
}

// 반 닫힌 연산자
let names = ["Anna", "Alex", "Brian", "Jack"]
for i in 0..<names.count{
    print("Person \(i+1) is called \(names[i])")
}

//Optional
// : 값이 있을수도 있고, 없을 수도 있음
// : nil값을 포함할 수도 있고, 포함 안할수도있다.

//1.
    var constantNum = 100 // 얘는 Int
    //constantNum = nil // 타입때문에 오류걸림

    var constantNum1: Int? = 100
    constantNum1 = nil
    
//2.
    var constantNum2: Int! = 100
    print(constantNum2)
    print(constantNum2!)
    print(constantNum2 + 10) // 혼자쓸떄나 !있어야 옵셔널 벗겨지지 다른 데이터들어오면 자동으로 벗겨진다.


//Optional Unwrapping
var myName: String? = nil
print(myName as Any)

//Optional Binding
if let name: String = myName{
    print(name)
}else{ // nil이면 else 로 가고 아니면 위에서 실행한다.
    print("myName is nil")
}


var youName: String! = nil

//Optional Binding
if let name: String = youName{
    print(name)
}else{ // nil이면 else 로 가고 아니면 위에서 실행한다.
    print("yourName is nil")
}


var myName2: String! = "James"
var yourName2: String! = nil

if let name = myName2, let friend = yourName2{
    print("\(name) and  \(friend)")
}// if 까지만 하면 안나옴 왜냐하면 yourName 값이 nil이기 때문


// Force Unwrapping
print(myName2!)
myName2 = nil
print(myName2 as Any)

//Collection : 여러값들을 묶어서 하나의 변수로 사용

/*
 Array : 순서가 있는 리스트 컬렉션
 Dictionary : key와 value의 쌍으로 이루어진 컬렉션
 Set : 순서가 없고 멤버가 유일한 컬렉션 , 집합연산
 */

//Array
//빈 Array 생성
//var inVariable: Array<Int> = Array<Int>()
//var intVariable: [Int] = [Int]()
var intVariable : [Int] = []
intVariable.append(1)
intVariable.append(10)
intVariable.append(100)
intVariable.append(1000)

print(intVariable)
print(intVariable.contains(100))
print(intVariable.contains(90)) //이 값 가지고 있니?

print(intVariable[0])
print(intVariable[0...2])
print(intVariable[0...2][0])// 파이썬과 비슷
intVariable.remove(at: 0) //몇번째거 지울거니?
intVariable.removeLast() // 맨 끝 데이터 지우기
intVariable.removeAll()
print(intVariable)

intVariable = [] // removeAll이랑 똑같다.


// 기본값으로 배열 생성하기
var threeDouble = Array(repeating: 0.0, count: 3) //소괄호는 생성자 . 대문자로 시작하는 애들은 class아니면 생성자
print(threeDouble)
var anotherDouble = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDouble + anotherDouble
print(sixDoubles)

let intVariable2 = [1,2,3]
print(type(of: intVariable2))
//intVariable2.append(4) // 에러걸림. 왜냐하면 지금은 let으로 선언했기 때문에

var shoppingList = ["Eggs", "Milk"]
print(type(of: shoppingList))

print(shoppingList.count)
if shoppingList.isEmpty{
    
}
shoppingList += ["Baking Power"] // 반드시 append라고 써주지 않아도 된다.
shoppingList += ["Chocolate", "Cheese", "butter"]
print(shoppingList)

// 배열의 특정 위치 데이터 변경 및 제거
//shoppingList[0...3] = ["Banana"] // 번지수는 네개 , 데이터는 한갠데.. 될까?
//print(shoppingList) // 제거 및 변경 한번에 된다.
shoppingList[0...3] = ["Banana1", "Banana2", "Banana3", "Banana4", "Banana5", "Banana6"]
print(shoppingList)

shoppingList.insert("Apple", at: 0)
print(shoppingList)

// 배열의 값과 인덱스가 필요한 경우
for (index, value) in shoppingList.enumerated(){
    print("Item \(index+1): \(value)")
}
print(shoppingList.enumerated())

var tot  = 0.0
for i in sixDoubles{
    tot += i
}
print(tot)

// 최댓값 찾기
print(sixDoubles.max()!)
// 최솟값 찾기
print(sixDoubles.min()!) // 언랩핑 해야한다.




