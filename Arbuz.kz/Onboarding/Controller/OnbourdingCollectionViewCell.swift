//
//  OnbourdingCollectionViewCell.swift
//  Arbuz.kz
//
//  Created by Zhanagul on 28.05.2022.
//

import UIKit

class OnbourdingCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: OnbourdingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitle: UILabel!
    @IBOutlet weak var slideDescription: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitle.text = slide.title
        slideDescription.text = slide.description
    }
}
