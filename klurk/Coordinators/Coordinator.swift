//
//  Coordinator.swift
//  klurk
//
//  Created by Myron Dulay on 3/12/21.
//

import UIKit

protocol Coordinator {
	var childCoordinators: [Coordinator] { get set }
	var navigationController: UINavigationController { get set }
	
	func start() 
}
