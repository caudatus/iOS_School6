## Xylophone
> Xcode 9.2, iOS 10.0, swift 4.0

<img src="/Img/xylophone.gif" title="Xylophone" width="300px" float="center">

실로폰 연주 앱 입니다. 위에서 부터 도,레,미,파,솔,라,시 의 음계이며
오디오는 AVFoundation 을 사용하였습니다.

```swift
let soundUrl = Bundle.main.url(forResource: soundFileName, withExtension: "wav")

do {
    audioPlayer = try AVAudioPlayer(contentsOf: soundUrl!)
} catch {
    print(error)
}
audioPlayer?.play()
```
