//
//  WeatherDataModel.swift
//  Weather_Now
//
//  Created by Seo JaeHyeong on 2018. 3. 8..
//  Copyright © 2018년 Seo Jaehyeong. All rights reserved.
//

import Foundation

struct WeatherDataModel {
   
   var temperature: Int = 0
   var presure: Int = 0
   var localName: String = ""
   var time: String = ""
   var weatherCondition: Int = 0
   var sunset: Int = 0
   var sunrise: Int = 0
   var nation: String = ""
   
   var weatherIconName: String {
      switch (weatherCondition) {
         
      case 0...300 :
         return "tstorm1"
         
      case 301...500 :
         return "light_rain"
         
      case 501...600 :
         return "shower3"
         
      case 601...700 :
         return "snow4"
         
      case 701...771 :
         return "fog"
         
      case 772...799 :
         return "tstorm3"
         
      case 800 :
         return "sunny"
         
      case 801...804 :
         return "cloudy2"
         
      case 900...903, 905...1000  :
         return "tstorm3"
         
      case 903 :
         return "snow5"
         
      case 904 :
         return "sunny"
         
      default :
         return "dunno"
      }
   }
}
