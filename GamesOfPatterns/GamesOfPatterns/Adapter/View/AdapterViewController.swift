//
//  AdapterViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 02.10.2023.
//

import UIKit

final class AdapterViewController: UIViewController {
    
    // MARK: - Constants
    private enum Constants {
        static let stackBackgroundColor = UIColor(white: 0, alpha: 0.6)
        static let labelBackgroundColor = UIColor(white: 0, alpha: 0.8)
        static let cornerRadius: CGFloat = 10
        static let stackOuterSpacing: CGFloat = 50
        static let labelInsets: CGFloat = 50
        static let regularLabelInsets: CGFloat = 200
        static let buttonFont: CGFloat = 30
        static let labelFont: CGFloat = 40
        static let questionFont: CGFloat = 30
    }
    
    var presenter: AdapterPresenter?
    
    let backgroundView = UIImageView(frame: .zero)
    let labelsStack = UIStackView(frame: .zero)
    let buttonsStack = UIStackView(frame: .zero)
    let scoreLabel = UILabel(frame: .zero)
    let numberLabel = UILabel(frame: .zero)
    let questionLabel = UILabel(frame: .zero)
    let yesButton = UIButton(frame: .zero)
    let noButton = UIButton(frame: .zero)
    
    override func viewDidLoad() {
        title = PatternsNames.Adapter.rawValue
        
        presenter = AdapterPresenter(viewController: self)
        
        setupScreen()
        setQuestion()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if traitCollection.userInterfaceIdiom == .phone {
            backgroundView.image = ImagesProvider.btmBackground
        } else {
            backgroundView.image = ImagesProvider.btmIPADBackground
        }
        
        if traitCollection.verticalSizeClass == .regular {
            setupLabelsAndButtonsForSizeClass(insetsSize: Constants.labelInsets, color: .green)
        } else {
            setupLabelsAndButtonsForSizeClass(insetsSize: Constants.regularLabelInsets, color: .yellow)
        }
        
    }
    
    private func setupScreen() {
        setupBackgroundView()
        setupLabelsStack()
        setupMessageLabel()
        setupNumberLabel()
        setupQuestionLabel()
        setupButtonsStack()
        setupYesButton()
        setupNoButton()
    }
    
    // MARK: Background
    private func setupBackgroundView() {
        backgroundView.image = ImagesProvider.btmBackground
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
    
    // MARK: Labels Stack
    private func setupLabelsStack() {
        labelsStack.axis = .horizontal
        labelsStack.alignment = .center
        labelsStack.distribution = .fillProportionally
        labelsStack.spacing = 20
        labelsStack.backgroundColor = Constants.stackBackgroundColor
        labelsStack.layer.cornerRadius = Constants.cornerRadius
        
        labelsStack.layoutMargins = UIEdgeInsets(top: 0,
                                                 left: Constants.labelInsets,
                                                 bottom: 0,
                                                 right: Constants.labelInsets)
        labelsStack.isLayoutMarginsRelativeArrangement = true
        
        setupLabelStackConstraints()
    }
    
    private func setupLabelStackConstraints() {
        labelsStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelsStack)
        
        NSLayoutConstraint.activate([
            labelsStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                 constant: Constants.stackOuterSpacing),
            labelsStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                             constant: Constants.stackOuterSpacing),
            labelsStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                  constant: -Constants.stackOuterSpacing),
            labelsStack.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    // MARK: Score Label
    private func setupMessageLabel() {
        scoreLabel.text = "Score: "
        scoreLabel.textColor = .green
        scoreLabel.font = UIFont.boldSystemFont(ofSize: Constants.labelFont)
        labelsStack.addArrangedSubview(scoreLabel)
    }
    
    // MARK: Number Label
    private func setupNumberLabel() {
        numberLabel.text = "0"
        numberLabel.textColor = .green
        numberLabel.font = UIFont.boldSystemFont(ofSize: Constants.labelFont)
        labelsStack.addArrangedSubview(numberLabel)
    }
    
