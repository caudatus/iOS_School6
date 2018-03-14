//
//  PrepareToWeatherData.swift
//  Weather_Now
//
//  Created by Seo JaeHyeong on 13/03/2018.
//  Copyright © 2018 Seo Jaehyeong. All rights reserved.
//

import Foundation
import CoreLocation
import Alamofire
import  SwiftyJSON

final class WeatherDataAdapter: NSObject{
   
   static var shared: WeatherDataAdapter = WeatherDataAdapter()
   private let locationManager = CLLocationManager()
   //openweather.com api key
   let API_KEY = "1efa0713e3aacf69eca77fc307401274"
   //openweather.com 5days forecast api url
   let FORECAST_WEATHER_URL = "http://api.openweathermap.org/data/2.5/forecast"
   let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
   
   var dataJSON: JSON = ""
   var dataList: [WeatherDataModel] = []
   
   var longitude: String = ""
   var latitude: String = ""
   
   override private init() {
      super.init()

      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
      locationManager.requestWhenInUseAuthorization()
      locationManager.startUpdatingLocation()
      print("Data Adapter init")
   }
   
   
   func getData(url: String, parameters: [String: String]){
      Alamofire.request(url, method: .get, parameters: parameters).responseJSON  {
         response in
         if response.result.isSuccess {
            print("Data Adapter get data Success")
            let result: JSON = JSON(response.result.value!)
            self.setList(result)
            // 클로저 안에서의 함수호출시 self 키워드를 사용하여야 한다.
         } else {
            print("error : \(response.result.error!)")
            //UI 화면에서 잘못된 메세지 표시"연결 불안정"
         }
      }
   }
   
   
   func setList(_ json: JSON) {
      var jsonList: [WeatherDataModel] = []
      for data in json["list"] {
         var wdm = WeatherDataModel()
         wdm.weatherCondition = data.1["weather"][0]["id"].intValue
         wdm.time = data.1["dt_txt"].stringValue
         print("date = ",wdm.time)
         jsonList.append(wdm)
      }
      dataList = jsonList
      print("Data Adapter set List data count = ",dataList.count)
   }
   
}




// MARK: - CLLocationManagerDelegate
extension WeatherDataAdapter: CLLocationManagerDelegate  {

   /// 위치정보를 받은 후에 호출 되는 메소드
   ///
   /// - Parameters:
   ///   - manager:
   ///   - locations:
   func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      print("Data Adapter didUpdateLocations")
      let location = locations[locations.count - 1]
      if location.horizontalAccuracy > 0 {
         locationManager.stopUpdatingLocation()

         longitude = String(location.coordinate.longitude)
         latitude = String(location.coordinate.latitude)
         
         let parameterForWeather: [String: String] = ["lat" : latitude, "lon" : longitude, "appid" : API_KEY]
         getData(url: FORECAST_WEATHER_URL, parameters: parameterForWeather)
         
      }
   }

   


   func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
      print(error)
   }

}


