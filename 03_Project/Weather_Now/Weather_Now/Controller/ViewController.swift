//
//  ViewController.swift
//  Weather_Now
//
//  Created by Seo JaeHyeong on 2018. 3. 6..
//  Copyright © 2018년 Seo Jaehyeong. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import  SwiftyJSON

class ViewController: UIViewController{
   
   @IBOutlet weak var weatherIcon: UIImageView!
   @IBOutlet weak var tempLb: UILabel!
   @IBOutlet weak var locationLb: UILabel!
   
   let WEATHER = WeatherDataAdapter.shared
   let locationManager = CLLocationManager()
   
   override func viewDidLoad() {
      super.viewDidLoad()
   
      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.requestWhenInUseAuthorization()
      locationManager.startUpdatingLocation()
   }
   
   
   func getData(url: String, parameters: [String: String]){
      Alamofire.request(url, method: .get, parameters: parameters).responseJSON  {
         response in
         if response.result.isSuccess {
            print("get data Success")
            let result: JSON = JSON(response.result.value!)
            self.updateWeatherData(json: result)
            // 클로저 안에서의 함수호출시 self 키워드를 사용하여야 한다.
         } else {
            print("error : \(response.result.error!)")
            //UI 화면에서 잘못된 메세지 표시"연결 불안정"
         }
      }
   }
   
   
   func updateWeatherData(json : JSON) {
      var wdm = WeatherDataModel()
      let tempResult = json["main"]["temp"].doubleValue
      
      wdm.temperature = Int(tempResult - 273.15)
      wdm.localName = json["name"].stringValue
      wdm.weatherCondition = json["weather"][0]["id"].intValue
      
      updateUI(data: wdm)
   }
   

   func updateUI(data dm: WeatherDataModel) {
      
      self.weatherIcon.image = UIImage(named: dm.weatherIconName)
      self.tempLb.text = "\(dm.temperature)℃"
      self.locationLb.text = dm.localName
   }
   
   
   @IBAction func forecastBtn(_ sender: UIButton) {
      
   }
   
}


// MARK: - CLLocationManagerDelegate
extension ViewController: CLLocationManagerDelegate  {
   
   func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      print("didUpdateLocations")
      let location = locations[locations.count - 1]
      if location.horizontalAccuracy > 0 {
         locationManager.stopUpdatingLocation()
         
         let longitude = String(location.coordinate.longitude)
         let latitude = String(location.coordinate.latitude)
         
         let parameterForWeather: [String: String] = ["lat" : latitude, "lon" : longitude, "appid" : WEATHER.API_KEY]
         getData(url: WEATHER.CURRENT_WEATHER_URL, parameters: parameterForWeather)
         
      }
   }
   
   func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
      print(error)
   }
   
}









