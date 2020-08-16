//
//  ChatRoomViewController.swift
//  swift5LineChatApp1
//
//  Created by 深谷祐斗 on 2020/08/16.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class ChatRoomViewController: UIViewController{
   
    
   private let cellID = "chatRoom"
   
    private var chatInputAccessoryView:ChatInputAccessoryView = {
        let view = ChatInputAccessoryView()
        view.frame = .init(x:0, y:0, width:view.frame.width, height:view.frame.height)
        return view
        
    }()
    
    @IBOutlet weak var chatRoomTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chatRoomTableView.dataSource = self
        chatRoomTableView.delegate = self
        chatRoomTableView.register(UINib(nibName: "ChatRoomCell", bundle: nil), forCellReuseIdentifier: cellID)
        chatRoomTableView.backgroundColor = .rgb(red: 118, green: 140, blue: 180)
      
    }
    
    override var inputAccessoryView: UIView?{
        get {
            return chatInputAccessoryView
        }
    }
    
    override var canBecomeFirstResponder: Bool{
        return true
    }
    
}
extension ChatRoomViewController: UITableViewDataSource,UITableViewDelegate{
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return 10
           }
           
           func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = chatRoomTableView.dequeueReusableCell(withIdentifier: cellID) as! ChatRoomCell
            return cell
           }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        chatRoomTableView.estimatedRowHeight = 20
        return UITableView.automaticDimension
    }
        
        
        
        
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
