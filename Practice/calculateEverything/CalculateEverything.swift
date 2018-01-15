//
//  CalculateEverything.swift
//  CalculateFigure
//
//  Created by 서재형 on 2018. 1. 15..
//  Copyright © 2018년 Super Daddy. All rights reserved.
//

import Foundation

class CalculateEverything {
     let pie: Double = 3.14
    
    //도형의 면적 및 둘레, 부피 계산
    public func calculateFigure(length: Double, wide: Double, height: Double, kindOfCal: String) ->  (Double, Double, Double) {
        
        var result: (Double, Double, Double) = (1.0,1.0,1.0)
        
        switch kindOfCal {
        case "square":
            result = square(length_Sq: length, wide_Sq: wide, height_Sq: height)
        case "rectangle":
            result = rectangle(length_Re: length, wide_Re: wide, height_Re: height)
        case "circle":
            result = circle(length_Ci: length, wide_Ci: wide, height_Ci: height)
        case "triangle":
            result = triangle(length_Tr: length, wide_Tr: wide, height_Tr: height)
        case "trapezoid":
            result = trapezoid(length_Tp: length, wide_Tp: wide, height_Tp: height)
        case "cube":
            result = cube(length_Cu: length, wide_Cu: wide, height_Cu: height)
        case "recSolid":
            result = recSolid(length_Rs: length, wide_Rs: wide, height_Rs: height)
        case "ciCylinder":
            result = ciCylinder(length_Cc: length, wide_Cc: wide, height_Cc: height)
        case "sphere":
            result = sphere(length_Sp: length, wide_Sp: wide, height_Sp: height)
        case "cone":
            result = cone(length_Co: length, wide_Co: wide, height_Co: height)
        default:
            print("default result")
        }
        
        return result
    }
    
    //단위환산 : inch -> centimeter
    public func convertInchToCm(_ inch: Double) -> Double {
        return 2.54 * inch
    }
    
    //단위환산 : centimeter -> inch
    public func convertCmToInch(_ centimeter: Double) -> Double {
        return 0.393701 * centimeter
    }
    
    //단위환산 : 제곱미터 -> 평
    public func convertM2ToPy(_ area: Double) -> Double {
        return 0.3025 * area
    }
    
    //단위환산 : 평 -> 제곱미터
    public func convertPyToM2(_ py: Double) -> Double {
        return 3.305785 * py
    }
    
    //단위환산 : 화씨 -> 섭씨
    public func  convertFahrenheitToCelsius(_ fahrenheit: Double) -> Double{
        return -17.22 * fahrenheit
    }
    
    //단위환산 : 섭씨 -> 화씨
    public func convertCelsiusToFahrenheit(_ celsius: Double) -> Double {
        return 33.8 * celsius
    }
    
    //단위환산 : 킬로바이트 -> 메가바이트
    public func convertKilobyteToMegabyte(_ kilobyte: Int) -> Int {
        return kilobyte / 1024
    }
        
    //단위환산 : 메가바이트 -> 기가바이트
    public func convertMegabyteToGigaByte(_ megabyte: Int) -> Int {
        return megabyte /  1024
    }
    
    //단위환산(hhmmss) : 시간 -> 초
    public func convertTimeToSecond(_ time: Int) -> Int {
        
        var inputTime: Int = time
        
        let second: Int = inputTime % 100
        inputTime = inputTime / 100
        
        let minute: Int = inputTime % 100
        inputTime = inputTime / 100
        
        let hour: Int = inputTime % 100
        
        return 3600*hour + 60*minute + second
    }
    
    private func square(length_Sq: Double, wide_Sq: Double, height_Sq: Double) -> (Double, Double, Double) {
        let area: Double = length_Sq * length_Sq
        let perimeter: Double =  4.0 * length_Sq
        let volume: Double = 1.0
        
        return (area, perimeter, volume)
    }
    
    private func rectangle(length_Re: Double, wide_Re: Double, height_Re: Double) -> (Double, Double, Double) {
        let area: Double = length_Re * wide_Re
        let perimeter: Double =  2.0 * length_Re + 2.0 * wide_Re
        let volume: Double = 1.0
        
        return (area, perimeter, volume)
    }
    
    private func circle(length_Ci: Double, wide_Ci: Double, height_Ci: Double) -> (Double, Double, Double) {
        let area: Double = length_Ci * wide_Ci * pie
        let perimeter: Double =  2.0 * length_Ci * pie
        let volume: Double = 1.0
        
        return (area, perimeter, volume)
    }
    
    private func triangle(length_Tr: Double, wide_Tr: Double, height_Tr: Double) -> (Double, Double, Double) {
        let area: Double = 0.5 * length_Tr * height_Tr
        let perimeter: Double =  1.0
        let volume: Double = 1.0
        
        return (area, perimeter, volume)
    }
    
    private func trapezoid(length_Tp: Double, wide_Tp: Double, height_Tp: Double) -> (Double, Double, Double) {
        let area: Double = 0.5 * height_Tp * (length_Tp + wide_Tp)
        let perimeter: Double =  1.0
        let volume: Double = 1.0
        
        return (area, perimeter, volume)
    }
    
    private func cube(length_Cu: Double, wide_Cu: Double, height_Cu: Double) -> (Double, Double, Double) {
        let area: Double = 1.0
        let perimeter: Double =  1.0
        let volume: Double = length_Cu * length_Cu * length_Cu
        
        return (area, perimeter, volume)
    }
    
    private func recSolid(length_Rs: Double, wide_Rs: Double, height_Rs: Double) -> (Double, Double, Double) {
        let area: Double = 1.0
        let perimeter: Double =  1.0
        let volume: Double = length_Rs * wide_Rs * height_Rs
        
        return (area, perimeter, volume)
    }
    
    private func ciCylinder(length_Cc: Double, wide_Cc: Double, height_Cc: Double) -> (Double, Double, Double) {
        let area: Double = 1.0
        let perimeter: Double =  1.0
        let volume: Double = pie * length_Cc * length_Cc * height_Cc
        
        return (area, perimeter, volume)
    }
    
    private func sphere(length_Sp: Double, wide_Sp: Double, height_Sp: Double) -> (Double, Double, Double) {
        let area: Double = 1.0
        let perimeter: Double =  1.0
        let volume: Double = (4.0/3.0) * pie * length_Sp * length_Sp * length_Sp
        
        return (area, perimeter, volume)
    }
    
    private func cone(length_Co: Double, wide_Co: Double, height_Co: Double) -> (Double, Double, Double) {
        let area: Double = 1.0
        let perimeter: Double =  1.0
        let volume: Double = (1.0/3.0) * pie * length_Co * length_Co * height_Co
        
        return (area, perimeter, volume)
    }
}
