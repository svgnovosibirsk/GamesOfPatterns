//
//  ShipModel.swift
//  GamesOfPatterns
//
//  Created by Sergey on 06.01.2024.
//

import UIKit
//MARK: - Flyweight
final class ShipType {
    private let image: UIImage
    
    init(image: UIImage) {
        self.image = image
    }
    
    func getImage() -> UIImage? {
        image
    }
}

final class SpaceShip: UIImageView {
    let type: ShipType
    
    init(type: ShipType) {
        self.type = type
        super.init(image: nil, highlightedImage: nil)
        self.image = type.getImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class SpaceShipFactory {
    let empireShipType = ShipType(image: ImagesProvider.swEmpireShip)

    func getSpaceShip() -> SpaceShip {
        SpaceShip(type: empireShipType)
    }
}
