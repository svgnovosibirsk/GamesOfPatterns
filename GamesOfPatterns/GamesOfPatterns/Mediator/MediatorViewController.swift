//
//  MediatorViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 23.07.2024.
//

import UIKit

class MediatorViewController: UIViewController {
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: ImagesProvider.swYoda)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        return imageView
    }()
    
    let lightButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Light", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(lightButtonDidPress), for: .touchUpInside)
        button.backgroundColor = .secondarySystemBackground
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    let darkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Dark", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(darkButtonDidPress), for: .touchUpInside)
        button.backgroundColor = .secondarySystemBackground
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    let mediator = Mediator()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
    }
}

private extension MediatorViewController {
    func setupUI() {
        setupImageView()
        setupLightButton()
        setupDarkButton()
    }
    
    func setupImageView() {
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func setupLightButton() {
        view.addSubview(lightButton)
        
        NSLayoutConstraint.activate([
            lightButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lightButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 100),
            lightButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            lightButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100)
        ])
    }
    
    func setupDarkButton() {
        view.addSubview(darkButton)
        
        NSLayoutConstraint.activate([
            darkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            darkButton.topAnchor.constraint(equalTo: lightButton.bottomAnchor, constant: 50),
            darkButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            darkButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100)
        ])
    }
    
    @objc func lightButtonDidPress() {
        mediator.notify(sender: self, event: Events.lightButtonDidPress)
    }
    
    @objc func darkButtonDidPress() {
        mediator.notify(sender: self, event: Events.darkButtonDidPress)
    }
}
