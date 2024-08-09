//
//  StrategyViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 07.08.2024.
//

import UIKit

class StrategyViewController: UIViewController {
    let imageView: UIImageView = {
        let imageView = UIImageView(image: ImagesProvider.swR2D2)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let textLabel: InfoLabel = {
        let label = InfoLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Hello World!"
        label.backgroundColor = .white
        return label
    }()
    
    let russianButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Русский", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(russianButtonDidPress), for: .touchUpInside)
        button.backgroundColor = .white
        return button
    }()
    
    let englishButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("English", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(englishButtonDidPress), for: .touchUpInside)
        button.backgroundColor = .white
        return button
    }()
    
    let spanishButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Espaniol", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(spanishButtonDidPress), for: .touchUpInside)
        button.backgroundColor = .white
        return button
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        stack.alignment = .center
        
        return stack
    }()
    
    let translator = Translator(strategy: EnglishTranslationStrategy())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
}

private extension StrategyViewController {
    func setupUI() {
        setupImageView()
        setupTextLabel()
        setupStackView()
    }
    
    func setupImageView() {
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 400),
            imageView.heightAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    func setupTextLabel() {
        view.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    func setupStackView() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(russianButton)
        stackView.addArrangedSubview(englishButton)
        stackView.addArrangedSubview(spanishButton)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50)
        ])
    }
    
    @objc func russianButtonDidPress() {
        translator.setStrategy(strategy: RussianTranslationStrategy())
        textLabel.text = translator.translate()
    }
    
    @objc func englishButtonDidPress() {
        translator.setStrategy(strategy: EnglishTranslationStrategy())
        textLabel.text = translator.translate()
    }
    
    @objc func spanishButtonDidPress() {
        translator.setStrategy(strategy: SpanishTranslationStrategy())
        textLabel.text = translator.translate()
    }
}
