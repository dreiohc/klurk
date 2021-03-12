//
//  Items.swift
//  klurk
//
//  Created by Myron Dulay on 3/10/21.
//

import Foundation

struct Inventory: Codable {
	
	let inventoryID: String
	let itemName: String
	let itemPrice: String
	
	enum CodingKeys: String, CodingKey {
		case inventoryID = "inventory_id"
		case itemName = "item_name"
		case itemPrice = "item_price"
	}
}
