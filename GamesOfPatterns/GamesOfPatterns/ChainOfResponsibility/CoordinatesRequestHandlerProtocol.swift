//
//  CoordinatesRequestHandlerProtocol.swift
//  GamesOfPatterns
//
//  Created by Sergey on 17.07.2024.
//

protocol CoordinatesRequestHandlerProtocol {
    func handleCoordinatesRequest(completion: @escaping (String) -> Void)
}

class CoordinatesRequestHandler: CoordinatesRequestHandlerProtocol {
    var nextHandler: CoordinatesRequestHandlerProtocol?
    var coordinates: String?
    
    func setNext(handler: CoordinatesRequestHandlerProtocol) {
        self.nextHandler = handler
    }
    
    func handleCoordinatesRequest(completion: @escaping (String) -> Void) {
        if let coordinates {
            completion(coordinates)
        } else {
            nextHandler?.handleCoordinatesRequest(completion: completion)
        }
    }
}

final class SpaceNavigator: CoordinatesRequestHandler {
   
}

final class SpaceDataBase: CoordinatesRequestHandler {
    
}

final class R2D2: CoordinatesRequestHandler {
    
}
