//
//  ViewController.swift
//  Bitcoin_Now
//
//  Created by Seo JaeHyeong on 16/03/2018.
//  Copyright © 2018 Seo Jaehyeong. All rights reserved.
//

import UIKit

class BitcoinViewController: UIViewController {

   // BitcoinAdapter 싱글톤 인스턴스 생성
   var BTC_ROBOT = BitcoinAdapter.shared

   // 비트코인 화폐 별 현재 가격 표시 Label
   @IBOutlet weak var priceLb: UILabel!
   // 비트코인 화폐 별 각종 정보 표시 Label
   @IBOutlet weak var infoLb: UILabel!
   //화폐 선택 UIPickerView
   @IBOutlet weak var currencyPicker: UIPickerView!
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      initSetting()
      
      currencyPicker.delegate = self
      currencyPicker.dataSource = self
   }
   
   
   func initSetting() {
      if let initData = BTC_ROBOT.getData(from: BTC_ROBOT.API_URL) {
         updateUI(data: initData)
      }
   }
   
   
   func updateUI(data: BTCDataModel, symbol: String = "₩") {
      priceLb.text = symbol + "\(Int(data.last).withComma)"
      infoLb.text = """
      daily change = \(data.changes.percent.day)% \n
      High = \(symbol)\(Int(data.high).withComma)     Low = \(symbol)\(Int(data.low).withComma) \n
      Bid(살때) = \(symbol)\(Int(data.bid).withComma) \n
      Ask(팔때) = \(symbol)\(Int(data.ask).withComma) \n
      24hr volume = \(Int(data.volume).withComma) BTC
      """
   }

}



extension Int {
   var withComma: String {
      let decimalFormatter = NumberFormatter()
      decimalFormatter.numberStyle = NumberFormatter.Style.decimal
      decimalFormatter.groupingSeparator = ","
      decimalFormatter.groupingSize = 3
      
      return decimalFormatter.string(from: self as NSNumber)!
   }
}



extension BitcoinViewController: UIPickerViewDelegate, UIPickerViewDataSource {

   //components 의 수
   func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 1
   }

   //components의 row의 수
   func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return BTC_ROBOT.currencyArray.count
   }

   //row의 타이틀 설정
   func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      return BTC_ROBOT.currencyArray[row] + BTC_ROBOT.countryArray[row]
   }

   // 선택된 row의 국가 통화를 api url로 세팅 후 호출
   func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      BTC_ROBOT.API_URL = BTC_ROBOT.BASE + BTC_ROBOT.currencyArray[row]
      if let dm = BTC_ROBOT.getData(from: BTC_ROBOT.API_URL) {
         updateUI(data: dm, symbol: BTC_ROBOT.currencySymbolArray[row])
      } else {
         print("didSelectRow But Data is empty !!")
      }
   }

}

