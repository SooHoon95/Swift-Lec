//
//  main.swift
//  Day01
//
//  Created by 최수훈 on 2021/07/14.
//

import Foundation

print("Hello, World!")

// comment

/*
 ----
 화면출력
 ----
 */
//문자출력

print("안녕하세요")

//숫자 출력
print(12345)

//계산출력
print(123+456)
/*
 상수와 변수의 작명규칙
 - Camel Case : function, method, variable, constant
 ex) studentName, studentAge ...
 
 - Pascal Case : class. struct, enum, extension,.. 이런거 할때 대문자로 시작해야함
 ex) Student, Product
  
 - Snake Case : underbar로 연결하여 사용
 
 - 대소문자 구분
 - 첫글자를 숫자나 특수문자로 시작하면 안되나,
    underbar(_)로 시작 가능(특수용도)
 
 */

// 상수 : 한번 선언된 값에 대해 변경이 불가능
/*
 let <variabel name> : <type> = <value>
 let은 데이터가 한번들어가면 못 바꾼다
 
 에러메세지 >> 아이콘 안에 하얀색 동그라미면은 자기가 fixed해준.
 */

var intLetNum1: Int = 200 // var는 변수 let 은 상수라고
let intLetNum2 = 100 // 확실하게 데이터 타입 알 때
let intLetNum3 : Int // int선언안해주면 밑에서 에러 걸림

intLetNum3 = 200 // 에러 // let

intLetNum1 = 2000 // var

let sum: Int
sum = intLetNum1 + intLetNum2
//print(sum)
//sum = intLetNum2 + intLetNum3

var nickName: String
nickName = "유비"

var aNum = 9, bNum = 10
//print(aNum,bNum)

/*
 문자열 보간법 (String Interpolation)
 */

let studentName = "홍길동"
print(type(of: studentName))

//출력방법
print("name : " + studentName)
print("name :", studentName)
print("name : \(studentName)")

let age : Int = 10
print("저는 \(age)살 입니다.")
print("저희 형은 \(age+4)살 입니다")

var name1 = "유비"
var age1 = 34
var gender1 = "남자"

//회원의 이름은 유비이고 나이는 34이며 성별은 남자입니다.
print("회원의 이름은 \(name1)이고 나이는 \(age1)이며 성별은 \(gender1)입니다.")


//Bool
var someBool: Bool = true

//Int
var someInt: Int = -100
someInt = 100_000 // 보기만 편할 뿐 그냥 십만 이라고 생각하면 됨.

//Float >>
var someFloat: Float = 3.134

//Double
var someDouble: Double = 3.12

//숫자 Type 변환
let doubleNum = 4.99999
print(Int(doubleNum))
print(Int(doubleNum.rounded())) // 반올림

//Character
var someCharacter: Character = "a"
someCharacter = "😗" // 이모지 집어넣기 ( 이모지는 그림이 아니라 문자임)
print(someCharacter)

//String
var someString: String = "😏🤬"
print(someString) // 이모지 여러개니까 스트링임

let temp = "b"
print(type(of: temp)) // 디폴트 타입이 스트링이다.

var someMultiString = """
    1234
    abcd
    가나다라
"""
print(someMultiString)


// 문자열과 특수문자
// \n, \t, \", \'

print("aa\tbb\ncc")
let wiseWords = "\"Imagination is more than the knowledge\" - Einstein"
print(wiseWords)

// 정리
var name: String
var size: Int
var weight: Double
var bag: Bool
var color: Character

name = "맥북프로"
size = 16
weight = 2.56
bag = false
color = "은"


print("이름: \(name)")
print("크기: \(size)")
print("무게: \(weight)")
print("가방: \(bag)")
print("색상: \(color)")

//문자열 수정
var variableString = "Horse"
variableString += " and carrige"
print(variableString)

var string1 = " hello"
var string2 = " there"
var welcome = string1 + string2
print(welcome)

string1.append(string2)
print(string1)

//문자길이
let str = "12345,67890"
print("str has \(str.count) characters")

//if 문
if str.count == 0{
    print("Data가 없습니다.")
}else{
    print("Data는 \(str) 입니다")
}


// Any, nil
// Any : Swift의 모든 타입을 지칭하는 키워드
// nil : null, Null, None


//Any
var someAny: Any = 100 // Any 타입은 언제나 지정해줘야함
someAny = "Type"
print(someAny)
someAny = 123.12
print(someAny)

var someDouble1: Double = 111.1
//print(someAny + someDouble1) // >> Error ; Any 타입은 같은 애니타입끼리만 계산할 수 있음. 굳이쓰려면 변환해줘야함
print(someAny as!Double + someDouble1)
//print((Double)someAny + someDouble1)

var someNil: String? // Null 값 체크를 미리 해둘 수 있다, << null Safety 또는 Optional
someNil = nil // 굳이 null 값을 줄일이 있을때는 이런게 넣어준다.

//Tuple
//Tuple사용전
var dialCode = 82
var isoCode = "KR"
var countryname = "Korea"

print(dialCode, isoCode, countryname)

//Tuple 사용
var country = (82, "KR", "Korea")
print(country) // >> 튜플모양으로 나옴. 위에랑똑같이 나오게하려면???
print(country.0, country.1, country.2)

var country1 = (dialCode1 : 82, isoCode1 : "KR", countryName1: "Korea")
print(country1.dialCode1, country1.isoCode1, country1.countryName1)
    
//Type 별칭 >> 타입을 만들 수 있다.
typealias MyInt = Int
let age2: MyInt = 20

typealias person = (name: String, height: Int, marriage: Bool)

var p1: person = ("유비", 180, true)
print(p1.name)

//Tuple을 사용하여 직사각형의 넓이와 둘레를 출력

typealias Rectangle = (Name : String, L:Int, W: Int, area: Int, border: Int)
var r1: Rectangle = ("직사각형", 5,6,0,0)
r1.area = (r1.L * r1.W)
r1.border = ((r1.L*2) + (r1.W*2))
print(r1)


// 연산자
let(x1, y1) = (1, "Kim")
print(x1)
print(y1)

//사칙연산자
print(10/3) // 정수만 출력
print(10.0 / 3.0) // 실수만 출력


//단항 음수 연산자
let one = 1
let minusOne = -one
print(minusOne)






