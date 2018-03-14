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
   
   @IBOutlet weak var forecastView: UICollectionView!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      forecastView.delegate = self
      forecastView.dataSource = self
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
      return 40
   }
   
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      print("cellForItemAt")
      let cell = forecastView.dequeueReusableCell(withReuseIdentifier: "forecastCell", for: indexPath) as! FeatureCollectionViewCell
      
      return cell
   }
   
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      print("sizeForItemAt")
      return CGSize(width: 200.0, height: 200.0)
   }
   
   
}

