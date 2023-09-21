//
//  BuilderViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 20.09.2023.
//

import UIKit

final class BuilderViewController: UIViewController {
    let backgroundView = UIImageView(frame: .zero)
    let sideSwitch = UISwitch(frame: .zero)
    
    override func viewDidLoad() {
        title = "Builder"
        
        setupScreen()
    }
    
    private func setupScreen() {
        setupBackgroundView()
        
        setupSideSwitch()
    }
    
    // MARK: Background
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
    
    // MARK: Switch
    private func setupSideSwitch() {
        sideSwitch.addTarget(self, action: #selector(self.switchStateDidChange(_:)), for: .valueChanged)
        
        sideSwitch.setOn(true, animated: false)
        
        sideSwitch.thumbTintColor = .systemGray
        sideSwitch.onTintColor = .black
        sideSwitch.tintColor = .white
        sideSwitch.layer.cornerRadius = sideSwitch.frame.height / 2.0
        sideSwitch.backgroundColor = .white
        sideSwitch.clipsToBounds = true
        
        
        setupSideSwitchConstraints()
    }
    
    private func setupSideSwitchConstraints() {
        sideSwitch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sideSwitch)
        
        NSLayoutConstraint.activate([
            sideSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sideSwitch.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }

    @objc func switchStateDidChange(_ sender:UISwitch!)
     {
         if (sender.isOn == true) {
             print("UISwitch state is now ON")
         } else {
             print("UISwitch state is now Off")
         }
     }
}
