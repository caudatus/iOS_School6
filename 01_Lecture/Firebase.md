# Firebase (수정중)
클라우드 서비스를 제공자이며 동시에 BackEnd 기능을 가지고 있다.
* 다양한 플랫폼과 기기에서 어플리케이션 데이터를 실시간 동기화를 지원
* Authentication
* Realtime Database
* Storage
* Crash Report
* Analytics 등 지원

## 분석 - Analytics
Firebase Analytics는 Google이 모바일 앱을 위해 선보이는 완전히 새롭고 **무제한 사용**할 수 있는 **무료** 분석 솔루션 입니다. 이 솔루션은 크게 두 가지 차이점이 있습니다.

**첫째**, Firebase Analytics는 **사용자 및 이벤트 중심적**으로 설계되었습니다. 전통적인 페이지뷰, 화면 뷰, 그리고 세션에 중점을 두는 대신 사용자들이 여러분의 앱에서 무엇을 하는지 파악할 수 있게 해줍니다. 또한, 사용자들이 어디서 오는지 알 수 있는 교차 네트워크 특성을 통해 여러분의 유료 광고 캠페인이 어떤 성과를 거두고 있는지도 확인할 수 있습니다. 이 모든 것들을 하나의 대시보드에서 볼 수 있습니다.

**둘째**, Firebase Analytics는 Firebase의 다양한 기능을 통합할 수 있는 잠재고객 기능을 통해 공통의 특성을 지닌 사용자 그룹을 정의할 수 있습니다. 사용자 그룹이 정의되면 다른 Firebase 기능을 활용할 때 특정 그룹을 기반으로 기능을 적용할 수 있습니다.

[Analytics 소개][analytics]
[iOS에서 Firebase용 Google 애널리틱스 시작하기][ios_analytics]

[ios_analytics]: https://firebase.google.com/docs/analytics/ios/start
[analytics]: https://firebase.google.com/docs/analytics/

## 개발 - Develop
**Realtime Database**
```
Firebase는 실시간 데이터베이스와 백엔드 서비스를 제공합니다.
이 서비스는 어플리케이션 개발자에게 하나의 API를 제공하는데 이 API는 어플리케이션 데이터가 고객 그리고 저장된 Firebase 클라우드와 자동 동기화되도록 해줍니다.
```

[Firebase 실시간 데이터베이스][realtime]

[realtime]: https://firebase.google.com/docs/database/

**Storage**
```
개발자분들이 가장 많이 바라는 기능 중의 하나가 바로 이미지, 동영상 및 기타 대용량 파일을 저장하는 기능입니다. 그래서 Google에서는 개발자들이 쉽고 안전하게 이런 파일들을 업로드하고 다운로드할 수 있는 Firebase 저장소를 출시합니다.
Google 클라우드 저장소가 제공하는 Firebase 저장소는 대규모의 확장성을 제공하며, Google 클라우드 프로젝트에서 저장된 파일에 손쉽게 액세스할 수 있게 해줍니다.
Firebase 저장소 클라이언트 SDK는 네트워크 상태가 불량한 문제를 SDK 내부에서 무난하게 처리할 수 있도록 구현되어있습니다.
```

**Firebase Cloud Messaging (FCM)**
```
클라우드에서 기기로 푸시하는 메시징 서비스 중 전 세계적으로 가장 인기 있는 Google 클라우드 메시징이 Firebase와 통합 중이며 그 이름이 Firebase 클라우드 메시징(FCM)으로 변경됩니다.
사용제한 없이 무료로 이용할 수 있는 FCM은 iOS, Android 및 웹 플랫폼을 지원하며, 높은 신뢰성을 갖고, 배터리를 최소한으로 사용하도록 최적화되었습니다.
FCM은 확장성을 염두에 두고 만들어졌으며, 벌써 매일 1,700억 개의 메시지를 20억 개의 기기로 보내고 있습니다.
```

**Auth**
```
Firebase는 인증을 쉽게 할 수 있도록 도와줍니다. 오직 클라이언트 사이드의 코드로 유저 인증 또는 로그인 서버를 통합합니다. 아래와 같은 방식으로 사용자 인증에 대한 기능이 있습니다.
```



## 실습하기
1. 프로젝트 생성
2. 코코아팟 설치
```
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Firebase Sample' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Firebase Sample
pod 'Firebase/Core'
pod 'Firebase/Database'

end
```
3. 콘솔로 이동 후 프로젝트 생성
4. Database - Realtime Database 생성하기
5. 규칙 으로 이동 -> `auth != null` 을 `true`로 수정하면 누구나 읽고 쓸수 있게 된다.
   수정하지 않으면 인증된 권한 소유자 만이 읽고 쓸수 있다.
6. 게시 클릭
7. 프로젝트 설정
8. iOS 앱에 Firebase 추가
