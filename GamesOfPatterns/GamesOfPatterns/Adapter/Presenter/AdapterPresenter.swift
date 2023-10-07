//
//  AdapterPresenter.swift
//  GamesOfPatterns
//
//  Created by Sergey on 07.10.2023.
//

import UIKit

final class AdapterPresenter {
    
    weak var viewController: AdapterViewController?
    
    var model = QuestionsModel() // TODO: replace by adapter
    
    var question: Question!
    var score = 0
    
    private var questionNumber = 0 {
        didSet {
            if questionNumber == model.getQuestions().count { // TODO: replace by adapter
                questionNumber = 0
            }
        }
    }
    
    init(viewController: AdapterViewController? = nil) {
        self.viewController = viewController
        question = model.getQuestion(index: 0) // TODO: replace by adapter
    }
    
    func setQuestion() {
        question = model.getQuestion(index: questionNumber) // TODO: replace by adapter
        viewController?.setQuestionLabelText(question.text)
        questionNumber += 1
    }
    
    func setScore() {
        viewController?.numberLabel.text = "\(score)"
    }
    
    func handleAnswer(_ sender: UIButton) {
        if sender.tag == 0 && question.answer == "NO" {
            score += 1
            showAnswerAlert(text: "RIGHT!")
        } else if sender.tag == 1 && question.answer == "YES" {
            score += 1
            showAnswerAlert(text: "RIGHT!")
        } else {
            score -= 1
            showAnswerAlert(text: "WRONG!")
        }
    }
    
    private func showAnswerAlert(text: String) {
        let alert = UIAlertController(title: text, message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { [weak self] action in
            self?.setQuestion()
            self?.setScore()
        }
        alert.addAction(action)
        viewController?.present(alert, animated: true)
    }
}
