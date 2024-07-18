//
//  ComandViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 18.07.2024.
//

import UIKit

final class ComandViewController: UIViewController {
    let backgoundImageView: UIImageView = {
        let imageView = UIImageView(image: ImagesProvider.startrek)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let routeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CALCULATE ROUTTE", for: .normal)
        button.setTitleColor(.systemGray5, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(routeButtonDidPress), for: .touchUpInside)
        button.backgroundColor = .black
        return button
    }()
    
    let warpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PREPARE WARP", for: .normal)
        button.setTitleColor(.systemGray5, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(warpButtonDidPress), for: .touchUpInside)
        button.backgroundColor = .black
        return button
    }()
    
    let routeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .systemGreen
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Route:"
        label.backgroundColor = .black
        return label
    }()
    
    let warpLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .systemGreen
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Warp:"
        label.backgroundColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

private extension ComandViewController {
    func setupUI() {
        setupBackgroundView()
        setupRouteLabel()
        setupWarpLabel()
        setupRouteButton()
        setupWarpButton()
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
    
    func setupRouteLabel() {
        view.addSubview(routeLabel)
        
        NSLayoutConstraint.activate([
            routeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            routeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            routeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }
    
    func setupWarpLabel() {
        view.addSubview(warpLabel)
        
        NSLayoutConstraint.activate([
            warpLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            warpLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            warpLabel.topAnchor.constraint(equalTo: routeLabel.bottomAnchor, constant: 20)
        ])
    }
    
    func setupRouteButton() {
        view.addSubview(routeButton)
        
        NSLayoutConstraint.activate([
            routeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            routeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            routeButton.topAnchor.constraint(equalTo: warpLabel.bottomAnchor, constant: 20)
        ])
    }
    
    func setupWarpButton() {
        view.addSubview(warpButton)
        
        NSLayoutConstraint.activate([
            warpButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            warpButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            warpButton.topAnchor.constraint(equalTo: routeButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func routeButtonDidPress() {
        print(#function)
    }
    
    @objc func warpButtonDidPress() {
        print(#function)
    }
}
