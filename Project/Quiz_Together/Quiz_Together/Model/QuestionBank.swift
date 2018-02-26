//
//  QuestionBank.swift
//  Quiz_Together
//
//  Created by Seo JaeHyeong on 2018. 2. 26..
//  Copyright © 2018년 Seo Jaehyeong. All rights reserved.
//

import Foundation

class QuestionBank {
    
    var questionList: [Question] = []
    
    init() {
        questionList.append(Question(question: "달팽이는 이빨이 있다.", correctAnswer: true))
        questionList.append(Question(question: "바나나는 씨가 없다.", correctAnswer: true))
        questionList.append(Question(question: "뱀은 뒤로 갈 수 있다.", correctAnswer: false))
        questionList.append(Question(question: "낙지의 심장은 3개다.", correctAnswer: true))
        questionList.append(Question(question: "개구리는 겨울잠을 자는 동안 숨을 쉬지 않는다.", correctAnswer: true))
        questionList.append(Question(question: "개미도 높은곳에서 떨어지면 죽는다.", correctAnswer: false))
        questionList.append(Question(question: "토끼는 걸어갈 수 있다.", correctAnswer: false))
        questionList.append(Question(question: "물고기는 색을 구분할 수 있다.", correctAnswer: true))
        questionList.append(Question(question: "눈을 뜨고 재채기를 할 수 있다.", correctAnswer: false))
        questionList.append(Question(question: "물고기는 기침을 한다 .", correctAnswer: true))
        questionList.append(Question(question: "하마는 말의 일종이다.", correctAnswer: false))
        questionList.append(Question(question: "제1회 아테네 올림픽은 1896년에 개최되었다.", correctAnswer: true))
        questionList.append(Question(question: "오이는 채소다.", correctAnswer: false))
        questionList.append(Question(question: "벼룩은 날개가 있다.", correctAnswer: false))
        questionList.append(Question(question: "물고기는 귀가 없다.", correctAnswer: false))
    }
}
