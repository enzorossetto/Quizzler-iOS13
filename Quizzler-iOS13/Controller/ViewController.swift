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
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUi()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        sender.backgroundColor = userGotItRight ? UIColor.green : UIColor.red
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in self.updateUi() }
    }
    
    func updateUi() {
        let questionAnswers = quizBrain.getQuestionAnswers()
        
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        firstAnswerButton.backgroundColor = UIColor.clear
        firstAnswerButton.setTitle(questionAnswers[0], for: .normal)
        secondAnswerButton.backgroundColor = UIColor.clear
        secondAnswerButton.setTitle(questionAnswers[1], for: .normal)
        thirdAnswerButton.backgroundColor = UIColor.clear
        thirdAnswerButton.setTitle(questionAnswers[2], for: .normal)
    }
    
}

