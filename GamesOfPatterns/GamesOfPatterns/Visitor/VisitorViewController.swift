//
//  VisitorViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 14.08.2024.
//

import UIKit

class VisitorViewController: UIViewController {
    let imageView: UIImageView = {
        let imageView = UIImageView(image: ImagesProvider.startrekLogo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let nameButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Print crew names", for: .normal)
        button.setTitleColor(.systemPurple, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(nameButtonDidPress), for: .touchUpInside)
        button.backgroundColor = .white
        return button
    }()
    
    let planetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Print crew planets", for: .normal)
        button.setTitleColor(.systemPurple, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(planetButtonDidPress), for: .touchUpInside)
        button.backgroundColor = .white
        return button
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.axis = .vertical
        stack.distribution = .equalCentering
        stack.alignment = .center
        
        return stack
    }()
    
    let manager = VisitorManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupUI()
    }
}

private extension VisitorViewController {
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
        stackView.addArrangedSubview(nameButton)
        stackView.addArrangedSubview(planetButton)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50)
        ])
    }
    
    @objc func nameButtonDidPress() {
        print("***")
        manager.printCrewNames()
    }
    
    @objc func planetButtonDidPress() {
        print("***")
        manager.printCrewPlanets()
    }
}
