# ToDo Now
![Swift](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat-square) ![Xcode](https://img.shields.io/badge/Xcode-9-blue.svg?longCache=true&style=flat-square) [![License](https://img.shields.io/badge/License-MIT-green.svg?longCache=true&style=flat-square)](https://github.com/caudatus/SeoJaeHyeong_iOS_School6/blob/master/LICENSE)

To Do 리스트 작성
- CoreData를 이용한 할일 목록 작성

<br/>

<img src="/Img/Project/to_do_now.gif" title="ToDo_Now" width="300px">

<br/>

## CoreData

<img src="/Img/Project/to_do_now_coredata.png" title="ToDo_Now_Data">

```Swift
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

//Save, Update
do {
   try context.save()
} catch {
   print("Error saving context  : ", error)
}

//Load
do {
   items = try context.fetch(request)
} catch {
   print("Error fetching data : ", error)
}
```
