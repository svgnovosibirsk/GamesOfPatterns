//
//  AdapterViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 02.10.2023.
//

import UIKit

final class AdapterViewController: UIViewController {
    
    let backgroundView = UIImageView(frame: .zero)
    
    override func viewDidLoad() {
        title = PatternsNames.Adapter.rawValue
        
        setupScreen()
    }
    
    private func setupScreen() {
        setupBackgroundView()
    }
    
    // MARK: Background
    private func setupBackgroundView() {
        backgroundView.image = ImagesProvider.btmBackground
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
