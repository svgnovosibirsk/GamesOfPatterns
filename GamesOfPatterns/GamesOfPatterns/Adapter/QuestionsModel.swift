//
//  QuestionsModel.swift
//  GamesOfPatterns
//
//  Created by Sergey on 05.10.2023.
//

import Foundation

struct Question {
    let text: String
    let answer: String
}

final class QuestionsModel {
    private var questions:[Question] = []
    
    init() {
        setupQuestions()
    }
    
    func getQuestions() -> [Question] {
        return questions
    }
    
    private func setupQuestions() {
        let path = Bundle.main.path(forResource: "QuestionsPlist", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        let questionsArr = dict?.object(forKey: "Questions") as! [[String: String]]
        
        for dict in questionsArr {
            let question = Question(text: dict["question"]!, answer: dict["answer"]!)
            questions.append(question)
        }
        
//        print(questionsArr) // TEST
//        print("-----------")  // TEST
//        print(questions)  // TEST
    }
    
}
