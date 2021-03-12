//
//  MainCoordinator.swift
//  klurk
//
//  Created by Myron Dulay on 3/12/21.
//

import UIKit

class MainCoordinator: Coordinator {

	var childCoordinators = [Coordinator]()
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
//	func start() {
//		let vc = MyStoreViewController.instantiate()
//		vc.coordinator = self
//		navigationController.pushViewController(vc, animated: false)
//	}
	
	func start() {
		let vc = LoginViewController.instantiate()
		vc.coordinator = self
		navigationController.pushViewController(vc, animated: false)
	}
	
	func showInventoryList() {
		let vc = MyStoreViewController.instantiate()
		vc.coordinator = self
		navigationController.pushViewController(vc, animated: false)
	}
	
	
	
}

