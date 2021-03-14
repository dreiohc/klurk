//
//  MyStoreViewController.swift
//  klurk
//
//  Created by Myron Dulay on 3/10/21.
//

import UIKit

final class MyStoreViewController: UIViewController {
	
	var didSendEventClosure: ((MyStoreViewController.Event) -> Void)?
	
	private let inventoryListViewController = InvetoryListViewController()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "My Store"
		configureInventoryListViewController()
	}
	
	func configureInventoryListViewController() {
		addChild(inventoryListViewController)
		view.addSubview(inventoryListViewController.view)
		inventoryListViewController.didMove(toParent: self)
		setInventoryListViewControllerConstraints()
//		let success = FirebaseWebService().add(User(name: "Myron Dulay", userID: "myron.dulay", storeName: "Edith Store", storeType: .sarisari, inventory: Inventory(inventoryID: "1234", itemName: "Suka", itemPrice: "30"), latitude: nil, longitude: nil))
//		print(success)
	}
	
	func setInventoryListViewControllerConstraints() {
		inventoryListViewController.view.translatesAutoresizingMaskIntoConstraints = false
		inventoryListViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
		inventoryListViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
		inventoryListViewController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
		inventoryListViewController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
	}
}

extension MyStoreViewController {
	enum Event {
		case ready
	}
}
