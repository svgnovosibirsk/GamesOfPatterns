//
//  ProtorypeViewModel.swift
//  GamesOfPatterns
//
//  Created by Sergey on 27.09.2023.
//

import UIKit
import Combine

final class ProtorypeViewModel {
    let viewController: PrototypeViewController?
    let smithModel = SmithModel()
    
    var storage = Set<AnyCancellable>()
    
    init(viewController: PrototypeViewController?) {
        self.viewController = viewController
    }
    
    func cloneButtonPressed() {
        updateSmithModel()
        
        smithModel.smithArray
            .publisher
            .last()
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.updateScreen()
            }.store(in: &storage)
    }
    
    private func updateSmithModel() {
        // MARK: - Ptototype
        let smithClone = smithModel.smith.clone()
        smithModel.update(clone: smithClone)
    }
    
    private func updateNumberLabel() {
        viewController?.numberLabel.text = ("\(Smith.count)")
    }
    
    private func updateSmithImage() {
        switch smithModel.smithArray.count {
        case 1:
            viewController?.smithImageView.image = ImagesProvider.mxSmith1
        case 2:
            viewController?.smithImageView.image = ImagesProvider.mxSmith2
        case 3:
            fallthrough
        case 4:
            viewController?.smithImageView.image = ImagesProvider.mxSmith3
        case 5:
            fallthrough
        case 6:
            viewController?.smithImageView.image = ImagesProvider.mxSmith5
        default:
            viewController?.smithImageView.image = ImagesProvider.mxSmith10
        }
    }
    
    private func updateScreen() {
        updateNumberLabel()
        updateSmithImage()
    }
}
