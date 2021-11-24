//
//  AnimationViewController.swift
//  Assignment2-1
//
//  Created by Takafumi Watanabe on 2021-11-24.
//

import UIKit
import Lottie

class AnimationViewController: UIViewController {
    
    lazy var animationVIew: AnimationView = {
       let anim = AnimationView(name: "animation")
        anim.translatesAutoresizingMaskIntoConstraints = false
        anim.loopMode = .loop
        anim.contentMode = .scaleAspectFit
        return anim
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blue
        
        view.addSubview(animationVIew)
        NSLayoutConstraint.activate([
            animationVIew.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animationVIew.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animationVIew.topAnchor.constraint(equalTo: view.topAnchor),
            animationVIew.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        animationVIew.play()
    }
}
