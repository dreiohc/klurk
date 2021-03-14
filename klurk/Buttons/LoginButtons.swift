//
//  LoginButtons.swift
//  klurk
//
//  Created by Myron Dulay on 3/12/21.
//

import UIKit

class LoginButton: UIButton {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupButton()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupButton()
	}
	
	func setupButton() {
		setTitleColor(.white, for: .normal)
		backgroundColor = .systemBlue
		titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
		layer.cornerRadius = 10
	}
}
	
