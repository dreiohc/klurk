//
//  TabBarPage.swift
//  klurk
//
//  Created by Myron Dulay on 3/13/21.
//

enum TabBarPage {
		case dashboard
		case myStore
		case settings

		init?(index: Int) {
				switch index {
				case 0:
						self = .dashboard
				case 1:
						self = .myStore
				case 2:
						self = .settings
				default:
						return nil
				}
		}
		
		func pageTitleValue() -> String {
				switch self {
				case .dashboard:
						return "Dashboard"
				case .myStore:
						return "My Store"
				case .settings:
						return "Settings"
				}
		}

		func pageOrderNumber() -> Int {
				switch self {
				case .dashboard:
						return 0
				case .myStore:
						return 1
				case .settings:
						return 2
				}
		}

		// Add tab icon value
		
		// Add tab icon selected / deselected color
		
		// etc
}
