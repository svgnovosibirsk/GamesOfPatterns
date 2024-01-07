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
    
    var presenter = FlyweightPresenter()
    var spaceShips: [SpaceShip] = []

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
}

extension FlyweightViewController: FlyweightPresenterDelegate {
 
    func launchShips(count: Int) {
        for ship in spaceShips {
            ship.removeFromSuperview()
        }
        
        spaceShips = []
        setupSpaceShips(count: count)
    }
    
    func setupSpaceShips(count: Int) {
        var hOffset: CGFloat = 15
        var vOffset: CGFloat = -150
        
        for i in 1...count {
            let ship = SpaceShip(type: ShipType(image: ImagesProvider.swEmpireShip))
            ship.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(ship)
            
            NSLayoutConstraint.activate([
                ship.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: hOffset),
                ship.topAnchor.constraint(equalTo: view.topAnchor, constant: vOffset),
            ])
            
            if count == 4 {
                hOffset += 60
                vOffset += 30
            } else {
                hOffset += 60
                vOffset += 30
                
                if i.isMultiple(of: 2) {
                    vOffset -= 60
                }
            }
           
            spaceShips.append(ship)
            animateShips()
            
        }
    }
    
    func animateShips() {
        launchButton.isEnabled = false
        launchButton.alpha = 0.5
        
        for ship in spaceShips {
            UIView.animate(withDuration: 3) {
                ship.center.y = -(self.view.bounds.height) - 150
            } completion: { done in
                
            }
        }
        
        UIView.animate(withDuration: 0.5, delay: 2.5) {
            self.launchButton.isEnabled = true
            self.launchButton.alpha = 1
        }
    }
}
