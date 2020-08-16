//
//  User.swift
//  swift5LineChatApp1
//
//  Created by 深谷祐斗 on 2020/08/16.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class User {
    let email:String
    let username:String
    let createdAt:Timestamp
    let profileImageUrl:String
    
    init(dic:[String:Any]) {
        
        self.email = dic["email"] as? String ?? ""
        self.username = dic["username"] as? String ?? ""
        self.createdAt = dic["createdAt"] as? Timestamp ?? Timestamp()
        self.profileImageUrl = dic["profileImageUrl"] as? String ?? ""
    }
    
    
}
