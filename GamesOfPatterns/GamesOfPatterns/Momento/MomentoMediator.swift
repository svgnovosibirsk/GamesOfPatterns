//
//  MomentoMediator.swift
//  GamesOfPatterns
//
//  Created by Sergey on 26.07.2024.
//

import Foundation

enum MomentoEvents {
    static let studentButtonDidPress = "studentButtonDidPress"
    static let facultyButtonDidPress = "facultyButtonDidPress"
    static let saveButtonDidPress = "saveButtonDidPress"
    static let undoButtonDidPress = "undoButtonDidPress"
}

protocol MomentoMediatorPtotocol: AnyObject {
    func notify(sender: MomentoViewController, event: String)
}

final class MomentoMediator: MomentoMediatorPtotocol {
    let names = ["Hermione", "Harry", "Ron", "Neville", "Luna"]
    let lastNames = ["Granger", "Potter", "Weasley", "Longbottom", "Lovegood"]
    var students = [Student]()
    
    func notify(sender: MomentoViewController, event: String) {
        if event == MomentoEvents.studentButtonDidPress {
            getStudent(sender: sender)
        } else if event == MomentoEvents.facultyButtonDidPress {
            getFaculty(sender: sender)
        } else if event == MomentoEvents.saveButtonDidPress {
            saveStudent(sender: sender)
            print(students.count)
        } else if event == MomentoEvents.undoButtonDidPress {
            getLastStudent(sender: sender)
            print(students.count)
        }
    }
}

private extension MomentoMediator {
    func getStudent(sender: MomentoViewController) {
        let name = names.randomElement()!
        let lastName = lastNames.randomElement()!
        let fullName = name + " " + lastName
        sender.studentLabel.text = fullName
    }
    
    func getFaculty(sender: MomentoViewController) {
        let number = Int.random(in: 0...3)
        switch number {
        case 0:
            sender.studentLabel.textColor = .systemBlue
        case 1:
            sender.studentLabel.textColor = .systemYellow
        case 2:
            sender.studentLabel.textColor = .systemRed
        default:
            sender.studentLabel.textColor = .systemGreen
        }
    }
    
    func saveStudent(sender: MomentoViewController) {
        let student = Student()
        student.name = sender.studentLabel.text!
        student.faculty = sender.studentLabel.textColor
        students.append(student)
    }
    
    func getLastStudent(sender: MomentoViewController) {
        guard !students.isEmpty else { return }
        var student = students.removeLast()
        if sender.studentLabel.text == student.name && sender.studentLabel.textColor == student.faculty {
            guard !students.isEmpty else { return }
            student = students.removeLast()
        }
        sender.studentLabel.text = student.name
        sender.studentLabel.textColor = student.faculty
    }
}
