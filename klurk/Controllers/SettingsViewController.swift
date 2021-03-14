//
//  SettingsViewController.swift
//  klurk
//
//  Created by Myron Dulay on 3/13/21.
//

import UIKit

final class SettingsViewController: UIViewController {
	
	var didSendEventClosure: ((SettingsViewController.Event) -> Void)?
	private var button = LoginButton()
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "Settings"
		view.addSubview(button)
		addButton()
		configurebutton()
	}
	
	func addButton() {
		button.translatesAutoresizingMaskIntoConstraints = false
		button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
		button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
		button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
		button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
	}
	
	func configurebutton() {
		button.setTitle("logout", for: .normal)
		button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
	}
	
	@objc func buttonTapped() {
		didSendEventClosure?(.settings)
	}
	
}

extension SettingsViewController {
	enum Event {
		case settings
	}
}
