//
//  AdapterViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 02.10.2023.
//

import UIKit

final class AdapterViewController: UIViewController {
    
    let backgroundView = UIImageView(frame: .zero)
    let labelsStack = UIStackView(frame: .zero)
    let buttonsStack = UIStackView(frame: .zero)
    let scoreLabel = UILabel(frame: .zero)
    let numberLabel = UILabel(frame: .zero)
    let questionLabel = UILabel(frame: .zero)
    
    override func viewDidLoad() {
        title = PatternsNames.Adapter.rawValue
        
        setupScreen()
    }
    
    private func setupScreen() {
        setupBackgroundView()
        setupLabelsStack()
        setupMessageLabel()
        setupNumberLabel()
        setupQuestionLabel()
        setupButtonsStack()
    }
    
    // MARK: Background
    private func setupBackgroundView() {
        backgroundView.image = ImagesProvider.btmBackground
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
    
    // MARK: Labels Stack
    private func setupLabelsStack() {
        labelsStack.axis = .horizontal
        labelsStack.alignment = .center
        labelsStack.distribution = .fillProportionally//.equalSpacing
        labelsStack.spacing = 20
        labelsStack.backgroundColor = UIColor(white: 0, alpha: 0.8)
        labelsStack.layer.cornerRadius = 10
        
        labelsStack.layoutMargins = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
        labelsStack.isLayoutMarginsRelativeArrangement = true
        
        setupLabelStackConstraints()
    }
    
    private func setupLabelStackConstraints() {
        labelsStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelsStack)
        
        NSLayoutConstraint.activate([
            labelsStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            labelsStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            labelsStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            labelsStack.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    // MARK: Score Label
    private func setupMessageLabel() {
        scoreLabel.text = "Score: "
        scoreLabel.textColor = .green
        scoreLabel.font = UIFont.boldSystemFont(ofSize: 40)
        labelsStack.addArrangedSubview(scoreLabel)
    }
    
    // MARK: Number Label
    private func setupNumberLabel() {
        numberLabel.text = "0"
        numberLabel.textColor = .green
        numberLabel.font = UIFont.boldSystemFont(ofSize: 40)
        labelsStack.addArrangedSubview(numberLabel)
    }
    
    // MARK: Question Label
    private func setupQuestionLabel() {
        questionLabel.text = "Question"
        questionLabel.textColor = .green
        questionLabel.backgroundColor = UIColor(white: 0, alpha: 0.8)
        questionLabel.font = UIFont.boldSystemFont(ofSize: 30)
        questionLabel.numberOfLines = 0
        
        setupQuestionLabelConstraints()
    }
    
    private func setupQuestionLabelConstraints() {
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(questionLabel)
        
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: labelsStack.bottomAnchor, constant: 50),
            questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: Buttons Stack
    private func setupButtonsStack() {
        buttonsStack.axis = .horizontal
        buttonsStack.alignment = .center
        buttonsStack.distribution = .fillProportionally//.equalSpacing
        buttonsStack.spacing = 20
        buttonsStack.backgroundColor = UIColor(white: 0, alpha: 0.8)
        buttonsStack.layer.cornerRadius = 10
        
        buttonsStack.layoutMargins = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
        buttonsStack.isLayoutMarginsRelativeArrangement = true
        
        setupButtonsStackConstraints()
    }
    
    private func setupButtonsStackConstraints() {
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsStack)
        
        NSLayoutConstraint.activate([
            buttonsStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            buttonsStack.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 50),
            buttonsStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            buttonsStack.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
