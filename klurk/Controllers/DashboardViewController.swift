//
//  DashboardViewController.swift
//  klurk
//
//  Created by Myron Dulay on 3/13/21.
//

import UIKit

final class DashboardViewController: UIViewController {
	
	var didSendEventClosure: ((DashboardViewController.Event) -> ())?
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .yellow
	}
}

extension DashboardViewController {
	enum Event {
		case dashboard
	}
}
