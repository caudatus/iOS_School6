## Xylophone
![Swift](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat-square) ![Xcode](https://img.shields.io/badge/Xcode-9-blue.svg?longCache=true&style=flat-square) [![License](https://img.shields.io/badge/License-MIT-green.svg?longCache=true&style=flat-square)](https://github.com/caudatus/SeoJaeHyeong_iOS_School6/blob/master/LICENSE)

&#10077; 실로폰 연주 앱 입니다. &#10078;
&#10077; 위에서 부터 도,레,미,파,솔,라,시 의 음계이며 오디오는 AVFoundation 을 사용하였습니다. &#10078;

<br/>

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
