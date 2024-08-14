//
//  Visitor.swift
//  GamesOfPatterns
//
//  Created by Sergey on 14.08.2024.
//

// MARK: Protocols

protocol ICrewMember {
    func accept(visitor: IVisitor)
}

protocol IVisitor {
    func visitJamesKirk(_ member: JamesKirk)
    func visitSpoke(_ member: Spoke)
    func visitSarek(_ member: Sarek)
    func visitWorf(_ member: Worf)
    func visitHikaruSulu(_ member: HikaruSulu)
}

// MARK: Crew Members

final class JamesKirk: ICrewMember {
    let name = "James Kirk"
    let planet = "Earth"
    
    func accept(visitor: IVisitor) {
        visitor.visitJamesKirk(self)
    }
}

final class Spoke: ICrewMember {
    let name = "Spoke"
    let planet = "Vulcan"
    
    func accept(visitor: IVisitor) {
        visitor.visitSpoke(self)
    }
}

final class Sarek: ICrewMember {
    let name = "Sarek"
    let planet = "Vulcan"
    
    func accept(visitor: IVisitor) {
        visitor.visitSarek(self)
    }
}

final class Worf: ICrewMember {
    let name = "Worf"
    let planet = "Klingon"
    
    func accept(visitor: IVisitor) {
        visitor.visitWorf(self)
    }
}

final class HikaruSulu: ICrewMember {
    let name = "Hikaru Sulu"
    let planet = "Earth"
    
    func accept(visitor: IVisitor) {
        visitor.visitHikaruSulu(self)
    }
}

// MARK: Visitors

final class PrintNameVisitor: IVisitor {
    func visitJamesKirk(_ member: JamesKirk) {
        print(member.name)
    }
    
    func visitSpoke(_ member: Spoke) {
        print(member.name)
    }
    
    func visitSarek(_ member: Sarek) {
        print(member.name)
    }
    
    func visitWorf(_ member: Worf) {
        print(member.name)
    }
    
    func visitHikaruSulu(_ member: HikaruSulu) {
        print(member.name)
    }
}

final class PrintPlanetVisitor: IVisitor {
    func visitJamesKirk(_ member: JamesKirk) {
        print(member.planet)
    }
    
    func visitSpoke(_ member: Spoke) {
        print(member.planet)
    }
    
    func visitSarek(_ member: Sarek) {
        print(member.planet)
    }
    
    func visitWorf(_ member: Worf) {
        print(member.planet)
    }
    
    func visitHikaruSulu(_ member: HikaruSulu) {
        print(member.planet)
    }
}

// MARK: Visitor Manager

final class VisitorManager {
    private let jamesKirk = JamesKirk()
    private let spoke = Spoke()
    private let sarek = Sarek()
    private let worf = Worf()
    private let hikaruSulu = HikaruSulu()
    
    private let crewMembers: [ICrewMember]
    
    let nameVisitor = PrintNameVisitor()
    let planetVisitor = PrintPlanetVisitor()
    
    init() {
        crewMembers = [jamesKirk, spoke, sarek, worf, hikaruSulu]
    }
    
    func printCrewNames() {
        crewMembers.forEach { $0.accept(visitor: nameVisitor) }
    }
    
    func printCrewPlanets() {
        crewMembers.forEach { $0.accept(visitor: planetVisitor) }
    }
}
