//
//  ChatListViewController.swift
//  swift5LineChatApp1
//
//  Created by 深谷祐斗 on 2020/08/15.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

class ChatListViewController: UIViewController {
    
    @IBOutlet weak var chatListTableView: UITableView!
    
    private let cellID = "ChatListCell"
    private var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatListTableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
        
        chatListTableView.delegate = self
        chatListTableView.dataSource = self

        navigationController?.navigationBar.barTintColor = .rgb(red: 39, green: 49, blue: 69)
        navigationItem.title = "トーク"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:UIColor.white]
        
        if Auth.auth().currentUser?.uid == nil{
            let storyboar = UIStoryboard(name: "SignUp", bundle: nil)
            let signUpViewContoroller = storyboar.instantiateViewController(withIdentifier: "SingUpViewController") as! SingUpViewController
            signUpViewContoroller.modalPresentationStyle = .fullScreen
            self.present(signUpViewContoroller, animated: true, completion: nil)
            
        }
        
        let rightBarButtonItem = UIBarButtonItem(title: "新規チャット", style: .plain, target: self, action: #selector(tapRightBarButtonItem))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
       
        
    }
    
    @objc func tapRightBarButtonItem(){
        let storyboar = UIStoryboard(name: "UserList", bundle: nil)
        let userListViewContoroller = storyboar.instantiateViewController(withIdentifier: "UserListViewController") as! UserListViewController
        let nav = UINavigationController(rootViewController: userListViewContoroller)
        self.present(nav, animated: true, completion: nil)
    }
    
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchUserInfoFromFirestore()
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
            
            self.users.append(user)
            self.chatListTableView.reloadData()
            
            self.users.forEach { (user) in
                print("user.username:",user.username)
            }
            
//            print("data:\(dic)")
            
        })
    }
}

}
    
    extension ChatListViewController: UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatListTableView.dequeueReusableCell(withIdentifier: cellID) as! ChatListCell
        cell.user = users[indexPath.row]
        return cell
    }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
        }
        
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        performSegue(withIdentifier: "chatRoom", sender: nil)
            
        }
        
}


    
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

