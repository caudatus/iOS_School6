## Weather_Now
> Xcode 9, iOS 11, swift 4

cocoapod 설치
터미널
1. sudo gem install cocoapods
2. pod setup --verbose
3. 터미널 상에서 프로젝트 폴더로 이동
4. pod init
5. open -a Xcode Podfile
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
```Swift
let API_KEY = "1efa0713e3aacf69eca77fc307401274"
let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
```



API respond
```javascript
{
  "main" : {
    "humidity" : 86,
    "temp_min" : 276.14999999999998,
    "temp_max" : 276.14999999999998,
    "temp" : 276.14999999999998,
    "pressure" : 1020
  },
  "name" : "Ch’ungch’ŏng-bukto",
  "id" : 1845106,
  "coord" : {
    "lon" : 128.11000000000001,
    "lat" : 36.740000000000002
  },
  "weather" : [
    {
      "main" : "Clouds",
      "icon" : "04n",
      "description" : "broken clouds",
      "id" : 803
    }
  ],
  "clouds" : {
    "all" : 75
  },
  "dt" : 1520514000,
  "base" : "stations",
  "sys" : {
    "sunset" : 1520501314,
    "sunrise" : 1520459312,
    "message" : 0.0058999999999999999,
    "id" : 7696,
    "type" : 1,
    "country" : "KR"
  },
  "cod" : 200,
  "visibility" : 6000,
  "wind" : {
    "deg" : 240,
    "speed" : 2.1000000000000001
  }
}
```
