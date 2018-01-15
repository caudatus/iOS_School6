//
//  ViewController.swift
//  Calculator
//
//  Created by 서재형 on 2018. 1. 12..
//  Copyright © 2018년 Super Daddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var operationDisplay: UILabel!
    @IBOutlet weak var subDisplay: UILabel!
    
    var operationTemp: String = ""
    var firstInput: Int = 0
    var secondInput: Int = 0
    var resultNumber: Int = 0
    var didOperation: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    //MARK: - Action Method
    
    @IBAction func clickedNuber(_ sender: UIButton) {
        
        let numberStr = sender.titleLabel!.text!
        if didOperation {
            
        }
        if operationTemp.count > 0 {
            if secondInput == 0 {
                display.text = numberStr
                secondInput = Int(numberStr)!
            }else{
                display.text = String(secondInput) + numberStr
                secondInput = Int(display.text!)!
            }
        }else{
            if firstInput == 0{
                display.text = numberStr
                firstInput = Int(numberStr)!
            }else{
                display.text = String(firstInput) + numberStr
                firstInput = Int(display.text!)!
            }
        }
    }
  
    
    @IBAction func clickedOperation(_ sender: UIButton) {
        
        let operStr = sender.titleLabel!.text!
        let displayNumber = display.text!
        
        if displayNumber != "0"{
            operationTemp = operStr
            firstInput = Int(display.text!)!
        }
        
        operationDisplay.text = operStr
    
        changeColor(by: operStr)
        display.text = ""
        subDisplay.text = String(firstInput)
        
    }
    
    
    @IBAction func clickedCancel(_ sender: UIButton) {
        
        display.text = "0"
        operationDisplay.text = ""
        subDisplay.text = ""
        
        firstInput = 0
        secondInput = 0
        
        operationTemp = ""
        
        resetDisplay()
    }
    
    
    @IBAction func clickedResult(_ sender: UIButton) {
            
            let resultNum = calculation(firstNum: firstInput, operation: operationTemp, secondNum: secondInput)
            display.text = String(resultNum)
        
            resetDisplay()
            resetData()
    }
    

    
    //MARK: - Private Method
    
    /// 연산 함수
    /// 두 수를 연산자에 따라 연산하고 결과값을 리턴해준다.
    ///
    /// - firstNum : 첫번째 입력값
    /// - operation : 연산을 위한 연산자
    /// - secondNum : 두번째 디스플레이에 표시된 숫자
    /// - Returns : 연산의 결과 값
    
    
   private func calculation(firstNum: Int, operation: String, secondNum: Int) -> Int {
    
        var resultNum: Int = 0
        
        switch operation {
        case "+" :
            resultNum = firstNum + secondNum
            print("첫번째 숫자 : \(firstNum) \(operation) 두번째 숫자 : \(secondNum) = \(resultNum)")
        case "−" :
            resultNum = firstNum - secondNum
            print("첫번째 숫자 : \(firstNum) \(operation) 두번째 숫자 : \(secondNum) = \(resultNum)")
        case "×" :
            resultNum = firstNum * secondNum
            print("첫번째 숫자 : \(firstNum) \(operation) 두번째 숫자 : \(secondNum) = \(resultNum)")
        case "÷" :
            resultNum = firstNum / secondNum
            print("첫번째 숫자 : \(firstNum) \(operation) 두번째 숫자 : \(secondNum) = \(resultNum)")
        default :
            print("숫자없음 !!")
        }
    
        didOperation = true
        return resultNum
    }
    
    //데이터 리셋
    private func resetData()  {
        firstInput = 0
        secondInput = 0
        operationTemp = ""
        resultNumber = 0
        didOperation = false
    }
    
    //UI리셋
   private func resetDisplay(){
        operationDisplay.text = ""
        subDisplay.text = ""
    
    if !didOperation {
        display.text = ""
    }
        changeLabelBG(color: .white)
    }
    
    private func changeColor(by operation: String){
        var color: UIColor
        switch operation {
        case "+" :
            color = .red
        case "−" :
            color = .yellow
        case "×" :
            color = .green
        case "÷" :
            color = .blue
        default :
            color = .white
        }
        
        changeLabelBG(color: color)
    }
    
    private func changeLabelBG(color: UIColor ){
        display.backgroundColor = color
        subDisplay.backgroundColor = color
        operationDisplay.backgroundColor = color
    }
    
    
    
    
    
    
    
    
}

