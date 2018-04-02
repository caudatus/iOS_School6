# Open Chat Now
![Swift](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat-square) ![Xcode](https://img.shields.io/badge/Xcode-9-blue.svg?longCache=true&style=flat-square) [![License](https://img.shields.io/badge/License-MIT-green.svg?longCache=true&style=flat-square)](https://github.com/caudatus/SeoJaeHyeong_iOS_School6/blob/master/LICENSE)

&#10077; **오픈 채팅** &#10078;
Firebase Realtime Database를 이용한 오픈채팅방 구현

<br/>

<img src="/Img/Project/open_chat/open_chat_now.gif" title="Chat_NOw">

<br/>

## Main, Sign In, Sign Up
<img src="/Img/Project/open_chat/main.png" width="200px"><img src="/Img/Project/open_chat/sign_in.png" width="200px"><img src="/Img/Project/open_chat/sign_up.png" width="200px">

<br/>

## error

<img src="/Img/Project/open_chat/pw_bad.png" width="200px"><img src="/Img/Project/open_chat/email_bad.png" width="200px"><img src="/Img/Project/open_chat/duplicate_email.png" width="200px">

<br/>

## Chat

<img src="/Img/Project/open_chat/chat.png" width="300px">

<br/>

## Firebase
- 이메일 가입, 로그인 구현

```Swift
//로그인
Auth.auth().signIn(withEmail: ***, password: ***) {
}

//회원가입
Auth.auth().createUser(withEmail: ***, password: ***) {
}

//채팅메세지 추가 옵저버 통한 실시간 반영
 DB.observe(.childAdded) {
 }

 //로그아웃
 Auth.auth().signOut()
```

<br/>

## Podfile
```
platform :ios, '9.0'

target 'Open_Chat_Now' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Open_Chat_Now

pod 'Firebase'
pod 'Firebase/Auth'
pod 'Firebase/Database'
pod 'SVProgressHUD'
pod 'ChameleonFramework'

end

post_install do |installer|
installer.pods_project.targets.each do |target|
target.build_configurations.each do |config|
config.build_settings['CLANG_WARN_DOCUMENTATION_COMMENTS'] = 'NO'
end
end
end
```
