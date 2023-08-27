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
    let turtleImageView = UIImageView(frame: .zero)
    
    var segmentedControl: UISegmentedControl! = nil
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = AbstractFactoryPresenter(viewController: self)
        
        title = "Abstract Factory"
        view.backgroundColor = .systemBackground
        
        setupNameLabel()
        setupTurtleImageView()
        
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

}
