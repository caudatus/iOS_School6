//
//  ViewController.swift
//  CalculateFigure
//
//  Created by 서재형 on 2018. 1. 15..
//  Copyright © 2018년 Super Daddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainDisplay: UILabel!
    @IBOutlet weak var wide: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var length: UITextField!
    
    @IBOutlet weak var lengOfTitle: UILabel!
    @IBOutlet weak var heightOfTitle: UILabel!
    @IBOutlet weak var wideOfTitle: UILabel!
    
    var lengthOfTemp: Double = 1.0
    var wideOfTemp: Double = 1.0
    var heightOfTemp: Double = 1.0
    
    var resultOfCal: (Double, Double, Double) = (0,0,0)
    
    var calculator = CalculateEverything()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    //MARK: - action method
    @IBAction func calSquare(_ sender: Any) {
        if length.text!.isEmpty {
            mainDisplay.text = String("길이를 입력하세요 ~")
        }else{
            setParameter(length: length.text!, wide: wide.text!, height: height.text!)
            resultOfCal = calculator.calculateFigure(length: lengthOfTemp, wide: wideOfTemp, height: heightOfTemp, kindOfCal: "square")
            
            mainDisplay.text = String("정사각형의 넓이는 \(resultOfCal.0),  둘레는 \(resultOfCal.1) 입니다")
        }
        
    }
    
    @IBAction func calRectangle(_ sender: Any) {
        
        setParameter(length: length.text!, wide: wide.text!, height: height.text!)
        resultOfCal = calculator.calculateFigure(length: lengthOfTemp, wide: wideOfTemp, height: heightOfTemp, kindOfCal: "rectangle")
        
        mainDisplay.text = String("직사각형의 넓이는 \(resultOfCal.0),  둘레는 \(resultOfCal.1) 입니다")
    }
    
    @IBAction func calCircle(_ sender: Any) {
        setParameter(length: length.text!, wide: wide.text!, height: height.text!)
        resultOfCal = calculator.calculateFigure(length: lengthOfTemp, wide: wideOfTemp, height: heightOfTemp, kindOfCal: "circle")
        
        mainDisplay.text = String("원의 넓이는 \(resultOfCal.0),  둘레는 \(resultOfCal.1) 입니다")
    }
    
    @IBAction func calTriangle(_ sender: Any) {
        setParameter(length: length.text!, wide: wide.text!, height: height.text!)
        resultOfCal = calculator.calculateFigure(length: lengthOfTemp, wide: wideOfTemp, height: heightOfTemp, kindOfCal: "triangle")
        
        mainDisplay.text = String("삼각형의 넓이는 \(resultOfCal.0) 입니다")
    }
    
    @IBAction func calTrapezoid(_ sender: Any) {
        setParameter(length: length.text!, wide: wide.text!, height: height.text!)
        resultOfCal = calculator.calculateFigure(length: lengthOfTemp, wide: wideOfTemp, height: heightOfTemp, kindOfCal: "trapezoid")
        
        mainDisplay.text = String("사다리꼴의 넓이는 \(resultOfCal.0) 입니다")
    }
    
    @IBAction func calCube(_ sender: Any) {
        setParameter(length: length.text!, wide: wide.text!, height: height.text!)
        resultOfCal = calculator.calculateFigure(length: lengthOfTemp, wide: wideOfTemp, height: heightOfTemp, kindOfCal: "cube")
        
        mainDisplay.text = String("정육면체의 부피는 \(resultOfCal.2) 입니다")
    }
    
    @IBAction func calRectangularSolid(_ sender: Any) {
        setParameter(length: length.text!, wide: wide.text!, height: height.text!)
        resultOfCal = calculator.calculateFigure(length: lengthOfTemp, wide: wideOfTemp, height: heightOfTemp, kindOfCal: "recSolid")
        
        mainDisplay.text = String("직육면체의 부피는 \(resultOfCal.2) 입니다")
    }
    
    @IBAction func calCircularCylinder(_ sender: Any) {
        setParameter(length: length.text!, wide: wide.text!, height: height.text!)
        resultOfCal = calculator.calculateFigure(length: lengthOfTemp, wide: wideOfTemp, height: heightOfTemp, kindOfCal: "ciCylinder")
        
        mainDisplay.text = String("원통의 부피는 \(resultOfCal.2) 입니다")
    }
    
    @IBAction func calSphere(_ sender: Any) {
        setParameter(length: length.text!, wide: wide.text!, height: height.text!)
        resultOfCal = calculator.calculateFigure(length: lengthOfTemp, wide: wideOfTemp, height: heightOfTemp, kindOfCal: "sphere")
        
        mainDisplay.text = String("구의 부피는 \(resultOfCal.2) 입니다")
    }
    
    @IBAction func calCone(_ sender: Any) {
        setParameter(length: length.text!, wide: wide.text!, height: height.text!)
        resultOfCal = calculator.calculateFigure(length: lengthOfTemp, wide: wideOfTemp, height: heightOfTemp, kindOfCal: "cone")
        
        mainDisplay.text = String("원뿔 의 부피는 \(resultOfCal.2) 입니다")
    }
    
    func setParameter(length: String, wide: String, height: String) {
        if length.isEmpty { lengthOfTemp = 1.0 }else{lengthOfTemp = Double(length)!}
        if wide.isEmpty { wideOfTemp = 1.0 }else{wideOfTemp = Double(length)!}
        if height.isEmpty { heightOfTemp = 1.0 }else{heightOfTemp = Double(length)!}
    }
    

}

