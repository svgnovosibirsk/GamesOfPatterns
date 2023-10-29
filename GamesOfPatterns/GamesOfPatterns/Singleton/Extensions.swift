//
//  Extensions.swift
//  GamesOfPatterns
//
//  Created by Sergey on 29.09.2023.
//

import UIKit

extension UITextView {
    func addDoneButton(title: String, target: Any, selector: Selector) {
        self.inputAccessoryView = creareToolbarWithButton(title: title, target: target, selector: selector)
    }
}

extension UITextField {
    func addDoneButton(title: String, target: Any, selector: Selector) {
        self.inputAccessoryView = creareToolbarWithButton(title: title, target: target, selector: selector)
    }
}

private func creareToolbarWithButton(title: String, target: Any, selector: Selector) -> UIToolbar {
    let toolBar = UIToolbar(frame: CGRect(x: 0.0,
                                          y: 0.0,
                                          width: UIScreen.main.bounds.size.width,
                                          height: 44.0))
    toolBar.barStyle = .black
    let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let barButton = UIBarButtonItem(title: title, style: .plain, target: target, action: selector)
    toolBar.setItems([flexible, barButton], animated: false)
    return toolBar
}
