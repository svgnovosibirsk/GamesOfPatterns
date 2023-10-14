//
//  BridgeViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 14.10.2023.
//

import UIKit

final class BridgeViewController: UIViewController {
    var random = 0
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor =  random.isMultiple(of: 2) ? .systemPink : .systemOrange // TEST
    }
    
    override func viewDidLoad() {
        title = PatternsNames.Bridge.rawValue
        
        random = Int.random(in: 1...100)
        print(random) // TEST
    }
}
