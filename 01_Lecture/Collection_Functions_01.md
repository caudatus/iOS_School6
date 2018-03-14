# Collection Functions
1. stride
2. repeatElement

## stride(from:to:by:)
> from 값으로 시작하여 by 값만큼 증가하면서 to 값을 포함하지 않는 (숫자 부호에 따라 작거나 큰) 숫자까지 반복
```swift
print("- example1 -")
let strideThrough = stride(from: 0, to: 6, by: 3)
var iterator = strideThrough.makeIterator()
while let element = iterator.next() {
  print(element)
}
//- example1 -
//0
//3

print("\n- example2 -")
for i in stride(from: 0, to: 10, by: 2) {
  print(i, terminator: " ")
}
print()
//- example2 -
//0 2 4 6 8

print("\n- example3 -")
for radians in stride(from: 0.0, to: .pi * 2, by: .pi / 2) {
  let degrees = Int(radians * 180 / .pi)
  print("Degrees: \(degrees), radians: \(radians)")
}
//- example3 -
//Degrees: 0, radians: 0.0
//Degrees: 90, radians: 1.5707963267949
//Degrees: 180, radians: 3.14159265358979
//Degrees: 270, radians: 4.71238898038469

print("\n- example4 -")
for countdown in stride(from: 3, to: 0, by: -1) {
  print(countdown, "...", separator: "")
}
//- example4 -
//3...
//2...
//1...

print("\n- example5 -")
for i in stride(from: 0, to: 5, by: -1) {
  print(i)      // print nothing
}
//- example5 -
```
<br/>
## stride(from:through:by:)
> from 값으로 시작하여 stride 값만큼 증가하면서 through 값을 포함한 숫자까지 반복
```swift
print("- example1 -")
for i in stride(from: 0, through: 6, by: 3) {
  print(i)
}
//- example1 -
//0
//3
//6


print("\n- example2 -")
for countdown in stride(from: 3, through: 0, by: -1) {
  print(countdown, "...", separator: "")
}
//- example2 -
//3...
//2...
//1...
//0...
```
<br/>
## repeatElement

> func repeatElement<T>(_ element: T, count n: Int) -> Repeated<T>
동일 요소를 count 값만큼 가진 컬렉션 생성

```swift
print("- example1 -")
let zeroes = repeatElement(0, count: 5)
for x in zeroes {
  print(x)
}
//- example1 -
//0
//0
//0
//0
//0

print("\n- example2 -")
for x in repeatElement(true, count: 3) {
  print(x)
}
//- example2 -
//true
//true
//true

print("\n- example3 -")
//private let printString: (String) -> () = { print($0) }
private func printString(_ str: String) { print(str) }
repeatElement("Swift", count: 3)
  .forEach(printString(_:))
//- example3 -
//Swift
//Swift
//Swift
```
