//
//  Constants.swift
//  klurk
//
//  Created by Myron Dulay on 3/11/21.
//

import Foundation


// MARK: - Firebase

enum FirebaseDBField {
	static let inventoryID = "inventoryID"
}


enum FirebaseCollection {
	static let inventoryCollection = "inventory"
}


enum FirebaseError: Error {
	case addError
	case updateError
	case deleteError
	case fetchError
}


// MARK: - Store details

enum StoreType: String, Codable {
	case sarisari = "Sari-Sari / Convenient store"
	case restaurant = "Restaurant / Eatery / Diner"
	case hardware = "Hardware"
	case coffeeShope = "Coffee shop"
}
