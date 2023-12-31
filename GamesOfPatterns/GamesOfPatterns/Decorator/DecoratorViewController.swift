//
//  DecoratorViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 31.12.2023.
//

import UIKit

class DecoratorViewController: UIViewController {
    let backgoundImageView: UIImageView = {
        let imageView = UIImageView(image: ImagesProvider.nfsBackground)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let gasButton: UIButton = {
        let button = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(ImagesProvider.nfsGas, for: .normal)
        button.addTarget(self, action: #selector(gasButtonDidPress), for: .touchUpInside)
        button.layer.cornerRadius = 50
        button.layer.masksToBounds = true
        return button
    }()
    
    let engineButton: UIButton = {
        let button = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(ImagesProvider.nfsEngine, for: .normal)
        button.addTarget(self, action: #selector(engineButtonDidPress), for: .touchUpInside)
        button.layer.cornerRadius = 50
        button.layer.masksToBounds = true
        return button
    }()
    
    let nitroButton: UIButton = {
        let button = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(ImagesProvider.nfsNitro, for: .normal)
        button.addTarget(self, action: #selector(nitroButtonDidPress), for: .touchUpInside)
        button.layer.cornerRadius = 50
        button.layer.masksToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    @objc func gasButtonDidPress() {
        print(#function)
    }
    
    @objc func engineButtonDidPress() {
        print(#function)
    }
    
    @objc func nitroButtonDidPress() {
        print(#function)
    }
    
}

private extension DecoratorViewController {
    func setupUI() {
        setupBackgroundView()
        setupGasButton()
        setupEngineButton()
        setupNitroButton()
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
    
    func setupGasButton() {
        view.addSubview(gasButton)
        
        NSLayoutConstraint.activate([
            gasButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            gasButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupEngineButton() {
        view.addSubview(engineButton)
        
        NSLayoutConstraint.activate([
            engineButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            engineButton.rightAnchor.constraint(equalTo: gasButton.leftAnchor, constant: -20)
        ])
    }
    
    func setupNitroButton() {
        view.addSubview(nitroButton)
        
        NSLayoutConstraint.activate([
            nitroButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            nitroButton.leftAnchor.constraint(equalTo: gasButton.rightAnchor, constant: 20)
        ])
    }
}
