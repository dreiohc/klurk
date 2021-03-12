//
//  InventoryCell.swift
//  klurk
//
//  Created by Myron Dulay on 3/10/21.
//

import UIKit

final class InventoryCell: UICollectionViewCell {
	
	var inventory: Inventory? {
		didSet {
			guard let inventory = inventory else { return }
			itemName.text = inventory.itemName
			itemPrice.text = inventory.itemPrice
		}
	}
	
	fileprivate let itemName: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .black
		return label
	}()
	
	fileprivate let itemPrice: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .black
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(itemName)
		contentView.addSubview(itemPrice)
		setupItemConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupItemConstraints() {
		itemName.translatesAutoresizingMaskIntoConstraints = false
		itemName.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
		itemName.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
		itemName.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: 20).isActive = true
		itemName.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
	}
}
