//
//  SignUpViewController.swift
//  klurk
//
//  Created by Myron Dulay on 3/12/21.
//

import UIKit

class SignUpViewController: UIViewController {
	
	var didSendEventClosure: ((SignUpViewController.Event) -> Void)?
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .blue
	}
	
}
extension SignUpViewController {
	enum Event {
		case ready
	}
}

