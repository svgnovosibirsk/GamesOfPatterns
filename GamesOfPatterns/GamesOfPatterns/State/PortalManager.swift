//
//  PortalManager.swift
//  GamesOfPatterns
//
//  Created by Sergey on 05.08.2024.
//

class PortalManager {
    private var state: IPortalState
    let controller: StateViewController
    
    init(_ state: IPortalState, controller: StateViewController) {
        self.state = state
        self.controller = controller
        setState(state: state)
    }
    
    func setState(state: IPortalState) {
        self.state = state
        self.state.update(manager: self)
    }
    
    func togle() {
        state.togle()
    }
}

protocol IPortalState {
    func update(manager: PortalManager)
    func togle()
}

class BasePortalState: IPortalState {
    private(set) weak var manager: PortalManager?
    
    func update(manager: PortalManager) {
        self.manager = manager
    }
    
    func togle() {}
}

class StateON: BasePortalState {
    override func togle() {
        manager?.setState(state: StateOFF())
        manager?.controller.portalImageView.image = ImagesProvider.dsDot
        print("Portal state was ON")
        print("Portal state is OFF")
    }
}

class StateOFF: BasePortalState {
    override func togle() {
        manager?.setState(state: StateON())
        manager?.controller.portalImageView.image = ImagesProvider.dsPortal
        print("Portal state was OFF")
        print("Portal state is ON")
    }
}
