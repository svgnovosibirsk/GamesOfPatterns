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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = PatternsNames.Singleton.rawValue
        
        setupScreen()
    }
    
    private func setupScreen() {
        setupBackgroundView()
        setupStackView()
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
        //stackView.backgroundColor = .white
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
}
