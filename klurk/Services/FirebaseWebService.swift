//
//  FirebaseWebService.swift
//  klurk
//
//  Created by Myron Dulay on 3/10/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class FirebaseWebService {
	
	private let firebaseDB = Firestore.firestore()
	
	init() { }
	
	
	func add(_ inventoryItem: User) -> Bool {
		do {
			let ref = try firebaseDB
				.collection(FirebaseCollection.inventoryCollection)
				.addDocument(from: inventoryItem)
			print("Add document succeeded with id = \(ref.documentID)")
		} catch let error {
			fatalError("Adding inventory item failed: \(error.localizedDescription)")
		}
		return true
	}
	
	func update(_ user: User) {
		firebaseDB
			.collection(FirebaseCollection.inventoryCollection)
			.whereField(FirebaseDBField.inventoryID, isEqualTo: user.inventory.inventoryID)
			.getDocuments { (snapshot, error) in
				if let error = error {
					fatalError("Document error: \(error.localizedDescription)")
				} else {  
					if let document = snapshot?.documents.first {
						do {
							try document.reference.setData(from: user)
						} catch let error {
							fatalError("Document read error: \(error.localizedDescription)")
						}
					}
				}
			}
		
	}
	
	func delete(_ id: String) {
		firebaseDB
			.collection(FirebaseCollection.inventoryCollection)
			.whereField(FirebaseDBField.inventoryID, isEqualTo: id)
			.getDocuments { (snapshot, error) in
				if let error = error {
					fatalError("Document delete error: \(error)")
				} else {
					if let document = snapshot?.documents.first {
						document.reference.delete { (error) in
							fatalError("Document delete error: \(error?.localizedDescription ?? "unknown error")")
						}
					}
				}
			}
	}
	
	func subscribe(completion: @escaping (User) -> Void) {
		firebaseDB.collection(FirebaseCollection.inventoryCollection)
			.addSnapshotListener { (snapshot, error) in
				guard let collection = snapshot else { return }
				collection.documentChanges.forEach { (change) in
					do {
						if change.type == .added, let item = try change.document.data(as: User.self) {
								completion(item)
						}
						
						if change.type == .modified, let item = try change.document.data(as: User.self) {
							completion(item)
						}
						
						if change.type == .removed, let item = try change.document.data(as: User.self) {
							completion(item)
						}
						
					} catch let error {
						fatalError("Fetch failure: \(error.localizedDescription)")
					}
				}
			}
	}

	
	
}
