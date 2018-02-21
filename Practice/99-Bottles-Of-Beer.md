## 99 Bottles Of Beer
>하나의 노래를 다른 프로그래밍 언어로 작성하는 프로젝트

```swift
func lyricsOfTheSong(forBottlesOfBeer numberOfBottles : Int)  {

    for number in (1...numberOfBottles).reversed() {
        var lyrics: String = ""
        if number != 1 {
            lyrics = "\n\(number) bottles of beer on the wall, \(number) bottles of bear. \nTake one down and pass it around, \(number - 1) bottles of beer on the wall. \n"
        } else {
            lyrics = "\n\(number) bottles of beer on the wall, \(number) bottles of bear. \nTake one down and pass it around, no more bottles of beer on the wall. \n"
        }
        print(lyrics)
    }
    print("\nNo more bottles of beer on the wall, no more bottles of bear. \nGo to the store and buy some more, 99 bottles of beer on the wall.\n")
}
```
[99-bottles-of-beer.net](http://99-bottles-of-beer.net/)
