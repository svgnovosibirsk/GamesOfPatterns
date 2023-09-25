//
//  BuilderViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 20.09.2023.
//

import UIKit

final class BuilderViewController: UIViewController {
    var presenter: BuilderPresenter?
    
    var backgroundView = UIImageView(frame: .zero)
    var jediImageView = UIImageView(frame: .zero)
    var ordenLabel = UILabel(frame: .zero)
    var nameLabel = UILabel(frame: .zero)
    
    let sideSwitch = UISwitch(frame: .zero)
    let sideLabel = UILabel(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Builder"
        
        presenter = BuilderPresenter(viewController: self)
        
        setupScreen()
    }
    
    private func setupScreen() {
        setupBackgroundView()
    
        setupOrdenLabel()
        setupJediImageView()
        setupNameLabel()
        
        setupSideSwitch()
        setupSideLabel()
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
             presenter?.setupJediStyle()
         } else {
             presenter?.setupSithStyle()
         }
     }
    
    // MARK: Side Label
    private func setupSideLabel() {
        sideLabel.text = "Chose the side"
        sideLabel.textAlignment = .center
        sideLabel.textColor = .systemGray
        sideLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        setupSideLabelConstraints()
    }
    
    private func setupSideLabelConstraints() {
        sideLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sideLabel)
        
        NSLayoutConstraint.activate([
            sideLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            sideLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            sideLabel.bottomAnchor.constraint(equalTo: sideSwitch.topAnchor, constant: -20)
        ])
    }
    
    // MARK: Orden Label
    private func setupOrdenLabel() {
        ordenLabel.text = " "
        ordenLabel.textAlignment = .center
        ordenLabel.textColor = .systemGray
        ordenLabel.font = UIFont.boldSystemFont(ofSize: 50.0)
        
        setupOrdenLabelConstraints()
    }
    
    private func setupOrdenLabelConstraints() {
        ordenLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ordenLabel)
        
        NSLayoutConstraint.activate([
            ordenLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            ordenLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            ordenLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }
    
    // MARK: Jadi Image View
    private func setupJediImageView() {
        jediImageView.image = ImagesProvider.swLogo
        jediImageView.contentMode = .scaleAspectFill
        jediImageView.layer.cornerRadius = (jediImageView.image?.size.height)! / 2
        //jediImageView.clipsToBounds = true
        
        jediImageView.layer.shadowColor = UIColor.systemYellow.cgColor
        jediImageView.layer.shadowOpacity = 1
        jediImageView.layer.shadowOffset = .zero
        jediImageView.layer.shadowRadius = 20
        
        jediImageView.layer.shouldRasterize = true
        jediImageView.layer.rasterizationScale = UIScreen.main.scale
        
        setJediImageViewConstraints()
        animateJadiImageView()
    }
    
    private func setJediImageViewConstraints() {
        jediImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(jediImageView)
        
        NSLayoutConstraint.activate([
            jediImageView.topAnchor.constraint(equalTo: ordenLabel.bottomAnchor, constant: 10),
            jediImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func animateJadiImageView() {
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveLinear, animations: {
            self.jediImageView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { (_) in
            UIView.animate(withDuration: 1, delay: 0.0, options: .curveLinear, animations: {
                self.jediImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: { [weak self] _ in
                self?.animateJadiImageView()
            })
        }
    }
    
    // MARK: Name Label
    private func setupNameLabel() {
        nameLabel.text = " "
        nameLabel.textAlignment = .center
        nameLabel.textColor = .systemGray
        nameLabel.font = UIFont.boldSystemFont(ofSize: 40.0)
        
        nameLabel.numberOfLines = 1;
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.5
        
        nameLabel.isAccessibilityElement = true
        nameLabel.accessibilityHint = "the name of the knight"
        nameLabel.accessibilityValue = nameLabel.text
        
        setupNameLabelConstraints()
    }
    
    private func setupNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            nameLabel.bottomAnchor.constraint(equalTo: jediImageView.bottomAnchor, constant: 50)
        ])
    }
}
