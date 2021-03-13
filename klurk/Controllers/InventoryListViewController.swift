//
//  InventoryListViewController.swift
//  klurk
//
//  Created by Myron Dulay on 3/10/21.
//

import UIKit

final class InvetoryListViewController: UIViewController {
	
	var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.translatesAutoresizingMaskIntoConstraints = false
		cv.register(InventoryCell.self, forCellWithReuseIdentifier: "cell")
		return cv
	}()
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		configureCollectionView()
	}
	
	private func configureCollectionView() {
		collectionView.delegate = self
		collectionView.dataSource = self
		view.addSubview(collectionView)
		setupCollectionViewConstraints()
	}
	
	private func setupCollectionViewConstraints() {
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
		collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
		collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
	}
}

// MARK: - UICollectionView Delegates

extension InvetoryListViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 20
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? InventoryCell else {
			fatalError("failed to load collection cell")
		}
		
		cell.backgroundColor = .red
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width / 7, height: collectionView.frame.height / 4)
	}
}


