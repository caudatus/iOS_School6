# Collection Functions
1. zip
2. sequence
3. etc (enumerated, sorted, reversed)

## zip
```
func zip<Sequence1, Sequence2>(
  _ sequence1: Sequence1,
  _ sequence2: Sequence2
) -> Zip2Sequence<Sequence1, Sequence2> where Sequence1 : Sequence, Sequence2 : Sequence

두 개의 시퀀스를 통해 새로운 한 쌍의 시퀀스를 생성
```
```Swift
print("- example1 -")
let words = ["일", "이", "삼", "사"]
let numbers = 1...4

for (word, number) in zip(words, numbers) {
  print("\(word): \(number)")
}
//- example1 -
//일: 1
//이: 2
//삼: 3
//사: 4

print("\n- example2 -")
let naturalNumbers = 1...Int.max
let zipped = Array(zip(words, naturalNumbers))
print(zipped)
//- example2 -
//[("일", 1), ("이", 2), ("삼", 3), ("사", 4)]

print("\n- example3 -")
let names = ["James", "Edward", "John", "Jessie", "Julia"]
let scores = [100, nil, 90, nil, 70, nil]
zip(names, scores).forEach { print($0, $1) }
print()
zip(names, scores.flatMap { $0 }).forEach { print($0, $1) }
//- example3 -
//James Optional(100)
//Edward nil
//John Optional(90)
//Jessie nil
//Julia Optional(70)

//James 100
//Edward 90
//John 70

print("\n- example4 -")
let filenames = ["image", "text", "video"]
let extensions = ["png", "txt", "mpeg", "pdf", "jpeg", "html"]
zip(filenames, extensions).forEach { print($0 + "." + $1) }
//- example4 -
//image.png
//text.txt
//video.mpeg
```
<br/>
## sequence
```
func sequence<T>(first: T, next: (T) -> T?)
- first 값으로 시작하여 next 값을 lazy 하게 반복하는 순열 생성
```
```Swift
print("- example1 -")
var multiplyBy2 = sequence(first: 1) { $0 * 2 }
//multiplyBy2.forEach { print($0) }  // 무한루프
print(multiplyBy2.next())
print(multiplyBy2.next())
multiplyBy2.prefix(7).forEach { print($0) }
print(multiplyBy2.next())
multiplyBy2.prefix(2).forEach { print($0) }
//- example1 -
//Optional(1)
//Optional(2)
//4
//8
//16
//32
//64
//128
//256
//Optional(4)
//8
//16

print("\n- example2 -")
let repeatSeq = sequence(first: 5) { $0 }
for x in repeatSeq.prefix(5) {
  print(x)
}
//- example2 -
//5
//5
//5
//5
//5
```
<br/>
## enumerated, sorted, reversed
```Swift
print("\n---------- [ enumerated ] ----------\n")

for (idx, num) in [5,1,2,4,3].enumerated() {
  print(idx, num)
}
//---------- [ enumerated ] ----------

//0 5
//1 1
//2 2
//3 4
//4 3

print("\n---------- [ sorted ] ----------\n")

for (idx, num) in [5,1,2,4,3].sorted().enumerated() {
  print(idx, num)
}
//---------- [ sorted ] ----------

//0 1
//1 2
//2 3
//3 4
//4 5

print("\n---------- [ reversed ] ----------\n")

for (idx, num) in [5,1,2,4,3].sorted().enumerated().reversed() {
  print(idx, num)
}
//---------- [ reversed ] ----------

//4 5
//3 4
//2 3
//1 2
//0 1
```
