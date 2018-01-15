//
//  BasicUnitOperator.swift
//  CalculateFigure
//
//  Created by 서재형 on 2018. 1. 15..
//  Copyright © 2018년 Super Daddy. All rights reserved.
//

import Foundation

class BasicUnitOperator {
    
    // 1-a. 이름(문자열)을 받아서 출력하는 함수
    func printName(name: String) {
        print("My name is \(name).")
    }
    
    // 1-b. 나이(정수)를 받아서 출력하는 함수
    func printAge(age: Int) {
        print("\(age) years old.")
    }
    
    // 1-c. 이름과 주소를 입력받아 자기소개글을 프린트 하는 함수
    func printMyInfo(name myName:String, address myAddress: String) {
        print("Hello, I live in \(myAddress) and my name is \(myName). nice to meet you")
    }
    
    // 정수를 하나 입력받아서 2로 나눈 값을 반환해주는 함수
    func divideNumber(firstNum: Int, secondNum: Int) -> Double {
        return Double(firstNum + secondNum) / 2.0
    }
    
    // 정수를 하나 입력받아서 제곱을 반환해 주는 함수
    func squareNumber(number: Int) -> Int {
        if checkOverIntegerMax(number * number) {
            return -1
        }
        return number * number
    }
    
    // <응용- 다중입력, 반환>
    // 2-a. 두개의 정수를 입력받아 두 수의 합을 반환해주는 함수
    func addNumber(firstNum: Int, secondNum: Int) -> Int {
        if checkOverIntegerMax(firstNum + secondNum) {
            return -1
        }
        return firstNum + secondNum
    }
    
    // 2-b. 두개의 정수를 입력받아 두 수의 차를 반환해주는 함수
    func minusNumber(firstNum: Int, secondNum: Int) -> Int {
        if firstNum > secondNum {
            return firstNum - secondNum
        }else{
            return secondNum - firstNum
        }
        
    }
    
    // 2-c. 두개의 정수를 입력받아 두 수의 곱을 반환해주는 함수
    func multiNumber(firstNum: Int, secondNum: Int) -> Int {
        if checkOverIntegerMax(firstNum + secondNum) {
            return -1
        }
        return firstNum * secondNum
    }
    
    // 2-d. 두개의 정수를 입력받아 두 수의 나눗셈을 반환해주는 함수
    func divideNumber(firstNum: Int, secondNum: Int) -> Int {
        return firstNum / secondNum
    }
    
    // 부모님과 내 나이를 입력 후 그 나이차를 프린트하는 함수
    //(ex: 어머니의 나이는 40세이고 내 나이는 20살 이므로 우리의 나이차이는 20살 입니다.)
    func calAgeDiff(parentAge: Int, childAge: Int) {
        print("부모님의 나이는 \(parentAge)이고 내 나이는 \(childAge) 이므로 우리의 나이차이는 \(parentAge - childAge) 입니다.")
    }
    
    // 시험점수 여러개를 입력받아서(4개 이상) 평균을 반환해 주는 함수
    func calAverage(manyScore: [Int]) -> Double {
        var averageScore: Int = 0
        var index: Int = 0
        
        for score in manyScore {
            averageScore += score
            index += 1
        }
        
        return Double(averageScore)/Double(index)
    }
    
    // <캐스팅>
    // 정수를 하나 입력받아서 실수로 변환 후 반환해주는 함수
    func convertIntegerToDouble(number: Int) -> Double {
        return Double(number)
    }
    
    // 정수를 두개를 입력받아서 두 수를 합친수를 출력하는 함수
    // (ex: 3,4 입력시 >>> 34 /// 1, 0 입력시 >>> 10)
    func addIntegerToString(firstNum: Int, secondNum: Int) {
        print(String(firstNum*10+secondNum))
    }
    
    // 실수를 하나 입력받아서 소수점 첫번째 자리에서 반올림 후 정수를 반환해 주는 함수
    func roundOffToInteger(number: Double) -> Int {
        return Int(number.rounded(.toNearestOrAwayFromZero))
    }
    
    func checkOverIntegerMax(_ checkNum: Int) -> Bool {
        if checkNum > Int.max {
            return true
        }
        return false
    }
    
}
