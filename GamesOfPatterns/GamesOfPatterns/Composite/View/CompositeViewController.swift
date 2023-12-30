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
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: ImagesProvider.wcBackground)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        setupUI()
    }

}

private extension CompositeViewController {
    func setupUI() {
        setupLogo()
        setupBackground()
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
}
