
# CoreLocation

## info.plist 추가
key : Privacy - Location When In Use Usage Description
value : We need your location to obtain your current weather conditions

key : Privacy - Location Usage Description
value : We need your location to obtain your current weather conditions

소스보기로 전환하여 위 두개 프로퍼티 바로 밑에 아래의 소스를 넣는다.

<key>NSAppTransportSecurity</key>
<dict>
  <key>NSExceptionDomains</key>
  <dict>
    <key>openweathermap.org</key>
    <dict>
      <key>NSIncludesSubdomains</key>
      <true/>
      <key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
      <true/>
    </dict>
  </dict>
</dict>


## ViewController에 추가
델리게이트 추가 : CLLocationManagerDelegate
소스코드 추가
let locationManager = CLLocationManager()

viewDidLoad() 안에
locationManager.delegate = self
locationManager.desiredAccuracy = KCLLocationAccuracyHundredMeters
locationManager.requestWhenInUseAuthorization()
locationManager.startUpdationLocation() //gps위치파악 시작
