//
//  TemplateMethodViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 11.08.2024.
//

import UIKit

class TemplateMethodViewController: UIViewController {
    let imageView: UIImageView = {
        let imageView = UIImageView(image: ImagesProvider.wcOrk)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let knightButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Knight atack", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(knightButtonDidPress), for: .touchUpInside)
        button.backgroundColor = .white
        return button
    }()
    
    let orkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ork atack", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(orkButtonDidPress), for: .touchUpInside)
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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupUI()
    }
}

private extension TemplateMethodViewController {
    func setupUI() {
        setupImageView()
        setupStackView()
    }
    
    func setupImageView() {
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func setupStackView() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(orkButton)
        stackView.addArrangedSubview(knightButton)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50)
        ])
    }
    
    @objc func knightButtonDidPress() {
        print(#function)
    }
    
    @objc func orkButtonDidPress() {
        print(#function)
    }
}
