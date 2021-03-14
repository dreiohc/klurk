//
//  AppCoordinator.swift
//  klurk
//
//  Created by Myron Dulay on 3/13/21.
//

import UIKit

// Define what type of flows can be started from this Coordinator
protocol AppCoordinatorProtocol: Coordinator {
	func showLoginPage()
	func showMyStorePage()
	func showSignUpPage()
}

// App coordinator is the only one coordinator which will exist during app's life cycle
class AppCoordinator: AppCoordinatorProtocol {
	
	weak var finishDelegate: CoordinatorFinishDelegate? = nil
	
	var navigationController: UINavigationController
	
	var childCoordinators = [Coordinator]()
	
	var type: CoordinatorType = ._default
	
	required init(_ navigationController: UINavigationController) {
		self.navigationController = navigationController
		navigationController.setNavigationBarHidden(true, animated: true)
	}
	
	func start() {
		showLoginPage()
	}
	
	func showLoginPage() {
		let loginCoordinator = LoginCoordinator.init(navigationController)
		loginCoordinator.finishDelegate = self
		loginCoordinator.start()
		childCoordinators.append(loginCoordinator)
	}
	
	func showSignUpPage() {
		let signUpCoordinator = SignUpCoordinator.init(navigationController)
		signUpCoordinator.finishDelegate = self
		signUpCoordinator.start()
		childCoordinators.append(signUpCoordinator)
	}
	
	func showMyStorePage() {
		let tabCoordinator = TabCoordinator.init(navigationController)
		tabCoordinator.finishDelegate = self
		tabCoordinator.start()
		childCoordinators.append(tabCoordinator)
	}
}



extension AppCoordinator: CoordinatorFinishDelegate {
	func coordinatorDidFinish(childCoordinator: Coordinator) {
		childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
		
		switch childCoordinator.type {
		case .login:
			navigationController.viewControllers.removeAll()
			showLoginPage()
		case .mystore:
			navigationController.viewControllers.removeAll()
			showMyStorePage()
		case .signUp:
			navigationController.viewControllers.removeAll()
			showSignUpPage()
		default:
			break
		}
	}
	
}

