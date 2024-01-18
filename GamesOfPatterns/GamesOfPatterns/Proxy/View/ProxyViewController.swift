//
//  ProxyViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 17.01.2024.
//

import UIKit

class ProxyViewController: UIViewController {
    let grinchImageView: UIImageView = {
        let imageView = UIImageView(image: ImagesProvider.grinch)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let chooseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(" Choose a holiday to stole ", for: .normal)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.systemGray6, for: .normal)
        button.setTitleColor(.systemGray5, for: .highlighted)
        button.backgroundColor = .systemRed
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        button.addTarget(self, action: #selector(chooseButtonDidPress), for: .touchUpInside)
        button.layer.cornerRadius = 20
        return button
    }()
    
    let holidayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "❄️❄️❄️ New Year ❄️❄️❄️"
        label.textColor = .systemRed
        label.font = UIFont.boldSystemFont(ofSize: 60)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private let viewModel = ProxiViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray6
        setupUI()
        
        viewModel.labelText.bind { [weak self] str in
            self?.holidayLabel.text = str
        }
    }
    
    @objc func chooseButtonDidPress() {
        print(#function)
        viewModel.chooseButtonDidPress()
    }
}

private extension ProxyViewController {
    func setupUI() {
        setupGrinchImageView()
        setupChooseButton()
        setupHolidayLabel()
    }
    
    func setupGrinchImageView() {
        view.addSubview(grinchImageView)
        
        NSLayoutConstraint.activate([
            grinchImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            grinchImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupChooseButton() {
        view.addSubview(chooseButton)
        
        NSLayoutConstraint.activate([
            chooseButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            chooseButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            chooseButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            chooseButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setupHolidayLabel() {
        view.addSubview(holidayLabel)
        
        NSLayoutConstraint.activate([
            holidayLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            holidayLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            holidayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
        ])
    }
}
