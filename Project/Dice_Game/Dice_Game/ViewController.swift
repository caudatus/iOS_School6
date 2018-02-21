//
//  ViewController.swift
//  Dice_Game
//
//  Created by Seo JaeHyeong on 2018. 2. 21..
//  Copyright © 2018년 Seo Jaehyeong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //랜덤으로 생성된 수를 저장할 변수
    var randomDiceIndex_1: Int = 0
    var randomDiceIndex_2: Int = 0
    
    //주사위 이미지 파일명 배열 저장
    let diceArray: [String] = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    
    //주사위 이미지를 표시할 이미지 뷰
    @IBOutlet weak var diceImgView_1: UIImageView!
    @IBOutlet weak var diceImgView_2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDiceImg()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func rollBtnPressed(_ sender: UIButton) {
        updateDiceImg()
    }
    
    
    //랜덤으로 생성된 수를 이용하여 주사위 이미지 뷰의 이미지를 변경
    func updateDiceImg() {
        randomDiceIndex_1 = Int(arc4random_uniform(6))
        randomDiceIndex_2 = Int(arc4random_uniform(6))
        
        diceImgView_1.image = UIImage(named: diceArray[randomDiceIndex_1])
        diceImgView_2.image = UIImage(named: diceArray[randomDiceIndex_2])
    }
    
    
    //Shake Gesture가 발생하였을때 주사위 이미지 변경
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateDiceImg()
    }
}

