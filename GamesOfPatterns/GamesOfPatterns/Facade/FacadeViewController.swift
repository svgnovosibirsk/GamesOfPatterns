//
//  FacadeViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 02.01.2024.
//

import UIKit

class FacadeViewController: UIViewController {
    let backgoundImageView: UIImageView = {
        let imageView = UIImageView(image: ImagesProvider.swStarOfDeath)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black

        setupUI()
    }

}

private extension FacadeViewController {
    func setupUI() {
        setupBackgroundView()
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
}
