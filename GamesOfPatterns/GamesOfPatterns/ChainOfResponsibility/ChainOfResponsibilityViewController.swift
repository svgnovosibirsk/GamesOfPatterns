//
//  ChainOfResponsibilityViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 16.07.2024.
//

import UIKit

final class ChainOfResponsibilityViewController: UIViewController {
    let backgoundImageView: UIImageView = {
        let imageView = UIImageView(image: ImagesProvider.spacemap)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let coordsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("GET COORDINATES", for: .normal)
        button.setTitleColor(.systemGray5, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(coordsButtonDidPress), for: .touchUpInside)
        button.backgroundColor = .black
        return button
    }()
    
    let coordsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .systemGreen
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Push button to get space coordinates"
        label.backgroundColor = .black
        return label
    }()
    
    let navigator = SpaceNavigator()
    let dataBase = SpaceDataBase()
    let r2d2 = R2D2()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupNavigation()
    }
}

private extension ChainOfResponsibilityViewController {
    func setupUI() {
        setupBackgroundView()
        setupCoordsButton()
        setupLabel()
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
    
    func setupCoordsButton() {
        view.addSubview(coordsButton)
        
        NSLayoutConstraint.activate([
            coordsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            coordsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupLabel() {
        view.addSubview(coordsLabel)
        
        NSLayoutConstraint.activate([
            coordsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            coordsLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            coordsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func coordsButtonDidPress() {
        print(#function)
        r2d2.handleCoordinatesRequest { coords in
            self.coordsLabel.text = coords
        }
    }
    
    func setupNavigation() {
        r2d2.setNext(handler: navigator)
        //r2d2.coordinates = "R2D2:    X:09938775 Y:75686893 Z:10948765"
        navigator.setNext(handler: dataBase)
        dataBase.coordinates = "DataBase: X:09938775 Y:75686893 Z:10948765"
    }
}
