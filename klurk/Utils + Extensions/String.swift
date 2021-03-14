//
//  String.swift
//  klurk
//
//  Created by Myron Dulay on 3/15/21.
//

extension String {
	
	func addCurrencySymbol(_ currency: Currency) -> String {
		let php = "₱"
		let dollar = "$"
		switch currency {
		case .php:
			return "\(php)\(self)"
		case .dollar:
			return "\(dollar)\(self)"
		}
	}
	
}
