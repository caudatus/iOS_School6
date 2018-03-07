## Subscript

* 클래스, 구조체, 열거형의 collection, list, sequence의 멤버에 접근 가능한 단축문법인 Subscript를 정의할 수 있다.
* Subscript는 별도의 setter/getter 없이 index를 통해서 데이터를 설정하거나 값을 가져오는 기능을 할 수 있다.
* Array[index], Dictionary["key"]등의 표현이 Subscript이다.


### 문법
>연산 프로퍼티와 문법이 같다.
```swift
subscript(index: Type) -> Type {
  get {
    // return an appropriate subscript value here
  }
  set(newValue) {
      // perform a suitable setting action here
  }
}

subscript(index: Type) -> Type {
  // return an appropriate subscript value here
}
```

### 예제 1
```swift
struct TimesTable {
  let multiplier: Int
  subscript(index: Int) -> Int {
    return multiplier * index
  }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")
```

### 예제 2
```swift
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]

    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }

    subscript(row: Int, column: Int) -> Double {
        get {
            return grid[(row * columns) + column]
        }
        set {
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 3, columns: 3)
matrix[0,0] = 1
matrix[0,1] = 2
```
