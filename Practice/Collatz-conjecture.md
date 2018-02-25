## Collatz conjecture
콜라츠 추측 (Collatz conjecture)은 1937년에 처음으로 이 추측을 제기한 로타르 콜라츠의 이름을 딴 것으로 3n+1 추측, 울람 추측, 혹은 헤일스톤(우박) 수열 등 여러 이름으로 불린다. 콜라츠 추측은 임의의 자연수가 다음 조작을 거쳐 항상 1이 된다는 추측이다.

짝수라면 2로 나눈다.
홀수라면 3을 곱하고 1을 더한다.
1이면 조작을 멈추고, 1이 아니면 첫 번째 단계로 돌아간다.
예를 들어, 6 에서 시작한다면, 차례로 6, 3, 10, 5, 16, 8, 4, 2, 1 이 된다.

또, 27에서 시작하면 무려 111번을 거쳐야 1이 된다. 77번째에 이르면 9232를 정점으로 도달하다가 급격히 감소하여 34단계를 더 지나면 1이 된다.

```swift
func collatz(number: Int) {

    var count: Int = 0
    var calNum: Int = number

    while calNum != 1 {
        if (calNum % 2) == 0 {
            calNum /= 2
        } else {
            calNum = (calNum * 3) + 1
        }
        count += 1
    }
    print("How many times to ONE ? = \(count) times")
}
```
