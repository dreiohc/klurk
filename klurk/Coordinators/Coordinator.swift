//
//  Coordinator.swift
//  klurk
//
//  Created by Myron Dulay on 3/12/21.
//

import UIKit

enum Event {
	case loginButtonTapped
}

protocol Coordinator: class {
	var finishDelegate: CoordinatorFinishDelegate? { get set }
	var navigationController: UINavigationController { get set }
	var type: CoordinatorType { get }
	var childCoordinators: [Coordinator] { get set }
	
	func start()
	func finish()
	
	init(_ navigationController: UINavigationController)
}


extension Coordinator {
	
	func finish() {
		childCoordinators.removeAll()
		finishDelegate?.coordinatorDidFinish(childCoordinator: self)
		print("finish na \(childCoordinators)")
	}
}

protocol CoordinatorFinishDelegate: class {
	func coordinatorDidFinish(childCoordinator: Coordinator)
}

enum CoordinatorType {
	case login, mystore, _default , tab
}
