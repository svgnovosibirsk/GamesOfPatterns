//
//  BridgeViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 14.10.2023.
//

import UIKit

final class BridgeViewController: UIViewController {
    
    let backgroundView = UIImageView(frame: .zero)
    let stackView = UIStackView(frame: .zero)
    
    var random = 0
    
    override func viewWillAppear(_ animated: Bool) {
        let image = random.isMultiple(of: 2) ? ImagesProvider.airBackground2 : ImagesProvider.airBackground1
        setupBackgroundView(image: image)
        
        setupStackView()
    }
    
    override func viewDidLoad() {
        title = PatternsNames.Bridge.rawValue
        
        random = Int.random(in: 1...100)
    }
    
    // MARK: Background
    private func setupBackgroundView(image: UIImage) {
        backgroundView.image = image
        backgroundView.contentMode = .scaleAspectFill
        
        setupBackgroundViewConstraints()
    }
    
    private func setupBackgroundViewConstraints() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: Stack View
    private func setupStackView() {
        stackView.axis = .vertical
        //stackView.alignment = .center
        stackView.distribution = .fillProportionally//.equalSpacing
        stackView.spacing = 20
        stackView.backgroundColor = UIColor(white: 0, alpha: 0.2)
        stackView.layer.cornerRadius = 10
        
        stackView.layoutMargins = UIEdgeInsets(top: 100,
                                                 left: 10,
                                                 bottom: 10,
                                                 right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        setupStackViewConstraints()
    }
    
    private func setupStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                 constant: 20),
//            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
//                                             constant: 100),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                  constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 100), // TEST
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
