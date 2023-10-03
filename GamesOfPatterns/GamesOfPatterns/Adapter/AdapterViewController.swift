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
    
    override func viewDidLoad() {
        title = PatternsNames.Adapter.rawValue
        
        setupScreen()
    }
    
    private func setupScreen() {
        setupBackgroundView()
        setupLabelStackView()
        setupMessageLabel()
        setupNumberLabel()
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
    private func setupLabelStackView() {
        labelsStack.axis = .horizontal
        labelsStack.alignment = .center
        labelsStack.distribution = .fillProportionally//.equalSpacing
        labelsStack.spacing = 20
        labelsStack.backgroundColor = UIColor(white: 0, alpha: 0.6)
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
}
