//
//  Question.swift
//  Quiz_Together
//
//  Created by Seo JaeHyeong on 2018. 2. 24..
//  Copyright © 2018년 Seo Jaehyeong. All rights reserved.
//

import Foundation

class Question {
    
    let questionText: String
    let answer: Bool
    
    init(question: String, correctAnswer: Bool) {
        questionText = question
        answer = correctAnswer
    }
}
