//
//  BitcoinDataModel.swift
//  Bitcoin_Now
//
//  Created by Seo JaeHyeong on 16/03/2018.
//  Copyright © 2018 Seo Jaehyeong. All rights reserved.
//

import Foundation

//respond 형태에 맞추어 decode될 데이터 모델
struct BTCDataModel: Codable{
   // 팔때
   var ask: Double
   // 살때
   var bid: Double
   // 마지막 가격
   var last: Double
   // 24시간 최고가
   var high: Double
   // 24시간 최저가
   var low: Double
   // 시초가
   var open: Open
   // 평균가
   var averages: Averages
   // 거래량
   var volume: Double
   // 등락률
   var changes: Change
   var timestamp: Int
   var display_timestamp: String
}


struct Open: Codable{
   var hour: Double
   var day: Double
   var week: Double
   var month: Double
   var month_3: Double
   var month_6: Double
   var year: Double
}


struct Averages: Codable{
   var day: Double
   var week: Double
   var month: Double
}


struct Percent: Codable {
   var hour: Double
   var day: Double
   var week: Double
   var month: Double
   var month_3: Double
   var month_6: Double
   var year: Double
}


struct Price: Codable {
   var hour: Double
   var day: Double
   var week: Double
   var month: Double
   var month_3: Double
   var month_6: Double
   var year: Double
}


struct Change: Codable {
   var percent: Percent
   var price: Price
}


