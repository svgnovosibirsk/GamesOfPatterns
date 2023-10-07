//
//  QuestionModelAdapter.swift
//  GamesOfPatterns
//
//  Created by Sergey on 07.10.2023.
//

import Foundation

protocol QuestionModelAdapterProtocol {
    func getQuestions() -> [Question]
    func getQuestion(index: Int) -> Question
}

// MARK: - Adapter
final class QuestionModelAdapter: QuestionModelAdapterProtocol {
    var model = QuestionsModel()
    
    func getQuestions() -> [Question] {
        // MARK: - Adapter
        model.reciveQuestions()
    }
    
    func getQuestion(index: Int) -> Question {
        // MARK: - Adapter
        model.recieveQuestion(index: index)
    }
}
