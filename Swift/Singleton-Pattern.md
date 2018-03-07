## Singleton Pattern

싱글톤 이란 어플리케이션 전 영역에 걸쳐 하나의 클래스의 단 하나의 인스턴스(객체)만을 생성하여 사용하는 것을 싱글톤 패턴이라고 한다.
* 사용이유 : 어플리케이션 내부에서 유일하게 하나만 필요한 객체에서 사용한다.
          예) 셋팅, 데이터 등
* 사용방법 : class 메소드로 객체를 만들며 static 을 이용해서 단 1개의 인스턴스만 만든다.

### Singleton Pattern 인스턴스 생성 예제
```swift
class SingletonClass {
    // MARK: Shared Instance
    static var sharedInstance:SingletonClass = SingletonClass()

    // Can't init is singleton
    private init(){
    //초기화가 필요하면 private로 생성
  }
}
```



### Singleton Pattern 예제
```swift
//스크린 정보를 가지고 있는 객체
let screen = UIScreen.main

//사용자 정보를 저장하는 객체
let data = UserDefaults.standard

//어플리케이션 객체
let app = UIApplication.shared

//파일 시스템 정보를 가지고 있는 객에
let fileManager = FileManager.default
```
