//
//  ArbuzRowCell.swift
//  Arbuz.kz
//
//  Created by Zhanagul on 29.05.2022.
//

import UIKit

protocol ArbuzRowCellDelegate: AnyObject {
    func onArbuzDidSelected(with model: ArbuzModel)
}

final class ArbuzRowCell: UITableViewCell {
    
    weak var delegate: ArbuzRowCellDelegate?
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let identifier = String(describing: ArbuzItemCell.self)
    private var models: [ArbuzModel] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    func configure(with models: [ArbuzModel]) {
        self.models = models
    }
}

// MARK: - UICollectionViewDataSource

extension ArbuzRowCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedArbuz = models[indexPath.row]
        delegate?.onArbuzDidSelected(with: selectedArbuz)
    }
}

// MARK: - UICollectionViewDataSource

extension ArbuzRowCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ArbuzItemCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
}


// MARK: - Private Extension

private extension ArbuzRowCell {
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: identifier, bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
    }
}
