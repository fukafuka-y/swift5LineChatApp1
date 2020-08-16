//
//  UserListViewController.swift
//  swift5LineChatApp1
//
//  Created by 深谷祐斗 on 2020/08/16.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Nuke
import FirebaseAuth

class UserListViewController: UIViewController {
    
    @IBOutlet weak var userListTableView: UITableView!
    private var cellID = "userListCell"
    private var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchUserInfoFromFirestore()
        userListTableView.delegate = self
        userListTableView.dataSource = self
        
        
    }
    
    private func fetchUserInfoFromFirestore(){
        Firestore.firestore().collection("user").getDocuments { (snapshot, err) in
            if let err = err{
                print("user情報の取得に失敗しました:\(err)")
                return
            }
            snapshot?.documents.forEach({ (snapshot) in
                let dic = snapshot.data()
                let user = User.init(dic: dic)
                
                guard let uid = Auth.auth().currentUser?.uid else{return}
                if uid == snapshot.documentID{
                    return
                }
                
                self.users.append(user)
                self.userListTableView.reloadData()
              
                
            })
        }
    }
    
    
    
}

extension UserListViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userListTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! UserListCell
        cell.user = users[indexPath.row]
        return cell
    }
    
    
}

class UserListCell:UITableViewCell{
    
    var user:User?{
        didSet{
            userTextLabel.text = user?.username
            if let url = URL(string: user?.profileImageUrl ?? ""){
                Nuke.loadImage(with: url, into: userImageView)
            }
            
        }
    }
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userTextLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImageView.layer.cornerRadius = 25
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}
