//
//  SingUpViewController.swift
//  swift5LineChatApp1
//
//  Created by 深谷祐斗 on 2020/08/16.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

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
        registerButton.isEnabled = false
        registerButton.backgroundColor = UIColor.rgb(red: 100, green: 100, blue: 100)
        
        
        userImageView.addTarget(self, action: #selector(tapImageView), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(tapRegisterButton), for: .touchUpInside)
        alreadyHaveAccountButton.addTarget(self, action: #selector(tapalreadyHaveAccountButton), for: .touchUpInside)
        
        mailTextField.delegate = self
        passwordTextField.delegate = self
        usernameTextField.delegate = self
    }
    
    @objc private func tapRegisterButton(){
        guard let email = mailTextField.text else{return}
        guard let password = passwordTextField.text else{return}
        
        Auth.auth().createUser(withEmail: email, password: password) { (res, err) in
            if let err = err{
                print("Authの情報の取得に失敗しました。\(err)")
                return
            }
            print("Authの情報を保存しました")


        guard let uid = res?.user.uid else {return}
        guard let username = self.usernameTextField.text else {return}
        let docData = [
            "email":email,
            "username":username,
            "createdAt":Timestamp()
            ] as [String : Any]
            
            
            Firestore.firestore().collection("user").document(uid).setData(docData) { (err) in
                if let err = err{
                    print("データの保存に失敗しました:\(err)")
                    return
                }
            print("Firestoreへの情報の保存が成功しました")
            self.dismiss(animated: true, completion: nil)
            }
            
        
     }
    }
    @objc private func tapalreadyHaveAccountButton(){
    
    }
  
    @objc private func tapImageView(){
        print("tapImage")
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        self.present(imagePickerController, animated: true, completion: nil)
    
    }
    
    
    
    @IBAction func register(_ sender: Any) {
        print("register")
    }
    
    
    @IBAction func userTapped(_ sender: Any) {
        print("tapUser")
    }
    
}

extension SingUpViewController:UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {

        let mailIsEmpty = mailTextField.text?.isEmpty ?? false
        let passwordISEmpty = passwordTextField.text?.isEmpty ?? false
        let usernameIsEmpty = usernameTextField.text?.isEmpty ?? false
        
        if mailIsEmpty || passwordISEmpty || usernameIsEmpty{
            registerButton.isEnabled = false
            registerButton.backgroundColor = UIColor.rgb(red: 100, green: 100, blue: 100)
        }else{
            registerButton.isEnabled = true
            registerButton.backgroundColor = UIColor.rgb(red: 0, green: 180, blue: 0)
        }
        
        
        
    }
    
}

extension SingUpViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editImage = info[.editedImage] as? UIImage {
            userImageView.setImage(editImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }else if let originalImage = info[.originalImage] as? UIImage{
            userImageView.setImage(originalImage.withRenderingMode(.alwaysOriginal), for: .normal)
    }
        userImageView.setTitle("", for: .normal)
        userImageView.imageView?.contentMode = .scaleToFill
        userImageView.contentHorizontalAlignment = .fill
        userImageView.contentVerticalAlignment = .fill
        userImageView.clipsToBounds = true
        
        dismiss(animated: true, completion: nil)
 }
}
