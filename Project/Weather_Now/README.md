## Weather_Now
> Xcode 9, iOS 11, swift 4

<img src="/Img/Project/ title="Xylophone" width="300px" float="center">

cocoapod
터미널
1. sudo gem install cocoapods
2. pod setup --verbose
3. 터미널 상에서 프로젝트 폴더로 이동
4. pod init
5. open -a Xcod Podfile
   --> 아래 내용으로 수정
```
platform :ios, '11.0'

target 'Weather_Now' do

  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Weather_Now

    pod 'SwiftyJSON'
    pod 'Alamofire'
    pod 'SVProgressHUD'

end
```
6. pod install

OpenWeatherMap
