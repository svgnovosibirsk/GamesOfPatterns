//
//  BuilderPresenter.swift
//  GamesOfPatterns
//
//  Created by Sergey on 23.09.2023.
//

import UIKit

final class BuilderPresenter {
    let viewController: BuilderViewController!
    
    init(viewController: BuilderViewController!) {
        self.viewController = viewController
    }
    
    func setupJediStyle() {
        let builder = JediBuilder()
        builder.reset()
        builder.setName("Anakin Skywalker")
        builder.setSwordColor(.systemBlue) // .blue
        builder.setImage(ImagesProvider.swAnakinImage)
        
        let jedi = builder.getJedi()
        
        viewController.backgroundView.image = ImagesProvider.swBackgroundBlack // change to BGWhite
        viewController.jediImageView.image = jedi.image
        viewController.jediImageView.layer.shadowColor = jedi.swordColor.cgColor
        viewController.ordenLabel.text = jedi.orden
        viewController.nameLabel.text = jedi.name
    }
    
    func setupSithStyle() {
        let builder = SithBuilder()
        builder.reset()
        builder.setName("Darth Vader")
        builder.setSwordColor(.systemRed) // .red
        builder.setImage(ImagesProvider.swDarthVaderImage)
        
        let sith = builder.getSith()
        
        viewController.backgroundView.image = ImagesProvider.swBackgroundBlack
        viewController.jediImageView.image = sith.image
        viewController.jediImageView.layer.shadowColor = sith.swordColor.cgColor
        viewController.ordenLabel.text = sith.orden
        viewController.nameLabel.text = sith.name
    }
}
