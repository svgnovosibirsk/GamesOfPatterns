//
//  FlyweightViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 06.01.2024.
//

import UIKit

final class FlyweightViewController: UIViewController {
    let backgoundImageView: UIImageView = {
        let imageView = UIImageView(image: ImagesProvider.swBackgroundShip)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let launchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("LAUNCH SHIPS", for: .normal)
        button.setTitleColor(.systemGray5, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        button.addTarget(self, action: #selector(launchButtonDidPress), for: .touchUpInside)
        return button
    }()
    
//    let shipImageView: UIImageView = {
//        let imageView = UIImageView(image: ImagesProvider.swEmpireShip)
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFill
//        return imageView
//    }()
    
    var presenter = FlyweightPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        presenter.delegate = self
    }
    
    @objc func launchButtonDidPress() {
        presenter.launchButtonDidPress()
    }

}

private extension FlyweightViewController {
    func setupUI() {
        setupBackgroundView()
        setupLaunchButton()
        //setupShipView()
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
    
    func setupLaunchButton() {
        view.addSubview(launchButton)
        
        NSLayoutConstraint.activate([
            launchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            launchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
//    func setupShipView() {
//        view.addSubview(shipImageView)
//        
//        NSLayoutConstraint.activate([
//            shipImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            shipImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
//    }
}

extension FlyweightViewController: FlyweightPresenterDelegate {
    func launchShips() {
        print(#function)
    }
}
