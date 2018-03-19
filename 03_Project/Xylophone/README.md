## Xylophone
<a href="https://swift.org">
 <img src="https://img.shields.io/badge/Swift-4-orange.svg"
      alt="Swift" />
</a>
<a href="https://developer.apple.com/xcode">
  <img src="https://img.shields.io/badge/Xcode-9-blue.svg"
      alt="Xcode">
</a>
<a href="https://opensource.org/licenses/MIT">
  <img src="https://img.shields.io/badge/License-MIT-red.svg"
      alt="MIT">
</a>

> 실로폰 연주 앱 입니다.
> 위에서 부터 도,레,미,파,솔,라,시 의 음계이며 오디오는 AVFoundation 을 사용하였습니다.

<img src="/Img/Project/xylophone.gif" title="Xylophone" width="300px" float="center">

<br/>

```swift
let soundUrl = Bundle.main.url(forResource: soundFileName, withExtension: "wav")

do {
    audioPlayer = try AVAudioPlayer(contentsOf: soundUrl!)
} catch {
    print(error)
}
audioPlayer?.play()
```
