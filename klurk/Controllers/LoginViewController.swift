//
//  LoginViewController.swift
//  klurk
//
//  Created by Myron Dulay on 3/12/21.
//

import UIKit

class LoginViewController: UIViewController {
	
	var didSendEventClosure: ((LoginViewController.Event) -> Void)?
	
	private var stackView = UIStackView()
	private var titleLabel = UILabel()
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		configureTitleLabel()
		configureStackView()
	}
	
	
	// MARK: - Configure StackView
	
	func configureStackView() {
		view.addSubview(stackView)
		stackView.axis = .vertical
		stackView.distribution = .fillEqually
		stackView.spacing = 20
		addButtonsToStackView()
		setStackViewConstraints()
	}
	
	func addButtonsToStackView() {
		let signUpButton = LoginButton()
		signUpButton.setTitle("SIGN UP", for: .normal)
		signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
		
		let loginButton = LoginButton()
		loginButton.setTitle("LOGIN", for: .normal)
		loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
		
		stackView.addArrangedSubview(signUpButton)
		stackView.addArrangedSubview(loginButton)
	}
	
	@objc private func signUpButtonTapped() {
		didSendEventClosure?(.signUp)
	}
	
	@objc private func loginButtonTapped() {
		didSendEventClosure?(.login)
	}
	
	func setStackViewConstraints() {
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
		stackView.widthAnchor.constraint(equalToConstant: 250).isActive = true
		stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40).isActive = true
	}
	
	// MARK: - Configure TitleLabel
	
	func configureTitleLabel() {
		view.addSubview(titleLabel)
		titleLabel.text	= "Welcome to klurk"
		titleLabel.textColor = .label
		titleLabel.font	= UIFont.boldSystemFont(ofSize: 50)
		titleLabel.textAlignment =	.center
		titleLabel.numberOfLines = 0
		titleLabel.adjustsFontSizeToFitWidth = true
		setTitleLabelConstraints()
	}
	
	func setTitleLabelConstraints() {
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -150).isActive = true
		titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
		titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
	}
	
	
}

extension LoginViewController {
	enum Event {
		case login
		case signUp
	}
}
