//
//  FriendsCell.swift
//  Assignment2-1
//
//  Created by Takafumi Watanabe on 2021-10-22.
//

import UIKit

class FriendsCell: UITableViewCell {
    
    lazy var label: BaseUILabel = {
        let label = BaseUILabel()
        label.textColor = UIColor.red
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
//            label.leadingAnchor.constraint(equalTo: leadingAnchor),
//            label.trailingAnchor.constraint(equalTo: trailingAnchor),
//            label.topAnchor.constraint(equalTo: topAnchor),
//            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        label.frame = contentView.frame
    }

}
