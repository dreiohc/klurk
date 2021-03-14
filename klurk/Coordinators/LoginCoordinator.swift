//
//  LoginCoordinator.swift
//  klurk
//
//  Created by Myron Dulay on 3/13/21.
//

import UIKit

protocol LoginCoordinatorProtocol: Coordinator {
	func showLoginViewController()
}

class LoginCoordinator: LoginCoordinatorProtocol {
	
	weak var finishDelegate: CoordinatorFinishDelegate?
	
	var navigationController: UINavigationController
	
	var childCoordinators: [Coordinator] = []
	
	var type: CoordinatorType = .login
	
	required init(_ navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		showLoginViewController()
	}
	
	private func showSignUpPage() {
		let signUpVC: SignUpViewController = SignUpViewController()
		navigationController.pushViewController(signUpVC, animated: true)
	}
	
	deinit {
		print("LoginCoordinator deinit")
	}
	
	func showLoginViewController() {
		let loginVC: LoginViewController = LoginViewController()
		loginVC.didSendEventClosure = { [weak self] event in
			switch event {
			case .signUp:
				self?.type = .signUp
				self?.finish()
			default:
				self?.finish()
				
			}
		}
		navigationController.pushViewController(loginVC, animated: true)
	}
}
