//
//  PhotoCell.swift
//  Assignment2-1
//
//  Created by Takafumi Watanabe on 2021-11-23.
//

import UIKit
import ElementKit

class PhotoCell: UICollectionViewCell {
    
    lazy var imageView = BaseUIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        
        contentView.addSubview(imageView)
        imageView.frame = contentView.frame
    }
}
