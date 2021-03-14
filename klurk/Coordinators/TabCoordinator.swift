//
//  TabCoordinator.swift
//  klurk
//
//  Created by Myron Dulay on 3/13/21.
//

import UIKit

protocol TabCoordinatorProtocol: Coordinator {
	var tabBarController: UITabBarController { get set }
	
	func selectPage(_ page: TabBarPage)
	
	func setSelectedIndex(_ index: Int)
	
	func currentPage() -> TabBarPage?
}

class TabCoordinator: NSObject, Coordinator {
	weak var finishDelegate: CoordinatorFinishDelegate?
	
	var childCoordinators: [Coordinator] = []
	
	var navigationController: UINavigationController
	
	var tabBarController: UITabBarController
	
	var type: CoordinatorType = .tab
	
	required init(_ navigationController: UINavigationController) {
		self.navigationController = navigationController
		self.tabBarController = .init()
	}
	
	func start() {
		// Define which pages to add into tab bar
		let pages: [TabBarPage] = [.dashboard, .myStore, .settings]
			.sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
		
		// Initialization of ViewControllers or these pages
		let controllers: [UINavigationController] = pages.map({ getTabController($0) })
		
		prepareTabBarController(withTabControllers: controllers)
	}
	
	deinit {
		print("TabCoordinator deinit")
	}
	
	private func getTabController(_ page: TabBarPage) -> UINavigationController {
		let navController = UINavigationController()
		navController.setNavigationBarHidden(false, animated: false)
		
		navController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(),
																								 image: nil,
																								 tag: page.pageOrderNumber())
		
		switch page {
		case .dashboard:
			// If needed: Each tab bar flow can have it's own Coordinator.
			let dashboardVC = DashboardViewController()
			dashboardVC.didSendEventClosure = { [weak self] event in
				switch event {
				case .dashboard:
					self?.selectPage(.dashboard)
				}
			}
			
			navController.pushViewController(dashboardVC, animated: true)
		case .myStore:
			let steadyVC = MyStoreViewController()
			steadyVC.didSendEventClosure = { [weak self] event in
				switch event {
				case .ready:
					self?.selectPage(.myStore)
				}
			}
			
			navController.pushViewController(steadyVC, animated: true)
		case .settings:
			let goVC = SettingsViewController()
			goVC.didSendEventClosure = { [weak self] event in
				switch event {
				case .settings:
					self?.type = .login
					self?.finish()
				}
			}
			
			navController.pushViewController(goVC, animated: true)
		}
		
		return navController
	}
	
	
	private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
		/// Set delegate for UITabBarController
		tabBarController.delegate = self
		/// Assign page's controllers
		tabBarController.setViewControllers(tabControllers, animated: true)
		/// Let set index
		tabBarController.selectedIndex = TabBarPage.myStore.pageOrderNumber()
		/// Styling
		tabBarController.tabBar.isTranslucent = false
		
		/// Attach tabBarController to navigation controller associated with this coordinator
		navigationController.viewControllers = [tabBarController]
	}
	
	
	
	func currentPage() -> TabBarPage? { TabBarPage.init(index: tabBarController.selectedIndex) }
	
	func selectPage(_ page: TabBarPage) {
		tabBarController.selectedIndex = page.pageOrderNumber()
	}
	
	func setSelectedIndex(_ index: Int) {
		guard let page = TabBarPage.init(index: index) else { return }
		
		tabBarController.selectedIndex = page.pageOrderNumber()
	}
}

// MARK: - UITabBarControllerDelegate
extension TabCoordinator: UITabBarControllerDelegate {
	func tabBarController(_ tabBarController: UITabBarController,
												didSelect viewController: UIViewController) {
	}
}
