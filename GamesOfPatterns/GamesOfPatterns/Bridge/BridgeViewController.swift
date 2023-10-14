//
//  BridgeViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 14.10.2023.
//

import UIKit

final class BridgeViewController: UIViewController {
    
    let backgroundView = UIImageView(frame: .zero)
    
    var random = 0
    
    override func viewWillAppear(_ animated: Bool) {
        let image = random.isMultiple(of: 2) ? ImagesProvider.airBackground2 : ImagesProvider.airBackground1
        setupBackgroundView(image: image)
    }
    
    override func viewDidLoad() {
        title = PatternsNames.Bridge.rawValue
        
        random = Int.random(in: 1...100)
        print(random) // TEST
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
}
