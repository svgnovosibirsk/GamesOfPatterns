//
//  SingletonViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 28.09.2023.
//

import UIKit

final class SingletonViewController: UIViewController {
    
    // MARK: - Constants
    private enum Constants {
        static let labelFontSize = 25.0
        static let textFontSize = 20.0
        static let buttonFontSize = 30.0
        static let cornerRadiusSize = 10.0
    }
    
    var presenter: SingletonPresenter?
    
    let backgroundView = UIImageView(frame: .zero)
    let stackView = UIStackView(frame: .zero)
    let textView = UITextView(frame: .zero)
    let passwordTextField = UITextField(frame: .zero)
    let saveButton = UIButton(frame: .zero)
    let readButton = UIButton(frame: .zero)
    let spacerView = UILabel(frame: .zero)
    let messageLabel = UILabel(frame: .zero)
    let passwordLabel = UILabel(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = PatternsNames.Singleton.rawValue
        
        presenter = SingletonPresenter(viewController: self)
        
        setupScreen()
        //setupDismissKeyboardGestureRecognizer()
        registerForKeyboardNotifications()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    private func setupScreen() {
        setupBackgroundView()
        setupStackView()
        setupMessageLabel()
        setupTextView()
        setupPasswordLabel()
        setupPasswordTextField()
        setupSpacerView()
        setupSaveButton()
        setupReadButton()
    }
    
    // MARK: Background
    private func setupBackgroundView() {
        backgroundView.image = ImagesProvider.jbBackground
        backgroundView.contentMode = .scaleAspectFill
        
        setupBackgroundViewConstraints()
    }
    
    private func setupBackgroundViewConstraints() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: Stackview
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        
        setupStackViewConstraints()
    }
    
    private func setupStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: Massage Label
    private func setupMessageLabel() {
        messageLabel.text = "Message"
        messageLabel.textColor = .systemGray6
        messageLabel.font = UIFont.boldSystemFont(ofSize: Constants.labelFontSize)
        stackView.addArrangedSubview(messageLabel)
    }
    
    // MARK: Password Label
    private func setupPasswordLabel() {
        passwordLabel.text = "Password"
        passwordLabel.textColor = .systemGray6
        passwordLabel.font = UIFont.boldSystemFont(ofSize: Constants.labelFontSize)
        stackView.addArrangedSubview(passwordLabel)
    }
    
    // MARK: Text View
    private func setupTextView() {
        textView.backgroundColor = UIColor(white: 1, alpha: 0.2)
        textView.layer.cornerRadius = Constants.cornerRadiusSize
        textView.textColor = .white
        textView.font = UIFont.systemFont(ofSize: Constants.textFontSize)
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textView.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
        textView.autocorrectionType = .no

        setupTextViewConstraints()
    }
    
    private func setupTextViewConstraints() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(textView)
        
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 30),
            textView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 50),
            textView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant:  -30),
            textView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc func tapDone(sender: Any) {
           self.view.endEditing(true)
       }
    
    // MARK: Password Text Field
    private func setupPasswordTextField() {
        passwordTextField.backgroundColor = UIColor(white: 1, alpha: 0.2)
        passwordTextField.layer.cornerRadius = Constants.cornerRadiusSize
        passwordTextField.textColor = .white
        passwordTextField.font = UIFont.systemFont(ofSize: Constants.textFontSize)
        passwordTextField.isSecureTextEntry = true
        addPasswordTextFieldPadding()
        passwordTextField.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
        passwordTextField.clearButtonMode = .whileEditing
        
        setupPasswordTextFieldConstraints()
    }
    
    private func setupPasswordTextFieldConstraints() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant:  -30),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func addPasswordTextFieldPadding() {
       let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        passwordTextField.leftView = paddingView
        passwordTextField.leftViewMode = .always
    }
    
    // MARK: Save Button
    private func setupSaveButton() {
        saveButton.setTitle("     Save     ", for: .normal)
        saveButton.backgroundColor = UIColor(white: 1, alpha: 0.2)
        saveButton.layer.cornerRadius = Constants.cornerRadiusSize
        saveButton.setTitleColor(.systemGray6, for: .normal)
        saveButton.setTitleColor(.systemGray4, for: .highlighted)
        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: Constants.buttonFontSize)
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        
        stackView.addArrangedSubview(saveButton)
    }
    
    @objc private func saveButtonPressed(_ sender: UIButton) {
        presenter?.saveButtonPressed()
    }
    
    // MARK: Read Button
    private func setupReadButton() {
        readButton.setTitle("     Read     ", for: .normal)
        readButton.backgroundColor = UIColor(white: 1, alpha: 0.2)
        readButton.layer.cornerRadius = Constants.cornerRadiusSize
        readButton.setTitleColor(.systemGray6, for: .normal)
        readButton.setTitleColor(.systemGray4, for: .highlighted)
        readButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: Constants.buttonFontSize)
        readButton.addTarget(self, action: #selector(readButtonPressed), for: .touchUpInside)
        
        stackView.addArrangedSubview(readButton)
    }
    
    @objc private func readButtonPressed(_ sender: UIButton) {
        presenter?.readButtonPressed()
    }
    
    // MARK: Spacer View
    private func setupSpacerView() {
        spacerView.numberOfLines = 0
        spacerView.text = """
        
        
        
        
        
        
        
        """
        spacerView.textColor = .white
        spacerView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        stackView.addArrangedSubview(spacerView)
    }
    
    // MARK: TapGesture Recognizer to dismiss keyboard
    private func setupDismissKeyboardGestureRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func dismissKeyboard(_ recognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // MARK: Keyboard notifications
    private func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShown(_:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShown(_ notificiation: NSNotification) {
        stackView.distribution = .fillProportionally
    }
    
    @objc func keyboardWillBeHidden(_ notification: NSNotification) {
        stackView.distribution = .equalSpacing
    }
    
    // MARK: Deinit
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
