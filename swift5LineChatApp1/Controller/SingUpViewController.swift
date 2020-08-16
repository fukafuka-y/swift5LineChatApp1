//
//  SingUpViewController.swift
//  swift5LineChatApp1
//
//  Created by 深谷祐斗 on 2020/08/16.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class SingUpViewController:UIViewController{
    
    
    @IBOutlet weak var userImageView: UIButton!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var alreadyHaveAccountButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userImageView.layer.cornerRadius = 85
        userImageView.layer.borderWidth = 1
        userImageView.layer.backgroundColor = UIColor.rgb(red: 240, green: 240, blue: 240).cgColor
        registerButton.layer.cornerRadius = 15
        
    }
    
    
    @IBAction func register(_ sender: Any) {
        
    }
    
    
    @IBAction func userTapped(_ sender: Any) {
        
    }
    
}

