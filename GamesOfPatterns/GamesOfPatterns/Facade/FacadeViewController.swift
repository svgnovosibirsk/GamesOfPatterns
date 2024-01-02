//
//  FacadeViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 02.01.2024.
//

import UIKit

class FacadeViewController: UIViewController {
    let backgoundImageView: UIImageView = {
        let imageView = UIImageView(image: ImagesProvider.swStarOfDeath)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("START STAR OF DEATH", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(startButtonDidPress), for: .touchUpInside)
        return button
    }()
    
    let readyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = " "
        label.font = UIFont.boldSystemFont(ofSize: 60)
        label.textColor = .systemRed
        return label
    }()
    
    let presenter = FacadePresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        setupUI()
        presenter.delegate = self
    }
    
    @objc func startButtonDidPress() {
        presenter.startButtonDidPress()
    }

}

private extension FacadeViewController {
    func setupUI() {
        setupBackgroundView()
        setupStartButton()
        setupReadyLabel()
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
    
    func setupStartButton() {
        view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupReadyLabel() {
        view.addSubview(readyLabel)
        
        NSLayoutConstraint.activate([
            readyLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            readyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension  FacadeViewController: FacadePresenterDelegate {
    func updateReadyLabel(with message: String) {
        self.readyLabel.text = message
    }
}
