//
//  ObserverViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 27.07.2024.
//

import UIKit

class ObserverViewController: UIViewController {
    let backgoundImageView: UIImageView = {
        let imageView = UIImageView(image: ImagesProvider.swBackgroundShip)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let infoLabel: InfoLabel = {
        let label = InfoLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Monitoring ..."
        label.backgroundColor = UIColor(white: 1, alpha: 0.1)
        label.layer.cornerRadius = 20
        label.clipsToBounds = true
        return label
    }()
    
    let weaponLabel: WeaponLabel = {
        let label = WeaponLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Weapon ..."
        label.backgroundColor = UIColor(white: 1, alpha: 0.1)
        label.layer.cornerRadius = 20
        label.clipsToBounds = true
        return label
    }()
    
    let shieldLabel: ShieldLabel = {
        let label = ShieldLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Shield ..."
        label.backgroundColor = UIColor(white: 1, alpha: 0.1)
        label.layer.cornerRadius = 20
        label.clipsToBounds = true
        return label
    }()
    
    let scanButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Scan Space", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        button.addTarget(self, action: #selector(scanButtonDidPress), for: .touchUpInside)
        button.backgroundColor = UIColor(white: 1, alpha: 0.1)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    let monitor = Monitor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupObserver()
    }
}

private extension ObserverViewController {
    func setupUI() {
        setupBackgroundView()
        setupInfoLabel()
        setupWeaponLabel()
        setupShieldLabel()
        setupScanButton()
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
    
    func setupInfoLabel() {
        view.addSubview(infoLabel)
        
        NSLayoutConstraint.activate([
            infoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            infoLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
    }
    
    func setupWeaponLabel() {
        view.addSubview(weaponLabel)
        
        NSLayoutConstraint.activate([
            weaponLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            weaponLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            weaponLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 50)
        ])
    }
    
    func setupShieldLabel() {
        view.addSubview(shieldLabel)
        
        NSLayoutConstraint.activate([
            shieldLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            shieldLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            shieldLabel.topAnchor.constraint(equalTo: weaponLabel.bottomAnchor, constant: 10)
        ])
    }
    
    func setupScanButton() {
        view.addSubview(scanButton)
        
        NSLayoutConstraint.activate([
            scanButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            scanButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            scanButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    @objc func scanButtonDidPress() {
        monitor.scan()
        monitor.notify()
    }
    
    func setupObserver() {
        monitor.addObserver(observer: infoLabel)
        monitor.addObserver(observer: weaponLabel)
        monitor.addObserver(observer: shieldLabel)
    }
}
