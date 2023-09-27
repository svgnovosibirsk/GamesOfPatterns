//
//  PrototypeViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 25.09.2023.
//

import UIKit

final class PrototypeViewController: UIViewController {
    
    let backgroundView = UIImageView(frame: .zero)
    let stackView = UIStackView(frame: .zero)
    let topLabel = UILabel(frame: .zero)
    let numberLabel = UILabel(frame: .zero)
    let smithImageView = UIImageView(frame: .zero)
    let cloneButton = UIButton(frame: .zero)
    let spacerView = UILabel(frame: .zero)
    
    var viewModel: ProtorypeViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = PatternsNames.Prototype.rawValue
        viewModel = ProtorypeViewModel(viewController: self)
        setupScreen()
    }
    
    private func setupScreen() {
        setupBackgroundView()
        setupStackView()
        setupTopLabel()
        setupNumberLabel()
        setupSmithImageView()
        setupSpacerView()
        setupCloneButton()
    }
    
    // MARK: Background
    private func setupBackgroundView() {
        backgroundView.image = ImagesProvider.mxBackground
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
    
    // MARK: Stackview
    private func setupStackView() {
        stackView.backgroundColor = UIColor(white: 0, alpha: 0.2)
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        
        setupStackViewConstraints()
    }
    
    private func setupStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: Top Label
    private func setupTopLabel() {
        topLabel.text = "Number of Smiths"
        topLabel.textColor = .green
        topLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        stackView.addArrangedSubview(topLabel)
    }
    
    // MARK: Number Label
    private func setupNumberLabel() {
        numberLabel.text = "1"
        numberLabel.textColor = .green
        numberLabel.font = UIFont.boldSystemFont(ofSize: 80.0)
        stackView.addArrangedSubview(numberLabel)
    }
    
    // MARK: Smith Image View
    private func setupSmithImageView() {
        smithImageView.image = ImagesProvider.mxSmith1
        smithImageView.layer.cornerRadius = 20
        smithImageView.layer.masksToBounds = true
        stackView.addArrangedSubview(smithImageView)
    }
    
    // MARK: Clone Button
    private func setupCloneButton() {
        cloneButton.setTitle("     Clone     ", for: .normal)
        cloneButton.setTitleColor(.green, for: .normal)
        cloneButton.setTitleColor(.systemGreen, for: .highlighted)
        cloneButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30.0)
        cloneButton.backgroundColor = UIColor(white: 0, alpha: 0.5)
        cloneButton.layer.cornerRadius = 10
        cloneButton.addTarget(self, action: #selector(cloneButtonPressed), for: .touchUpInside)
        stackView.addArrangedSubview(cloneButton)
    }
    
    @objc private func cloneButtonPressed(_ sender: UIButton) {
        viewModel?.cloneButtonPressed()
    }
    
    // MARK: Spacer View
    private func setupSpacerView() {
        spacerView.numberOfLines = 0
        spacerView.text = """
        
        
        
        
        
        """
        spacerView.textColor = .white
        spacerView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        stackView.addArrangedSubview(spacerView)
    }
}
