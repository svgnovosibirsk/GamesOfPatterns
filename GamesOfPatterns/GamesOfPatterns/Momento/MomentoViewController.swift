//
//  MomentoViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 25.07.2024.
//

import UIKit

class MomentoViewController: UIViewController {
    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: ImagesProvider.hpGer)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let hatImageView: UIImageView = {
        let imageView = UIImageView(image: ImagesProvider.hpHat)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let studentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = " X "
        label.backgroundColor = .black
        label.layer.cornerRadius = 20
        label.clipsToBounds = true
        return label
    }()
    
    let studentButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get Student", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(studentButtonDidPress), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    let facultyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get Faculty", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(facultyButtonDidPress), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(saveButtonDidPress), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    let undoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Undo", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(undoButtonDidPress), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupUI()
    }
}

private extension MomentoViewController {
    func setupUI() {
        setupLogoImageView()
        setupStudentLabel()
        setupHatImageView()
        setupStudentButton()
        setupFacultyButton()
        setupSaveButton()
        setupUndoButton()
    }
    
    func setupLogoImageView() {
        view.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setupStudentLabel() {
        view.addSubview(studentLabel)
        
        NSLayoutConstraint.activate([
            studentLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            studentLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            studentLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10)
        ])
    }
    
    func setupHatImageView() {
        view.addSubview(hatImageView)
        
        NSLayoutConstraint.activate([
            hatImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hatImageView.topAnchor.constraint(equalTo: studentLabel.bottomAnchor, constant: 10),
            hatImageView.widthAnchor.constraint(equalToConstant: 200),
            hatImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func setupStudentButton () {
        view.addSubview(studentButton)
        
        NSLayoutConstraint.activate([
            studentButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            studentButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            studentButton.topAnchor.constraint(equalTo: hatImageView.bottomAnchor, constant: 50)
        ])
    }
    
    func setupFacultyButton () {
        view.addSubview(facultyButton)
        
        NSLayoutConstraint.activate([
            facultyButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            facultyButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            facultyButton.topAnchor.constraint(equalTo: studentButton.bottomAnchor, constant: 10)
        ])
    }
    
    func setupSaveButton () {
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            saveButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            saveButton.topAnchor.constraint(equalTo: facultyButton.bottomAnchor, constant: 10)
        ])
    }
    
    func setupUndoButton () {
        view.addSubview(undoButton)
        
        NSLayoutConstraint.activate([
            undoButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            undoButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            undoButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 10)
        ])
    }
    
    @objc func studentButtonDidPress() {
        print(#function)
    }
    
    @objc func facultyButtonDidPress() {
        print(#function)
    }
    
    @objc func saveButtonDidPress() {
        print(#function)
    }
    
    @objc func undoButtonDidPress() {
        print(#function)
    }
}
