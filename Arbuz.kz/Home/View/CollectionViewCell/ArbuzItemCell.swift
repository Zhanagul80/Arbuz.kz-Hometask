//
//  ArbuzItemCell.swift
//  Arbuz.kz
//
//  Created by Zhanagul on 29.05.2022.
//

import UIKit

final class ArbuzItemCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet weak var arbuzButton: UIButton!
    
    
    func configure(with model: ArbuzModel) {
        var arbuzImage = #imageLiteral(resourceName: "blue")
        
        switch model.status {
        case .ripe:
            arbuzImage = #imageLiteral(resourceName: "ripe")
        case .unripe:
            arbuzImage = #imageLiteral(resourceName: "unripe")
        case .alreadyTaken:
            arbuzImage = #imageLiteral(resourceName: "alreadyTaken")
        }
        imageView.image = arbuzImage
    }
    
    
}
