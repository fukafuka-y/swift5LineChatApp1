//
//  ChatListViewController.swift
//  swift5LineChatApp1
//
//  Created by 深谷祐斗 on 2020/08/15.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class ChatListViewController: UIViewController {
    
    @IBOutlet weak var chatListTableView: UITableView!
    
    private let cellID = "ChatListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatListTableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
        
        chatListTableView.delegate = self
        chatListTableView.dataSource = self

        navigationController?.navigationBar.barTintColor = .rgb(red: 39, green: 49, blue: 69)
        navigationItem.title = "トーク"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:UIColor.white]
        // Do any additional setup after loading the view.
    }
}
    
    extension ChatListViewController: UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatListTableView.dequeueReusableCell(withIdentifier: cellID) as! ChatListCell
       
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

