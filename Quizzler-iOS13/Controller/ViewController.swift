//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var score: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion(quesNo: quizBrain.questionNo)
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
        let userAnswer = sender.currentTitle!
        
        let isAnswerCoreect = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if isAnswerCoreect{
            sender.backgroundColor = UIColor.green
            print("Correct")
        }else{
            print("Wrong")
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.questionReset()
        
        Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { (Timer) in
            self.updateQuestion(quesNo: self.quizBrain.questionNo)
        }
        
    }

    func updateQuestion(quesNo : Int){
        
        questionLabel.text = quizBrain.getQuestion() 
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgressRatio()
        score.text = "Score: \(quizBrain.score)"
        
    }
    
}

