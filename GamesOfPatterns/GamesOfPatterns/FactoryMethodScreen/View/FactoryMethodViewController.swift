//
//  FactoryMethodViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 05.08.2023.
//

import UIKit

class FactoryMethodViewController: UIViewController {
    var presenter: FactoryMethodVCPresenter?
    let picker = UIPickerView()
    let chooseFighterLabel = UILabel()
    let createFighterButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Factory Method"
        view.backgroundColor = .systemBackground
        
        presenter = FactoryMethodVCPresenter(viewController: self)
        
        picker.delegate = presenter
        picker.dataSource = presenter
        
        setupChooseFighterLabel()
        setupPicker()
        setupCreateFighterButton()
    }
    
    // TODO: make custom TextField
    private func setupChooseFighterLabel() {
        chooseFighterLabel.text = "Chose your fighter".uppercased()
        chooseFighterLabel.textColor = .systemYellow
        chooseFighterLabel.textAlignment = .center
        
        chooseFighterLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chooseFighterLabel)
    
        chooseFighterLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        chooseFighterLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        chooseFighterLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    // TODO: make custom Picker
    private func setupPicker() {
        picker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picker)

        picker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50.0).isActive = true
        picker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50.0).isActive = true
        picker.topAnchor.constraint(equalTo: chooseFighterLabel.bottomAnchor, constant: 5).isActive = true
    }
    
    // TODO: make custom Button
    private func setupCreateFighterButton() {
        createFighterButton.setTitle("Create fighter".uppercased(), for: .normal)
        createFighterButton.tintColor = .systemYellow
       // createFighterButton.backgroundColor = .secondarySystemBackground
       // createFighterButton.layer.cornerRadius = 10
        
        createFighterButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(createFighterButton)
        
        createFighterButton.topAnchor.constraint(equalTo: picker.bottomAnchor, constant: 5).isActive = true
        createFighterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        createFighterButton.addTarget(self, action: #selector(createFighterButtonPressed), for: .touchUpInside)
    }
    
    @objc private func createFighterButtonPressed() {
        print(#function)
    }

}
