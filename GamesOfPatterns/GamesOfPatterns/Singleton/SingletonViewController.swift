//
//  SingletonViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 28.09.2023.
//

import UIKit

final class SingletonViewController: UIViewController {
    
    let backgroundView = UIImageView(frame: .zero)
    let stackView = UIStackView(frame: .zero)
    let textView = UITextView(frame: .zero)
    // TODO: password text field
    let saveButton = UIButton(frame: .zero)
    let readButton = UIButton(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = PatternsNames.Singleton.rawValue
        
        setupScreen()
    }
    
    private func setupScreen() {
        setupBackgroundView()
        setupStackView()
        setupTextView()
        // TODO: password text field
        setupSaveButton()
        setupReadButton()
    }
    
    // MARK: Background
    private func setupBackgroundView() {
        backgroundView.image = ImagesProvider.jbBackground
        backgroundView.contentMode = .scaleAspectFill
        
        setupBackgroundViewConstraints()
    }
    
    private func setupBackgroundViewConstraints() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: Stackview
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        
        setupStackViewConstraints()
    }
    
    private func setupStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: Text View
    private func setupTextView() {
        textView.backgroundColor = UIColor(white: 1, alpha: 0.2)
        textView.layer.cornerRadius = 10
        textView.textColor = .white
        textView.font = UIFont.systemFont(ofSize: 20)
        
        setupTextViewConstraints()
    }
    
    private func setupTextViewConstraints() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(textView)
        
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 30),
            textView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 50),
            textView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant:  -30),
            textView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    // TODO: password text field
    
    // MARK: Save Button
    private func setupSaveButton() {
        saveButton.setTitle("     Save     ", for: .normal)
        saveButton.backgroundColor = UIColor(white: 1, alpha: 0.2)
        saveButton.layer.cornerRadius = 10
        saveButton.setTitleColor(.systemGray6, for: .normal)
        saveButton.setTitleColor(.systemGray4, for: .highlighted)
        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30.0)
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        
        stackView.addArrangedSubview(saveButton)
    }
    
    @objc private func saveButtonPressed(_ sender: UIButton) {
        //viewModel?.cloneButtonPressed()
        print(#function)
    }
    
    // MARK: Read Button
    private func setupReadButton() {
        readButton.setTitle("     Read     ", for: .normal)
        readButton.backgroundColor = UIColor(white: 1, alpha: 0.2)
        readButton.layer.cornerRadius = 10
        readButton.setTitleColor(.systemGray6, for: .normal)
        readButton.setTitleColor(.systemGray4, for: .highlighted)
        readButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30.0)
        readButton.addTarget(self, action: #selector(readButtonPressed), for: .touchUpInside)
        
        stackView.addArrangedSubview(readButton)
    }
    
    @objc private func readButtonPressed(_ sender: UIButton) {
        //viewModel?.cloneButtonPressed()
        print(#function)
    }
}
