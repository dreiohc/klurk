//
//  ItemLabel.swift
//  klurk
//
//  Created by Myron Dulay on 3/15/21.
//

import UIKit

class ItemDetailsLabel: UILabel {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupLabel()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupLabel()
	}
	
	func setupLabel() {
		translatesAutoresizingMaskIntoConstraints = false
		textAlignment = .center
		textColor = .white
		font = .systemFont(ofSize: 16, weight: .semibold)
		numberOfLines = 0
		lineBreakMode = .byWordWrapping
	}
}
	

