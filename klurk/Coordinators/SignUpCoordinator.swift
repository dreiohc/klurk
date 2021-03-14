//
//  SignUpCoordinator.swift
//  klurk
//
//  Created by Myron Dulay on 3/14/21.
//

import UIKit

protocol SignUpCoordinatorProtocol: Coordinator {
	func showSignUpViewController()
}

class SignUpCoordinator: SignUpCoordinatorProtocol {
	
	weak var finishDelegate: CoordinatorFinishDelegate?
	
	var navigationController: UINavigationController
	
	var childCoordinators: [Coordinator] = []
	
	var type: CoordinatorType = .signUp
	
	required init(_ navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		showSignUpViewController()
	}
	
	deinit {
		print("Signup Coordinator deinit")
	}
	
	func showSignUpViewController() {
		let signUpVC: SignUpViewController = SignUpViewController()
		signUpVC.didSendEventClosure = { [weak self] event in
			switch event {
			case .cancel:
				self?.type = .login
				self?.finish()
			case .signUp:
				self?.type = .mystore
				self?.finish()
			}
		}
		navigationController.pushViewController(signUpVC, animated: true)
	}
}
