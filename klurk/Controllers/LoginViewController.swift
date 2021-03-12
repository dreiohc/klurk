//
//  LoginViewController.swift
//  klurk
//
//  Created by Myron Dulay on 3/12/21.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded {
	
	weak var coordinator: MainCoordinator?
	
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
		signUpButton.addTarget(self, action: #selector(goToSignUpPage), for: .touchUpInside)
		
		let loginButton = LoginButton()
		loginButton.setTitle("LOGIN", for: .normal)
		loginButton.addTarget(self, action: #selector(goToLoginPage), for: .touchUpInside)
		
		stackView.addArrangedSubview(signUpButton)
		stackView.addArrangedSubview(loginButton)
	}
	
	@objc private func goToSignUpPage() {
		
	}
	
	@objc private func goToLoginPage() {
		
	}
	
	func setStackViewConstraints() {
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
		stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
		stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
		stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 30).isActive = true
	}
	
	// MARK: - Configure TitleLabel
	func configureTitleLabel() {
		view.addSubview(titleLabel)
		titleLabel.text	= "Login Page"
		titleLabel.font	= UIFont.boldSystemFont(ofSize: 36)
		titleLabel.textAlignment =	.center
		titleLabel.numberOfLines = 0
		titleLabel.adjustsFontSizeToFitWidth = true
		setTitleLabelConstraints()
	}
	
	func setTitleLabelConstraints() {
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
		titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
		titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true

	}
	
	
}
