//
//  AbstractFactoryViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 05.08.2023.
//

import UIKit

final class AbstractFactoryViewController: UIViewController {
    
    var presenter: AbstractFactoryPresenter? = nil
    
    let nameLabel = UILabel()
    let weaponNameLabel = UILabel()
    let turtleImageView = UIImageView(frame: .zero)
    let weaponImageView = UIImageView(frame: .zero)
    
    var segmentedControl: UISegmentedControl! = nil
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = AbstractFactoryPresenter(viewController: self)
        
        title = "Abstract Factory"
        view.backgroundColor = .systemBackground
        
        setupScreen()
    }
    
    private func setupScreen() {
        setupNameLabel()
        setupTurtleImageView()
        setupWeaponImageView()
        setupWeaponNameLabel()
        setupSegmentedControl()
    }
    
    // MARK: Segmented Control
    private func setupSegmentedControl() {
        segmentedControl = UISegmentedControl(items: presenter?.itemsForSegmentedControl)
        segmentedControl.backgroundColor = .systemGreen
        segmentedControl.selectedSegmentTintColor = .green
        
        setSegmentedControlConstraints()
    }
    
    private func setSegmentedControlConstraints() {
        segmentedControl?.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(segmentedControlDidChange), for: .valueChanged)
        view.addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            segmentedControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
    
    @objc private func segmentedControlDidChange(_ segmentedControl: UISegmentedControl) {
        presenter?.segmentedControlDidChange(segmentedControl)
    }
    
    // MARK: Name Label
    private func setupNameLabel() {
        nameLabel.text = "TMNT"
        nameLabel.textAlignment = .center
        nameLabel.textColor = .systemGreen
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        setNameLabelConstraints()
    }
    
    private func setNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5)
        ])
    }
    
    // MARK: Image View
    private func setupTurtleImageView() {
        turtleImageView.image = ImagesProvider.tmntLogo
        turtleImageView.layer.borderColor = UIColor.systemGreen.cgColor
        turtleImageView.layer.borderWidth = 15
        turtleImageView.contentMode = .scaleAspectFill
        turtleImageView.layer.cornerRadius = (turtleImageView.image?.size.height)! / 2
        turtleImageView.clipsToBounds = true
        
        setTurtleImageViewConstraints()
    }
    
    private func setTurtleImageViewConstraints() {
        turtleImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(turtleImageView)
        
        NSLayoutConstraint.activate([
            turtleImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            turtleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: Weapon Image View
    private func setupWeaponImageView() {
        weaponImageView.image = ImagesProvider.tmntWeapons
        weaponImageView.contentMode = .scaleAspectFill
        
        setWeaponImageViewConstraints()
    }
    
    private func setWeaponImageViewConstraints() {
        weaponImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(weaponImageView)
        
        NSLayoutConstraint.activate([
            weaponImageView.topAnchor.constraint(equalTo: turtleImageView.bottomAnchor, constant: 15),
            weaponImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: Weapon Name Label
    private func setupWeaponNameLabel() {
        weaponNameLabel.text = "Weapon"
        weaponNameLabel.textAlignment = .center
        weaponNameLabel.textColor = .systemGreen
        weaponNameLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        setWeaponNameLabelConstraints()
    }
    
    private func setWeaponNameLabelConstraints() {
        weaponNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(weaponNameLabel)
        
        NSLayoutConstraint.activate([
            weaponNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            weaponNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            weaponNameLabel.topAnchor.constraint(equalTo: weaponImageView.bottomAnchor, constant: 15)
        ])
    }

}
