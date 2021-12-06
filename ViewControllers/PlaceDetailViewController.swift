//
//  PlaceDetailViewController.swift
//  Assignment2-1
//
//  Created by Takafumi Watanabe on 2021-11-22.
//

import UIKit
import ElementKit

class PlaceDetailViewController: UIViewController,
                                    UICollectionViewDelegate,
                                    UICollectionViewDataSource,
                                    UICollectionViewDelegateFlowLayout {
    
    let data = DataProvider.makePlacePhoto()
    
    lazy var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        cv.delegate = self
        cv.dataSource = self
        cv.translatesAutoresizingMaskIntoConstraints = true
        cv.showsHorizontalScrollIndicator = false
        cv.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return cv
    }()
    
    lazy var coverUIImageView: BaseUIImageView = {
        let iv = BaseUIImageView()
        iv.image = UIImage(named: "popularPlace")
        iv.heightAnchor.constraint(equalToConstant: 300).isActive = true
        return iv
    }()
    
    lazy var titleLabel: BaseUILabel = {
        let label = BaseUILabel()
        label.text = "Roberts Creek Park Tiny House"
        return label
    }()
    
    lazy var authorTitle: BaseUILabel = {
        let label = BaseUILabel()
        label.text = "Tiny house hosted by cory Lyne"
        return label
    }()

    lazy var authorImageView: BaseUIImageView = {
        let iv = BaseUIImageView()
        iv.image = UIImage(named: "author")
        iv.heightAnchor.constraint(equalToConstant: 60).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 60).isActive = true
        iv.layer.cornerRadius = 30
        return iv
    }()
    
    lazy var authorStack: HStack = {
        let stack = HStack()
        stack.addArrangedSubview(authorTitle)
        stack.addArrangedSubview(authorImageView)
        stack.spacing = 16
        return stack
    }()
    
    lazy var photoLabel: BaseUILabel = {
        let label = BaseUILabel()
        label.text = "Photo"
        return label
    }()
    
    lazy var viewAll: BaseUILabel = {
        let label = BaseUILabel()
        label.text = "View All"
        return label
    }()
    
    lazy var photoCollectionHeader: HStack = {
        let stack = HStack()
        stack.addArrangedSubview(authorTitle)
        stack.addArrangedSubview(authorImageView)
        stack.spacing = 16
        return stack
    }()
    
    lazy var infoStack: VStack = {
        let stack = VStack()
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(authorStack)
        stack.addArrangedSubview(photoCollectionHeader)
        stack.spacing = 32
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        return stack
    }()
    
    lazy var stack: VStack = {
        let stack = VStack()
        stack.addArrangedSubview(coverUIImageView)
        stack.addArrangedSubview(infoStack)
        stack.addArrangedSubview(collectionView)
        stack.spacing = 18
        return stack
    }()
    
    lazy var scrollView = VScrollableView(content: stack)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        title = "Detail"
        
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoCell
        cell.imageView.image = data[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
}
