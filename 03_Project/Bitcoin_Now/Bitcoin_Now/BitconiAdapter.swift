//
//  BitconiAdapter.swift
//  Bitcoin_Now
//
//  Created by Seo JaeHyeong on 16/03/2018.
//  Copyright © 2018 Seo Jaehyeong. All rights reserved.
//

import Foundation
import Alamofire

final class BitcoinAdapter: Codable {
   
   // singleton
   static var shared: BitcoinAdapter = BitcoinAdapter()
   // parameter를 제외한 기본 api URL
   let BASE: String = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
   // develope 버전으로 더 많은 정보를 사용하기 위해서는 key가 필요
   let API_KEY: String = ""
   // BASE URL에 원하는 통화의 parameter를 붙여 api URL을 최종 완성한 후 호출하여야 한다.
   var API_URL: String = ""
   
   let currencyArray = ["KRW", "AUD", "BRL", "CAD", "CNY", "EUR",
                        "GBP", "HKD", "IDR", "ILS", "INR", "JPY",
                        "MXN", "NOK", "NZD", "PLN", "RON", "RUB",
                        "SEK", "SGD", "USD", "ZAR"]
   
   let countryArray = ["(대한민국)", "(오스트레일리아)", "(브라질)", "(캐나다)", "(중국)", "(유럽연합)",
                        "(영국)", "(홍콩)", "(인도네시아)", "(이스라엘)", "(인도)", "(일본)",
                        "(멕시코)", "(노르웨이)", "(뉴질랜드)", "(폴란드)", "(루마니아)", "(러시아)",
                        "(스웨덴)", "(싱가폴)", "(미국)", "(남아공)"]
   
   let currencySymbolArray = ["₩", "$", "R$", "$", "¥", "€",
                              "£", "$", "Rp", "₪", "₹", "¥",
                              "$", "kr", "$", "zł", "lei", "₽",
                              "kr", "$", "$", "R"]
   
   private init() {
      API_URL = BASE + "KRW"
      print("BitcoinAdapter init Sucess")
   }
   
   
//   func getData(url: String) {
//      Alamofire.request(API_URL, method: .get).responseJSON { response in
//         if response.result.isSuccess {
//            print("get data Success")
//            self.dataModel = try! JSONDecoder().decode(BTCDataModel.self, from: response.result.value)
//         } else {
//            print(response.result.error ?? "get api data Failure !!")
//         }
//      }
//   }
   
   func getData(from: String) -> BTCDataModel?{
      let url = URL(string: API_URL)
      let decoder: JSONDecoder = JSONDecoder()
      
      do {
         let data = try Data(contentsOf: url!, options: [])
         let dataModel: BTCDataModel = try decoder.decode(BTCDataModel.self, from: data)
         print("get data Success")
         
         return dataModel
      } catch {
         print("get data Failure : \n",error)
         return nil
      }
   }
   
   
}
