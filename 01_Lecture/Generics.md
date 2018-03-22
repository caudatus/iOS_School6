# Generics (수정중)

* 어떤 타입에도 유연한 코드를 구현하기 위해 사용되는 기능
* 재사용가능한 함수와 타입이 어떤 타입과도 작업 가능
* 코드의 중복을 줄이고, 깔끔하고 추상적인 표현이 가능하다.

> 제네릭 코드는 유연하게 작성할 수 있고, 재사용가능한 함수와 타입이 어떤 타입과 작업할 수 있도록 요구사항을 정의한다. 또한 중복을 피하고 의도를 명확하게 표현하고, 추상적인 방법으로 코드를 작성할 수 있다.

>제네릭은 Swift에서 가장 강력한 기능 중 하나로 Swift 표준 라이브러리 대다수는 제네릭 코드로 만들졌다. Swift의 배열과 딕셔너리 타입은 제네릭 타입이며, Int 값을 가지는 배열이나 String 값을 가지는 배열 또는 다른 타입으로 배열을 만들 수 있다. 유사하게 지정된 타입의 값을 저장하는 딕셔너리를 만들 수 있으며, 이러한 타입은 제한이 없다.

## Generic Functions
제네릭 함수는 어떤 타입으로도 작업할 수 있다. 다음은 swapTwoValues(_ : _ : ) 라고 하는 제네릭 버전의 swapTwoInts(_ : _ : ) 함수이다.
```Swift
func swapTwoValues<T>(inout a: T, inout b: T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoInts(_ a: inout Int, _ b: inout Int)
func swapTwoValues<T>(_ a: inout T, _ b: inout T)
```
이 함수의 제네릭 버젼은 실제(actual) 타입의 이름(Int, String, Double) 대신에 견본(placeholder) 타입의 이름(T)을 사용합니다. 견본타입의 이름은 반드시 T가 아니어도 되지만, T가 무엇이던간에, a와 b 둘 다 반드시 같은 타입 T이어야 하는 것을 말합니다. 실제 타입은swapTwoValues(_:_:)함수가 호출될때마다 T의 위치에 사용하여 결정될 것입니다.

제네릭 함수와 제네릭이 아닌 함수간의 다른 차이점은 제네릭 함수의 이름(swapTwoValues(_:_:)) 뒤에 꺽쇠 괄호(<T>)에 안에 견본 타입 이름(T)를 넣는 것입니다. Swift에서 이러한 꺽쇠 괄호(<>)는 swapTwoValues(_:_:)함수와 함께 T가 견본 타입이름으로 정의 되었다는 것을 말합니다. T는 견본이기 때문에, Swift는 T의 실제 타입을 찾지 않습니다.

swapTwoValues(_:_:)함수는 이제 모든 타입의 값 두개를 전달할수 있는 것만 제외하고, swapTwoInts와 같은 방법으로 호출할수 있으며, 이 값들 모두 서로 같은 타입이 됩니다. swapTwoValues(_:_:)이 호출될때마다, T에 사용할 타입은 함수에 전달된 값의 타입으로 추론됩니다.

아래 두개의 예제에서, T는 각각 Int와 String으로 추론됩니다.
