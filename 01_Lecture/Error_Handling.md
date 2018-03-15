# Error Handling

## 4 ways to handle errors
1. Propagating Errors Using Throwing Functions
2. Handling Errors Using Do-Catch
3. Converting Errors to Optional Values
4. Disabling Error Propagation

<br/>
### 1. Propagating Errors
```Swift
// 오류에 대한 처리를 코드의 다른 부분에서 처리하도록 throws 키워드를 명시적으로 선언
// throws 키워드가 없을 때는 오류를 해당 함수 내에서 처리해야 함
func foo() -> Int { }  // This function is not permitted to throw.
func bar() throws -> Int { }  // This function is permitted to throw.

func foo() throws { }
func bar(_ callback: () throws -> ()) throws { }

//Throwing initializer
struct PurchasedSnack {
  let name: String
  init(name: String, vendingMachine: VendingMachine) throws {
    try vendingMachine.vend(itemNamed: name)
    self.name = name
  }
}

//Distinct types
let a: () -> () -> ()
let b: () throws -> () -> ()
let c: () -> () throws -> ()
let b: () throws -> () throws -> ()

//throws function > non throws function
// OK
func cannotThrowFunction() -> Int { return 10 }
func canThrowFunction(_ generator: () throws -> Int) -> Void { }
canThrowFunction(cannotThrowFunction)


// Error
func canThrowFunction() throws -> Int { return 10 }
func cannotThrowFunction(_ generator: () -> Int) -> Void { }
cannotThrowFunction(canThrowFunction)

//rethrows
// throwing 함수를 인자로 취하는 함수는 throws 대신 rethrows 를 사용 가능
// rethrows 를 선언한 함수는 반드시 매개 변수 중 하나 이상에 throwing 포함 필요
// thrwos 와 역할 자체는 동일하나 사용에 있어서 차이
private func throwsFunctionExample() throws {}
private func throwsFunctionExample() rethrows {} // Error
private func rethrowsFunctionExample(_ fn: () throws -> ()) rethrows {}
```
<br/>
### 2. Handling Errors Using Do-Catch
```Swift
do {
  try <expression>
  <statement>
} catch <pattern 1>{
  <statement>
} cath <pattern 2> where <condition> {
  <statement>
} catch {
  <statement>
}

//Catch error cases
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8

do {
  try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
  print("Success! Yum.")
} catch VendingMachineError.invalidSelection {
  print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
  print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
  print("Please insert an additional \(coinsNeeded) coins.")
} catch {
  print("Unexpected error: \(error).")
}
```
<br/>
### 3. Converting Errors to Optional Values
```Swift
// try? 를 사용하여 do ~ catch 구문 없이 오류 처리 가능 
// 정상 수행 시 Optional 값 반환, 오류 발생 시 nil 반환
func someThrowingFunction() throws -> Int {
  // ...
}

let x = try? someThrowingFunction()

let y: Int?
do {
  y = try someThrowingFunction()
} catch {
  y = nil
}


func someThrowingFunction() throws -> Int { }
let x = try? someThrowingFunction()
do {
  _ = try someThrowingFunction()
} catch { }


func fetchData() -> Data? {
  if let data = try? fetchDataFromDisk() { return data }
  if let data = try? fetchDataFromServer() { return data }
  return nil
}
```
<br/>
### 4. Disabling Error Propagation
```Swift
// do ~ catch 구문 없이 throws 메서드 처리 가능하지만 오류 발생 시 앱 Crash
// 오류가 발생하지 않는다고 확신할 수 있는 경우에만 try! 사용 
// ex) 앱 번들에 함께 제공되는 이미지 로드 등
let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")
```
