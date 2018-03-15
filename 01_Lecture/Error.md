# Error

## What is Error?
Swift 에서 정의하는 심각도에 따른 4가지 유형의 오류
* simple domain error (단순 도메인 오류)
* recoverable (복구 가능한 오류)
* universal error (범용 오류)
* logic failure (논리적 오류)

## Error 란?
1. simple domain error (단순 도메인 오류)
    * 명백하게 실패하도록 되어 있는 연산 또는 추측에 의한 실행 등으로 발생
      * 1 숫자가 아닌 문자로부터 정수를 파싱
      * 2 빈 배열에서 어떤 요소를 꺼내는 동작 등
    * 오류에 대한 자세한 설명이 필요하지 않으며 대개 쉽게 또 즉시 에러를 처리할 수 있음
    * Optional Value 등을 통해 Swift 에 잘 모델링되어 있어서 더 복잡한 솔루션이 필요 없음
2. recoverable (복구 가능한 오류)
    * 복잡한 연산을 수행하는 도중 실패가 발생할 수 있지만 사전에 미리 오류를 합리적으로 예측할 수 있는 작업
      * 예) 파일을 읽고 쓰는 작업, 네트워크 연결을 통해 데이터 읽기 등
    * iOS 에서는 NSError 또는 Error 를 이용하여 처리
    * 일반적으로 이런 오류의 무시는 좋지 않으며 위험할 수도 있으므로 오류를 처리하는 코드를 작성하는 것이 좋다.
    * 오류 내용을 유저에게 알려주거나, 다시 해당 오류를 처리하는 코드를 수행하여 처리하는 것이 일반적이다.
3. universal error (범용 오류)
    * 시스템이나 어떤 다른 요인에 의한 오류
    * 이론적으로는 복구가 가능하지만, 어느 지점에서 오류가 발생하는 지 예상하기 어려움
4. logic failure (논리적 오류)
    * Logic 에 대한 오류는 프로그래머의 실수로 발생하는 것으로 프로그램적으로 컨트롤할 수 없는 오류에 해당
    * 시스템에서 메시지를 남기고 abort()를 호출하거나 Exception 발생

<br/>
## Error Handling
* 프로그램 동작 중 예상 가능한 오류가 발생했을때 이를 감지하고 복구하기 위한 일련의 처리과정
* Exception Handling과 유사하지만 다른 특성들을 지닌 부분이 있어 의도적으로 다른 용어를 사용
<br/>
## 4 ways to handle errors
* Propagating Errors Using Throwing Functions
* Handling Errors Using Do-Catch
* Converting Errors to Optional Values
* Disabling Error Propagation
<br/>
## Specifying Cleanup Actions

* defer - 현재 코드 블럭이 종료되기 직전에 반드시 실행되어야 하는 코드 등록
* 해당 범위가 종료될 때까지 실행을 연기하며 소스 코드에 기록된 순서의 역순으로 동작

```Swift
func processFile(filename: String) throws {
  if exists(filename) {
    let file = open(filename)
    defer {
      close(file)
    }
    while let line = try file.readline() {
      // Work with the file.
    }
    // close(file) is called here, at the end of the scope.
  }
}
```
<br/>
## Error
```Swift
public protocol Error {
}

extension Error {
}

extension Error where Self.RawValue : SignedInteger {
}

extension Error where Self.RawValue : UnsignedInteger {
}

open class NSError : NSObject, NSCopying, NSSecureCoding {
  // ...
}

extension NSError : Error {
}
```
<br/>
## Define Custom Error
```Swift
enum IntParsingError: Error {
  case overflow
  case invalidInput(String)
}
extension Int {
  init(validating input: String) throws {
    // …
    if !isValid(character) {
      throw IntParsingError.invalidInput(character)
    }
  }
}

do {
  let price = try Int(validating: "$100")
} catch IntParsingError.invalidInput(let invalid) {
  print("Invalid character: '\(invalid)'")
} catch IntParsingError.overflow {
  print("Overflow error")
} catch {
  print("Other error")
}

——————————————————————————————————————————————————

struct XMLParsingError: Error {
  enum ErrorKind {
    case invalidCharacter
    case mismatchedTag
    case internalError
  }

  let line: Int
  let column: Int
  let kind: ErrorKind
}

func parse(_ source: String) throws -> XMLDoc {
  // ...
  throw XMLParsingError(line: 19, column: 5, kind: .mismatchedTag)
  // ...
}

——————————————————————————————————————————————————

do {
  throw XMLParsingError(line: 12, column: 15, kind: .mismatchedTag)
} catch where error is XMLParsingError {
  // ...
} catch where error is IntParsingError {
  // ...
} catch {
  // ...
}
```
