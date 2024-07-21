//
//  IteratorViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 21.07.2024.
//

import UIKit

class IteratorViewController: UIViewController {
    let backgoundImageView: UIImageView = {
        let imageView = UIImageView(image: ImagesProvider.safe)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "_ _ _ _ _ _ _ _ _ _"
        label.backgroundColor = UIColor(white: 1, alpha: 0.5)
        label.layer.cornerRadius = 20
        label.clipsToBounds = true
        return label
    }()
    
    let firstButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Try 1", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(firstButtonDidPress), for: .touchUpInside)
        button.backgroundColor = UIColor(white: 1, alpha: 0.5)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    let secondButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Try 2", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(secondButtonDidPress), for: .touchUpInside)
        button.backgroundColor = UIColor(white: 1, alpha: 0.5)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    let thirdButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Try 2", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(thirdButtonDidPress), for: .touchUpInside)
        button.backgroundColor = UIColor(white: 1, alpha: 0.5)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

private extension IteratorViewController {
    func setupUI() {
        setupBackgroundView()
        setupPasswordLabel()
        setupFirstButton()
        setupSecondButton()
        setupThirdButton()
    }
    
    func setupBackgroundView() {
        view.addSubview(backgoundImageView)
        
        NSLayoutConstraint.activate([
            backgoundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgoundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgoundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgoundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupPasswordLabel() {
        view.addSubview(passwordLabel)
        
        NSLayoutConstraint.activate([
            passwordLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            passwordLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            passwordLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
        ])
    }
    
    func setupFirstButton() {
        view.addSubview(firstButton)
        
        NSLayoutConstraint.activate([
            firstButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            firstButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            firstButton.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 100)
        ])
    }
    
    func setupSecondButton() {
        view.addSubview(secondButton)
        
        NSLayoutConstraint.activate([
            secondButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            secondButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 50)
        ])
    }
    
    func setupThirdButton() {
        view.addSubview(thirdButton)
        
        NSLayoutConstraint.activate([
            thirdButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            thirdButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 50)
        ])
    }
    
    @objc func firstButtonDidPress() {
        print(#function)
    }
    
    @objc func secondButtonDidPress() {
        print(#function)
    }
    
    @objc func thirdButtonDidPress() {
        print(#function)
    }
}
