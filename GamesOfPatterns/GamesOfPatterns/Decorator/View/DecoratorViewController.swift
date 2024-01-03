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
    
    let speedButton: UIButton = {
        let button = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 50, height: 200)))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("MAX SPEED", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.addTarget(self, action: #selector(speedButtonDidPress), for: .touchUpInside)
        button.layer.masksToBounds = true
        return button
    }()
    
    let speedLabel: UILabel = {
        let label = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "220"
        label.font = UIFont.boldSystemFont(ofSize: 60)
        label.textColor = .white
        return label
    }()
    
    let presenter = DecoratorPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        presenter.delegate = self
    }
    
    @objc func gasButtonDidPress() {
        presenter.gasButtonDidPress()
        nitroButton.isEnabled = true
    }
    
    @objc func engineButtonDidPress() {
        presenter.engineButtonDidPress()
        gasButton.isEnabled = true
    }
    
    @objc func nitroButtonDidPress() {
        presenter.nitroButtonDidPress()
    }
    
    @objc func speedButtonDidPress() {
        presenter.speedButtonDidPress()
    }
    
}

private extension DecoratorViewController {
    func setupUI() {
        setupBackgroundView()
        setupGasButton()
        setupEngineButton()
        setupNitroButton()
        setupSpeedButton()
        setupSpeedLabel()
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
        
        gasButton.isEnabled = false
        
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
        
        nitroButton.isEnabled = false
        
        NSLayoutConstraint.activate([
            nitroButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            nitroButton.leftAnchor.constraint(equalTo: gasButton.rightAnchor, constant: 20)
        ])
    }
    
    func setupSpeedButton() {
        view.addSubview(speedButton)
        
        NSLayoutConstraint.activate([
            speedButton.topAnchor.constraint(equalTo: gasButton.bottomAnchor, constant: 20),
            speedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupSpeedLabel() {
        view.addSubview(speedLabel)
        
        NSLayoutConstraint.activate([
            speedLabel.topAnchor.constraint(equalTo: speedButton.bottomAnchor, constant: 20),
            speedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension DecoratorViewController: DecoratorPresenterDelegate {
    func updateSpeedLabel(with speed: String) {
        speedLabel.text = speed
    }
}
