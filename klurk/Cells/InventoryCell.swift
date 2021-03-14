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
		let label = ItemDetailsLabel()
		label.font = .systemFont(ofSize: 20, weight: .bold)
		return label
	}()
	
	fileprivate let itemPrice: UILabel = {
		let label = ItemDetailsLabel()
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(itemName)
		contentView.addSubview(itemPrice)
		setupItemNameConstraints()
		setupItemPriceConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupItemNameConstraints() {
		itemName.translatesAutoresizingMaskIntoConstraints = false
		itemName.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
		itemName.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
		itemName.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
	}
	
	private func setupItemPriceConstraints() {
		itemPrice.translatesAutoresizingMaskIntoConstraints = false
		itemPrice.topAnchor.constraint(equalTo: itemName.bottomAnchor, constant: 5).isActive = true
		itemPrice.heightAnchor.constraint(equalToConstant: 20).isActive = true
		itemPrice.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
		itemPrice.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
	}
	
}
