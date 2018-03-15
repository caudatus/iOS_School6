//
//  ForecastViewController.swift
//  Weather_Now
//
//  Created by Seo JaeHyeong on 14/03/2018.
//  Copyright © 2018 Seo Jaehyeong. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {

   let WEATHER = WeatherDataAdapter.shared
   var cityName: String = "KOREA"
   
   @IBOutlet weak var forecastView: UICollectionView!
   @IBOutlet weak var nameLb: UILabel!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      forecastView.delegate = self
      forecastView.dataSource = self
      forecastView.backgroundColor = UIColor.clear
      nameLb.text = cityName
    }
   
   
   @IBAction func switchDisplay(_ sender: UIButton) {
      self.dismiss(animated: true, completion: nil)
   }
   
}



extension ForecastViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
   
   func numberOfSections(in collectionView: UICollectionView) -> Int {
      print("numberOfSections")
      return 1
   }
   
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      print("numberOfItemsInSection")
      return WEATHER.dataList.count
   }
   
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      print("cellForItemAt")
      let cell = forecastView.dequeueReusableCell(withReuseIdentifier: "forecastCell", for: indexPath) as! FeatureCollectionViewCell
      cell.backgroundColor = UIColor.clear
      cell.dateLb.text = WEATHER.dataList[indexPath.item].time
      cell.tempLb.text = "\(WEATHER.dataList[indexPath.item].temperature) ℃"
      cell.weatherImg.image = UIImage(named: WEATHER.dataList[indexPath.item].weatherIconName)
      
      return cell
   }
   
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      print("sizeForItemAt")
      return CGSize(width: 250.0, height: 250.0)
   }
   
   
}

