//
//  FactoryMethodViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 05.08.2023.
//

import UIKit

class FactoryMethodViewController: UIViewController {
    let picker = UIPickerView()
    let chooseFighterLabel = UILabel()
    let createFighterButton = UIButton(type: .system)
    
    let fighters = ["Scorpion", "Sub-Zero"] // TODO: move to model and Presenter

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Factory Method"
        view.backgroundColor = .systemBackground
        
        picker.delegate = self // TODO: change to presenter
        picker.dataSource = self // TODO: change to presenter
        
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

    }

}

// TODO: move to presenter
extension FactoryMethodViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        fighters.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        fighters[row]
    }
}

extension FactoryMethodViewController: UIPickerViewDelegate {
    
}
