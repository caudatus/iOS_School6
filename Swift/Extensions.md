# Extensions

* Extensions 기능은 기존 클래스, 구조체, 열거형 또는 프로토콜 유형에 새로운 기능을 추가합니다.
* Extensions 으로 할 수 있는 것들
> 1. Add computed instance properties and computed type properties
> 2. Define instance methods and type methods
> 3. Provide new initializers
> 4. Define subscripts
> 5. Define and use new nested types
> 6. Make an existing type conform to a protocol

* Extensions 에서 할 수 없는 것들
> 1.상속을 받을 수 없다.
> 2.stored properties 사용할 수 없다.

## 문법
```swift
extension SomeType {
  // new functionality to add to SomeType goes here
}

extension SomeType: SomeProtocol, AnotherProtocol {
  // implementation of protocol requirements goes here
}
```

## 유형 : Compute properties
```swift
extension Double {
  var km: Double { return self * 1_000.0 }
  var m: Double { return self }
  var cm: Double { return self / 100.0 }
  var mm: Double { return self / 1_000.0 }
  var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// Prints "One inch is 0.0254 meters"

let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
// Prints "Three feet is 0.914399970739201 meters"
```

## 유형 : init
```swift
extension Rect {
  init(center: Point, size: Size) {
    let originX = center.x - (size.width / 2)
    let originY = center.y - (size.height / 2)
    self.init(origin: Point(x: originX, y: originY), size: size)
  }
}
```

## 유형 : method
```swift
extension Int {
  func repetitions(task: () -> Void) {
    for _ in 0..<self {
      task()
    }
  }
}

3.repetitions {
  print("Hello!")
}
// Hello!
// Hello!
// Hello!
```

## 유형 : mutation method
```swift
extension Int {
  mutating func square() {
    self = self * self
  }
}

var someInt = 3
someInt.square()
```

## 유형 : Subscript
```swift
extension Int {
  subscript(digitIndex: Int) -> Int {
    var decimalBase = 1
    for _ in 0..<digitIndex {
      decimalBase *= 10
    }
    return (self / decimalBase) % 10
  }
}

746381295[0]
// returns 5

746381295[1]
// returns 9

746381295[2]
// returns 2

746381295[8]
// returns 7
```
