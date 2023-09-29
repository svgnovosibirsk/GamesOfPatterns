//
//  SingletonPresenter.swift
//  GamesOfPatterns
//
//  Created by Sergey on 29.09.2023.
//

import Foundation

final class SingletonPresenter {
    weak var viewController: SingletonViewController?
    let messageModel = MessageModel()
    
    init(viewController: SingletonViewController? = nil) {
        self.viewController = viewController
    }
    
    func saveButtonPressed() {
        print(#function) // test
        
        if viewController?.textView.text == "" {
            print("Type message") // TODO: Alert
        } else if viewController?.passwordTextField.text == "" {
            print("Type password") // TODO: Alert
        } else {
            guard let text = viewController?.textView.text,
            let password =  viewController?.passwordTextField.text
            else { return }
            
            let message = Message(text: text, password: password)
            
            messageModel.saveMessage(message)
            
            viewController?.textView.text = ""
            viewController?.passwordTextField.text = ""
            
            print("Message is saved") // TODO: Alert
        }
        
    }
    
    func readButtonPressed() {
        print(#function) // test
        
        if viewController?.passwordTextField.text == "" {
           print("Type password") // TODO: Alert
        } else {
            viewController?.textView.text = ""
            
            guard let password =  viewController?.passwordTextField.text else { return }
            let message = messageModel.readMessage(password: password)
            
            viewController?.textView.text = message?.text
        }
    }
}
