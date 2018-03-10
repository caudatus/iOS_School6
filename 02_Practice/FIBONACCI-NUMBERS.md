## FIBONACCI NUMBERS
> 피보나치 수열 - 원하는 갯수의 수를 입력받아 그 수만큼의 피보나치 수열을 출력

```swift
/*

 FIBONACCI NUMBERS
 0, 1, 1, 2, 3, 5, 8, 13, 21 ...

 */
import UIKit

func fibonacci(until n: Int) {

    var num_1: Int = 0
    var num_2: Int = 1

    var sumStr: String = "\(num_1), \(num_2)"

    for _ in 0...n {
        let sum = num_1 + num_2
        sumStr += ", \(sum)"

        num_1 = num_2
        num_2 = sum
    }

    print(sumStr)
}
```
