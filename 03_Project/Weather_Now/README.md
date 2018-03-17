## Weather_Now
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
<a href="https://github.com/MessageKit/MessageKit/issues">
   <img src="https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat"
        alt="Contributions Welcome">
</a>

- Main View : 현재날씨(날씨 아이콘, 기온, 현재 지역 도시)
- Forecast View : 5일간 날씨예보 표시(데이트, 날씨아이콘, 기온)

<img src="/Img/Project/weather_now.gif" title="Weather" width="300px" float="center">

## cocoapod 설치
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

## OpenWeatherMap
```Swift
//openweather.com api key
let API_KEY = "1efa07....77fc307401274"
//openweather.com 5days forecast api url
let FORECAST_WEATHER_URL = "http://api.openweathermap.org/data/2.5/forecast"
let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
```

## API respond
### 현재 날씨 정보
```JSON
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
### 3시간 간격, 5일 예보 데이터
```JSON
{
  "list" : [
  {
  "main" : {
    "grnd_level" : 1004.87,
    "temp_min" : 279.75,
    "temp_max" : 280.27800000000002,
    "temp" : 279.75,
    "sea_level" : 1034.1199999999999,
    "pressure" : 1004.87,
    "humidity" : 89,
    "temp_kf" : -0.52000000000000002
  },
  "clouds" : {
    "all" : 0
  },
  "weather" : [
    {
      "main" : "Clear",
      "icon" : "01n",
      "description" : "clear sky",
      "id" : 800
    }
  ],
  "dt_txt" : "2018-03-13 18:00:00",
  "dt" : 1520964000,
  "sys" : {
    "pod" : "n"
  },
  "wind" : {
    "deg" : 250.5,
    "speed" : 2.46
  }
},

...

{
     "main" : {
       "grnd_level" : 1003.5,
       "temp_min" : 276.83699999999999,
       "temp_max" : 276.83699999999999,
       "temp" : 276.83699999999999,
       "sea_level" : 1033.3800000000001,
       "pressure" : 1003.5,
       "humidity" : 91,
       "temp_kf" : 0
     },
     "clouds" : {
       "all" : 64
     },
     "weather" : [
       {
         "main" : "Clouds",
         "icon" : "04n",
         "description" : "broken clouds",
         "id" : 803
       }
     ],
     "dt_txt" : "2018-03-18 15:00:00",
     "dt" : 1521385200,
     "sys" : {
       "pod" : "n"
     },
     "rain" : {

     },
     "wind" : {
       "deg" : 66.501199999999997,
       "speed" : 1.3700000000000001
     },
     "snow" : {

     }
   }
 ],
 "cod" : "200",
 "cnt" : 40,
 "message" : 0.1981,
 "city" : {
   "name" : "Ch’ungch’ŏng-bukto",
   "id" : 1845106,
   "coord" : {
     "lat" : 36.75,
     "lon" : 128
   },
   "country" : "KR"
 }
}
```
