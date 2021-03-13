//
//  SettingsViewController.swift
//  klurk
//
//  Created by Myron Dulay on 3/13/21.
//

import UIKit

final class SettingsViewController: UIViewController {
	
	var didSendEventClosure: ((SettingsViewController.Event) -> Void)?
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .green
	}
}

extension SettingsViewController {
	enum Event {
		case settings
	}
}
