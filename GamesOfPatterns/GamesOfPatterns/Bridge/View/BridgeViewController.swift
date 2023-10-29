//
//  BridgeViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 14.10.2023.
//

import UIKit

final class BridgeViewController: UIViewController {
    
    var presenter: BridgePresenter?
    
    let backgroundView = UIImageView(frame: .zero)
    let stackView = UIStackView(frame: .zero)
    let temperatureLabel = UILabel(frame: .zero)
    let getTemperatureButton = AutoPaddingButtton(frame: .zero)
    
    override func viewDidLoad() {
        title = PatternsNames.Bridge.rawValue
        
        presenter = BridgePresenter(viewController: self)
        presenter?.setupRendomScreen()
    }
    
    // MARK: Background
    func setupBackgroundView(image: UIImage) {
        backgroundView.image = image
        backgroundView.contentMode = .scaleAspectFill
        
        setupBackgroundViewConstraints()
    }
    
    func setupBackgroundViewConstraints() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: Stack View
    func setupStackView() {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        stackView.backgroundColor = UIColor(white: 0, alpha: 0.2)
        stackView.layer.cornerRadius = 10
        
        stackView.layoutMargins = UIEdgeInsets(top: 10,
                                                 left: 10,
                                                 bottom: 10,
                                                 right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        setupStackViewConstraints()
    }
    
    func setupStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                 constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                  constant: -20),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: Temperature Label
    func setupTemperatureLabel() {
        temperatureLabel.text = "0 C"
        temperatureLabel.textColor = .white
        temperatureLabel.font = UIFont.boldSystemFont(ofSize: 40)
        stackView.addArrangedSubview(temperatureLabel)
    }
    
    // MARK: Get temperature Button
    func setupGetTemperarureButton() {
        getTemperatureButton.setTitle("GET TEMPERATURE", for: .normal)
        getTemperatureButton.setTitleColor(.white, for: .normal)
        getTemperatureButton.setTitleColor(.gray, for: .highlighted)
        getTemperatureButton.backgroundColor = UIColor(white: 0, alpha: 0.3)
        getTemperatureButton.layer.cornerRadius = 10
        getTemperatureButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        getTemperatureButton.addTarget(self, action: #selector(getTemperarureButtonPressed), for: .touchUpInside)
        stackView.addArrangedSubview(getTemperatureButton)
    }
    
    @objc func getTemperarureButtonPressed() {
        presenter?.getTemperatureButtonPressed()
    }
}

// MARK: Custom Button
class AutoPaddingButtton: UIButton {
    override var intrinsicContentSize: CGSize {
        get {
            let baseSize = super.intrinsicContentSize
            return CGSize(width: baseSize.width + 40, height: baseSize.height)
        }
    }
}
