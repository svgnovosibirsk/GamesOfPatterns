//
//  Mediator.swift
//  GamesOfPatterns
//
//  Created by Sergey on 24.07.2024.
//

import UIKit

enum Events {
    static let lightButtonDidPress = "lightButtonDidPress"
    static let darkButtonDidPress = "darkButtonDidPress"
}

protocol MediatorPtotocol: AnyObject {
    func notify(sender: MediatorViewController, event: String)
}

final class Mediator: MediatorPtotocol {
    
    func notify(sender: MediatorViewController, event: String) {
        if event == Events.lightButtonDidPress {
            sender.imageView.image = ImagesProvider.swYoda
            sender.view.backgroundColor = .white
            sender.lightButton.backgroundColor = .secondarySystemBackground
            sender.darkButton.backgroundColor = .secondarySystemBackground
        } else if event == Events.darkButtonDidPress {
            sender.imageView.image = ImagesProvider.swDarthMaul
            sender.view.backgroundColor = .black
            sender.lightButton.backgroundColor = .lightGray
            sender.darkButton.backgroundColor = .lightGray
        }
    }
}
