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
    
        func checkDifferentScenarios() {
            let userJson = Serializer.rawUserJson()
            let arrayJson = Serializer.rawUserArrayJson()
    
            // #1
            if let user = Serializer.deserialize(jsonString: userJson) {
                print(user.firstName)
                print(user.lastName)
                print(user.country)
            }
    
            // #2
            let array = Serializer.deserializeArray(jsonString: arrayJson)
            print("count is \(array.count)")
            print(array[0].firstName)
            print(array[0].lastName)
            print(array[0].country)
    
            // #3
            let user = NewUser(firstName: "ALI", lastName: "DAEI", country: "IRAN")
            if let jsonValue = Serializer.serialize(user: user) {
                print(jsonValue)
            }
    
    
        }
        
        
    }
