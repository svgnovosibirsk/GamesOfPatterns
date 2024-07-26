//
//  Momento.swift
//  GamesOfPatterns
//
//  Created by Sergey on 26.07.2024.
//

import UIKit

class Student {
    var faculty = UIColor.blue
    var name = "Unknown"
    
    func setFaculty(color: UIColor) {
        self.faculty = color
    }
    
    func setName(_ name: String) {
        self.name = name
    }
    
    func saveStuddent() ->  StudentMomento {
        return StudentMomento(faculty: faculty, name: name, student: self)
    }
}

struct StudentMomento {
    let faculty: UIColor
    let name: String
    let student: Student
    
    func restoreStudent() {
        student.setName(name)
        student.setFaculty(color: faculty)
    }
}
