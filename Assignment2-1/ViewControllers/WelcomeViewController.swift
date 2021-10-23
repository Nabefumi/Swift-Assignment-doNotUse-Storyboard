//
//  WelcomeViewController.swift
//  Assignment2-1
//
//  Created by Takafumi Watanabe on 2021-10-21.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    lazy var imageView: BaseUIImageView = {
        let iv = BaseUIImageView()
        iv.image = UIImage(named: "logo")
        iv.backgroundColor = UIColor.green
        return iv
    }()
    
    lazy var titleLabel: BaseUILabel = {
       let label = BaseUILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Plan your trips"
        return label
    }()
    
    lazy var descriptionLabel: BaseUILabel = {
       let label = BaseUILabel()
        label.text = "For the best trip, simply specify your plan."
        return label
    }()
    
    lazy var labelsStack: VStack = {
       let stack = VStack()
        stack.axis = .vertical
        stack.spacing = 20
        
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(descriptionLabel)

        return stack
    }()
    
    lazy var loginButton: BaceUIButtton = {
        let button = BaceUIButtton()
        button.setTitle("LOGIN", for: .normal)
        button.backgroundColor = UIColor.green
        button.layer.cornerRadius = 20
//        button.addTarget(self, action: #selector(loginTapped), for: touchUpInside)
        return button
    }()
    
    lazy var signUPButton: BaceUIButtton = {
        let button = BaceUIButtton()
        button.setTitle("SIGN UP", for: .normal)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 20
//        button.addTarget(self, action: #selector(SignUpTapped), for: <#T##UIControl.Event#>)
        return button
    }()
    
    lazy var buttonsStack: VStack = {
        let stack = VStack()
        stack.spacing = 20
        stack.addArrangedSubview(loginButton)
        stack.addArrangedSubview(signUPButton)
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red
        title = "Welcome"
        navigationController?.navigationBar.backgroundColor = UIColor.blue
        
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        view.addSubview(labelsStack)
        NSLayoutConstraint.activate([
            labelsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelsStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        view.addSubview(buttonsStack)
        NSLayoutConstraint.activate([
            buttonsStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            buttonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func signUpTapped() {        
        let signUpViewController = SignUpViewController()
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    @objc func loginTapped() {
        let loginViewController = LoginViewController()
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
}
