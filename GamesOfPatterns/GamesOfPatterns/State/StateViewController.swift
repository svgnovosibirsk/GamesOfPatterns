//
//  StateViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 03.08.2024.
//

import UIKit

class StateViewController: UIViewController {
    let portalImageView: UIImageView = {
        let imageView = UIImageView(image: ImagesProvider.dsDot)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var portalManager: PortalManager?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        setupUI()
        addTapGesture()
        portalManager = PortalManager(StateOFF(), controller: self)
    }
}

private extension StateViewController {
    func setupUI() {
        setupStoneImageView()
    }
    
    func setupStoneImageView() {
        view.addSubview(portalImageView)
        
        NSLayoutConstraint.activate([
            portalImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            portalImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            portalImageView.widthAnchor.constraint(equalToConstant: 300),
            portalImageView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
    }
    
    func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        portalManager?.togle()
    }
}
