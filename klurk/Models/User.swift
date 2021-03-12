//
//  User.swift
//  klurk
//
//  Created by Myron Dulay on 3/11/21.
//

import Foundation

struct User: Codable {
	
	let name: String
	let userID: String
	let storeName: String
	let storeType: StoreType
	let inventory: Inventory
	let latitude: Double?
	let longitude: Double?
	
	enum CodingKeys: String, CodingKey {
		case name
		case userID = "user_id"
		case storeName = "store_name"
		case storeType = "store_type"
		case inventory
		case latitude
		case longitude
	}
}
