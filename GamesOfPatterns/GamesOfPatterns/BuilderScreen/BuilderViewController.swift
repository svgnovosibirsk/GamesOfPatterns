//
//  BuilderViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 20.09.2023.
//

import UIKit

final class BuilderViewController: UIViewController {
    let backgroundView = UIImageView(frame: .zero)
    
    override func viewDidLoad() {
        title = "Builder"
        
        setupScreen()
    }
    
    private func setupScreen() {
        setupBackgroundView()
    }
    
    private func setupBackgroundView() {
        backgroundView.image = ImagesProvider.swBackgroundBlack
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
}
