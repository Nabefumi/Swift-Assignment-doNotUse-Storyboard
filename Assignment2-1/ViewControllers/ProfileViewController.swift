//
//  ProfileViewController.swift
//  Assignment2-1
//
//  Created by Takafumi Watanabe on 2021-10-26.
//

import UIKit

class ProfileViewController: UIViewController {
    
    lazy var friendsButton: BaceUIButtton = {
        let button = BaceUIButtton()
        button.setTitle("See Friends", for: .normal)
        button.addTarget(self, action: #selector(friendsTapped), for: .touchUpInside)
        button.backgroundColor = .red
        return button
        
    }()
    
    lazy var cpntentStack: VStack = {
        let stack = VStack()
        stack.addArrangedSubview(friendsButton)
        stack.alignment = .center
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        view.backgroundColor = UIColor.white
        
        view.addSubview(cpntentStack)
        
        NSLayoutConstraint.activate([
            cpntentStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cpntentStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
    }
    
    @objc func friendsTapped() {
        let friendVC = FriendsViewController()
        self.navigationController?.pushViewController(friendVC, animated: true)
    }

}
