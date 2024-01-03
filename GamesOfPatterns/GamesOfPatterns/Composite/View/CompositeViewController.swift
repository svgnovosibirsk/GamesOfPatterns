//
//  CompositeViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 30.12.2023.
//

import UIKit

class CompositeViewController: UIViewController {
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: ImagesProvider.wcLogo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: ImagesProvider.wcBackground)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let orcButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Orcs", for: .normal)
        btn.setTitleColor(.systemGreen, for: .normal)
        btn.setTitleColor(.systemGray, for: .highlighted)
        btn.addTarget(self, action: #selector(orcButtonPressed), for: .touchUpInside)
        return btn
    }()
    
    let humanButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Humans", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.setTitleColor(.systemGray, for: .highlighted)
        btn.addTarget(self, action: #selector(humanButtonPressed), for: .touchUpInside)
        return btn
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40)
        label.textColor = .systemBlue
        return label
    }()
    
    var presenter = CompositePresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        presenter.delegate = self
        
        setupUI()
    }
    
    @objc func orcButtonPressed() {
        numberLabel.textColor = .systemGreen
        presenter.orcButtonPressed()
    }
    
    @objc func humanButtonPressed() {
        numberLabel.textColor = .systemBlue
        presenter.humanButtonPressed()
    }

}

private extension CompositeViewController {
    func setupUI() {
        setupLogo()
        setupBackground()
        setupOrcButton()
        setupHumanButton()
        setupNumberLabel()
    }
    
    func setupLogo() {
        view.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupBackground() {
        view.addSubview(backgroundImageView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10),
            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupOrcButton() {
        view.addSubview(orcButton)
        
        NSLayoutConstraint.activate([
            orcButton.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 10),
            orcButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80)
        ])
    }
    
    func setupHumanButton() {
        view.addSubview(humanButton)
        
        NSLayoutConstraint.activate([
            humanButton.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 10),
            humanButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80)
        ])
    }
    
    func setupNumberLabel() {
        view.addSubview(numberLabel)
        
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: orcButton.bottomAnchor, constant: 10),
            numberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension CompositeViewController: CompositePresenterDelegate {
    func updateNumberLabel(with number: String) {
        numberLabel.text = number
    }
}
