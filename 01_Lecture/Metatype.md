# Metatype

## Basic
> Metatype > Type > Instance
```swift
print("\n---------- [ String Type itself] ----------\n")

/***************************************************
 String.Type > String > String

 let str = "String"
 str : struct String 의 객체
 String : struct String 자체에 대한 참조, String 메타타입(String.Type) 의 객체.  String.self 로 접근
 String.Type : String 의 메타타입
 ***************************************************/

//let _ = Swift.NSString.init("initString")  // Error
let swiftString = Swift.String.init("initString")
let swiftStringSelf = Swift.String.self
let swiftStringType = type(of: swiftString)
let swiftStringMetatype = type(of: Swift.String.self)
let swiftStringMetatypeSelf = swiftStringMetatype.self
let swiftStringMetatypeType = type(of: swiftStringMetatype)
print(swiftString)
print(swiftStringSelf)
print(swiftStringType)
print(swiftStringMetatype)
print(swiftStringMetatypeSelf)
print(swiftStringMetatypeType)

//---------- [ String Type itself] ----------

//initString
//String
//String
//String.Type
//String.Type
//String.Type.Type


print("\n---------- [ String Types ] ----------\n")

let str: String = "myString"
let stringSelf: String = "myString".self
let stringType: String.Type  = type(of: "myString")
let stringMetatype: String.Type.Type  = type(of: type(of: "myString"))
print(str)
print(stringSelf)
print(stringType)
print(stringMetatype)

//---------- [ String Types ] ----------

//myString
//myString
//String
//String.Type

print("\n---------- [ Protocol Types ] ----------\n")

struct S {}
class C {}
enum E {}
protocol P {}
print(type(of: S.self))
print(type(of: C.self))
print(type(of: E.self))
print(type(of: P.self))

//---------- [ Protocol Types ] ----------

//S.Type
//C.Type
//E.Type
//P.Protocol
```

## Test Code
> [Swift Metatypes Test Code][swift_github]

```swift
// Swift 공식 GitHub 내 테스트 코드

struct Test0 {}

var test0 : Test0.Type = Test0.self
print(test0)
//Test0

test0 = Test0.self
print(test0)
//Test0

class Test1a {
  init() { }
  class func foo() {}
}
class Test1b : Test1a {
  override init() { super.init() }
}

Test1b.foo()

var test1 = Test1a.self
print(test1)
//Test1a

test1 = Test1b.self
print(test1)
//Test1b

var x = Test1b()
print(x)
//__lldb_expr_7.Test1b

test1 = type(of: x)
print(test1)
//Test1b

```
[swift_github]: https://github.com/apple/swift/blob/master/test/type/metatype/metatypes.swift

## Type Check
```swift
import Foundation

print("\n---------- [ Print Type ] ----------\n")

private func printType<T>(of type: T.Type) {
  print("\(type)")
}
printType(of: type(of: Int.self))
printType(of: Int.self)
printType(of: type(of: 10))

// ---------- [ Print Type ] ----------

// Int.Type
// Int
// Int



print("\n---------- [ Print Instance ] ----------\n")

private func printInstance<T>(of instance: T) {
  print("\(instance)")
}
printInstance(of: Int.self)
printInstance(of: 10)

// ---------- [ Print Instance ] ----------

// Int
// 10



print("\n---------- [ Instance Type Check ] ----------\n")

let str = "StringInstance"
print(str is String)           // true, str 은 String Type 의 객체
print(str == "StringInstance") // true, str 은 "StringInstance" 와 동일
print(str is String.Type)      // false
print(str is String.Type.Type) // false

// ---------- [ Instance Type Check ] ----------

// true
// true
// false
// false



print("\n---------- [ Type's Type check ] ----------\n")

print(type(of: str) is String)       // false
//print(String is String)    //false
print(type(of: str) == String.self)  // true, str 객체의 타입은 String 그 자체
print(type(of: str) is String.Type)  // true, str 객체의 타입은 String.Type 의 객체
print(String.self is String.Type)     //true, str 객체의 타입은 String.Type의 객체
print(type(of: str) is String.Type)  //true, str 객체의 타입은 String.Type의 객체

// ---------- [ Type's Type check ] ----------

// false
// true
// true
// true
// true



print("\n---------- [ Metatype's Type check ] ----------\n")

private let meta = type(of: String.self)
print(meta is String)  // false
print(meta == String.self)  // false
print(meta == String.Type.self)  // true, String 메타타입은 String.Type
print(meta is String.Type.Type)  // true, String 메타타입은 String.Type.Type 의 객체

// ---------- [ Metatype's Type check ] ----------

// false
// false
// true
// true
```

## Usage
```swift
class A {
  static func staticMethod() { print("Type Method(static func)") }
  class func classMethod() { print("Type Method(class func)") }
  func instanceMethod() { print("instance") }
  func instanceMethodWithNumber(_ number: Int) { print("Number :", number) }
}

let aInstance = A()
type(of: aInstance).classMethod()
type(of: aInstance).instanceMethodWithNumber(aInstance)(5)
// Type Method(class func)
// Number : 5

A.staticMethod()
A.classMethod()
A.instanceMethod(aInstance)()
// Type Method(static func)
// Type Method(class func)
// instance

let aSelf = A.self
aSelf.staticMethod()
aSelf.classMethod()
aSelf.instanceMethod(aInstance)()
aSelf.instanceMethodWithNumber(aInstance)(3)
// Type Method(static func)
// Type Method(class func)
// instance
// Number : 3


print("\n---------- [ Custom Type ] ----------\n")

// 일반적으로 typealias 사용
// typealias log = HandyLog
typealias MyString = String
let str = MyString("MyString Value")
print(str)

// 다음 방식으로도 활용 가능. 단 제약사항 존재
let IntArrayType = Array<Int>.self   // IntArrayType: Array<Int>.Type
// initializing from a metatype value must reference 'init' explicitly
let arr = IntArrayType.init(repeating: 5, count: 3)
print(arr)

// ---------- [ Custom Type ] ----------

// MyString Value
// [5, 5, 5]


/***************************************************
 그 외 실제 사용 예제
 ==============
 1. JSONDecoder decode
 open class JSONDecoder {
   func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
 }
 e.g. try JSONDecoder().decode(MyClass.self, from: data)

 2. UITableView Dynamic Cell Register
 tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")

 3. UITableViewCell identifier extension
 extension UITableViewCell: TableViewCellType {
   static var identifier: String { return String(describing: self.self) }
 }
 e.g. CustomCell.identifier  -> "CustomCell"

 4. Storyboard instantiate extension
 extension UIStoryboard {
   func instantiateViewController<T>(ofType type: T.Type) -> T {
     return instantiateViewController(withIdentifier: String(describing: type)) as! T
   }
 }
 ***************************************************/
```