    // MARK: Question Label
    private func setupQuestionLabel() {
        questionLabel.text = " Question "
        questionLabel.textColor = .green
        questionLabel.textAlignment = .center
        questionLabel.backgroundColor = Constants.labelBackgroundColor
        questionLabel.font = UIFont.boldSystemFont(ofSize: Constants.questionFont)
        questionLabel.numberOfLines = 0
        questionLabel.layer.cornerRadius = Constants.cornerRadius
        questionLabel.clipsToBounds = true
        
        setupQuestionLabelConstraints()
    }
    
    private func setupQuestionLabelConstraints() {
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(questionLabel)
        
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: labelsStack.bottomAnchor,
                                               constant: Constants.stackOuterSpacing),
            questionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                   constant: Constants.stackOuterSpacing),
            questionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                    constant: -Constants.stackOuterSpacing),
        ])
    }
    
    // MARK: Buttons Stack
    private func setupButtonsStack() {
        buttonsStack.axis = .horizontal
        buttonsStack.alignment = .center
        buttonsStack.distribution = .fillProportionally//.equalSpacing
        buttonsStack.spacing = 20
        buttonsStack.backgroundColor = Constants.stackBackgroundColor
        buttonsStack.layer.cornerRadius = Constants.cornerRadius
        
        buttonsStack.layoutMargins = UIEdgeInsets(top: 0,
                                                  left: Constants.labelInsets,
                                                  bottom: 0,
                                                  right: Constants.labelInsets)
        buttonsStack.isLayoutMarginsRelativeArrangement = true
        
        setupButtonsStackConstraints()
    }
    
    private func setupButtonsStackConstraints() {
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsStack)
        
        NSLayoutConstraint.activate([
            buttonsStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                  constant: Constants.stackOuterSpacing),
            buttonsStack.topAnchor.constraint(equalTo: questionLabel.bottomAnchor,
                                              constant: Constants.stackOuterSpacing),
            buttonsStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                   constant: -Constants.stackOuterSpacing),
            buttonsStack.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    // MARK: YES Button
    private func setupYesButton() {
        yesButton.setTitle(" YES ", for: .normal)
        yesButton.setTitleColor(.green, for: .normal)
        yesButton.setTitleColor(.systemGreen, for: .highlighted)
        yesButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: Constants.buttonFont)
        yesButton.addTarget(self, action: #selector(yesButtonPressed), for: .touchUpInside)
        yesButton.tag = 1
        
        buttonsStack.addArrangedSubview(yesButton)
    }
    
    @objc private func yesButtonPressed(_ sender: UIButton) {
        presenter?.handleAnswer(sender)
    }
    
    // MARK: NO Button
    private func setupNoButton() {
        noButton.setTitle(" NO ", for: .normal)
        noButton.setTitleColor(.green, for: .normal)
        noButton.setTitleColor(.systemGreen, for: .highlighted)
        noButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: Constants.buttonFont)
        noButton.addTarget(self, action: #selector(noButtonPressed), for: .touchUpInside)
        noButton.tag = 0
        
        buttonsStack.addArrangedSubview(noButton)
    }
    
    @objc private func noButtonPressed(_ sender: UIButton) {
        presenter?.handleAnswer(sender)
    }
    
    // MARK: - Handle Size Clases
    private func setupLabelsAndButtonsForSizeClass(insetsSize: CGFloat, color: UIColor) {
        labelsStack.layoutMargins = UIEdgeInsets(top: 0,
                                                 left: insetsSize,
                                                 bottom: 0,
                                                 right: insetsSize)
        
        scoreLabel.textColor = color
        numberLabel.textColor = color
        questionLabel.textColor = color
        yesButton.setTitleColor(color, for: .normal)
        noButton.setTitleColor(color, for: .normal)
    }
    
    // MARK: - Presenter methods call
    private func setQuestion() {
        presenter?.setQuestion()
    }
    
    func setQuestionLabelText(_ text: String) {
        questionLabel.text = text
    }
}
