//
//  ViewController.swift
//  Quiz_Together
//
//  Created by Seo JaeHyeong on 2018. 2. 24..
//  Copyright © 2018년 Seo Jaehyeong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLb: UILabel!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var progressLb: UILabel!
    @IBOutlet weak var scoreLb: UILabel!
    
    lazy var allOfQuestions = QuestionBank()
    var selectedAnswer: Bool = false
    var questionNumber: Int = 0
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == 10 {
            selectedAnswer = true
        } else if sender.tag == 20 {
            selectedAnswer = false
        }
        isCorrectAnswer()
        questionNumber += 1
        nextQuestion()
    }
    
    
    func updateUI() {
        scoreLb.text = "Score : \(score)"
        progressLb.text = "\(questionNumber + 1) / 15"
        
        progressBar.frame.size.width = (self.view.frame.size.width / 15) * CGFloat(questionNumber + 1)
    }
    
    
    func isCorrectAnswer() {
        let correctAnswer = allOfQuestions.questionList[questionNumber].answer
        if correctAnswer == selectedAnswer {
            ProgressHUD.showSuccess("정답 !!")
            score += 1
        } else {
            ProgressHUD.showError("틀렸습니다 !!")
        }
    }
    
    
    func nextQuestion() {
        if questionNumber < allOfQuestions.questionList.count {
            questionLb.text = allOfQuestions.questionList[questionNumber].questionText
            updateUI()
        } else {
            let alert = UIAlertController(title: "수고하셨습니다.", message: "다시 한번 진행하시겠습니까?", preferredStyle: .alert)
            let action = UIAlertAction(title: "다시하기", style: .default, handler: { (UIAlertAction) in
                self.startAgain()
            })
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func startAgain() {
        score = 0
        questionNumber = 0
        nextQuestion()
    }
    
    
    
}

