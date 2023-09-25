//
//  PrototypeViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 25.09.2023.
//

import UIKit

final class PrototypeViewController: UIViewController {
    
    var backgroundView = UIImageView(frame: .zero)
    var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = PatternsNames.Prototype.rawValue
        
        setupScreen()
    }
    
    private func setupScreen() {
        setupBackgroundView()
        setupStackView()
    }
    
    // MARK: Background
    private func setupBackgroundView() {
        backgroundView.image = ImagesProvider.mxBackground
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
        stackView.backgroundColor = .systemCyan // test
        
        setupStackViewConstraints()
    }
    
    private func setupStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
}
