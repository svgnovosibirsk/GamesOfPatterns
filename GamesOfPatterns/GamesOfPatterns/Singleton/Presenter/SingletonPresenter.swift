//
//  SingletonPresenter.swift
//  GamesOfPatterns
//
//  Created by Sergey on 29.09.2023.
//

import UIKit

final class SingletonPresenter {
    
    // MARK: - Constants
    private enum AlertMessages {
        static let typeMessage = "Type a message"
        static let typePassword = "Type a password"
        static let messageSaved = "Message is saved"
        static let okButton = "OK"
    }
    
    let emptyString = ""
    
    weak var viewController: SingletonViewController?
    
    init(viewController: SingletonViewController? = nil) {
        self.viewController = viewController
    }
    
    func saveButtonPressed() {
        
        if viewController?.textView.text == emptyString {
            showAlert(message: AlertMessages.typeMessage)
        } else if viewController?.passwordTextField.text == emptyString {
            showAlert(message: AlertMessages.typePassword)
        } else {
            guard let text = viewController?.textView.text,
            let password =  viewController?.passwordTextField.text
            else { return }
            
            let message = Message(text: text, password: password)
            
            // MARK: - Singleton
            MessageModel.shared.saveMessage(message)
            
            viewController?.textView.text = emptyString
            viewController?.passwordTextField.text = emptyString
            
            showAlert(message: AlertMessages.messageSaved)
        }
    }
    
    func readButtonPressed() {
        
        if viewController?.passwordTextField.text == emptyString {
            showAlert(message: AlertMessages.typePassword)
        } else {
            viewController?.textView.text = emptyString
            
            guard let password =  viewController?.passwordTextField.text else { return }
            
            // MARK: - Singleton
            let message = MessageModel.shared.readMessage(password: password)
            
            viewController?.textView.text = message?.text
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: message, message: emptyString, preferredStyle: .alert)
        let okAction = UIAlertAction(title: AlertMessages.okButton, style: .default)
        
        alert.addAction(okAction)
        
        viewController?.present(alert, animated: true)
    }
}
