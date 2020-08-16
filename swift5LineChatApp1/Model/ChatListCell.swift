//
//  ChatListCell.swift
//  swift5LineChatApp1
//
//  Created by 深谷祐斗 on 2020/08/15.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class ChatListCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var lastMessageLabel: UILabel!
    @IBOutlet weak var yourNameLabel: UILabel!
    @IBOutlet weak var dateTextLabel: UILabel!
    
    var user:User?{
        didSet{
            if let user = user{
                yourNameLabel.text = user.username
//            userImageView.image = user?.profileImageUrl
                dateTextLabel.text = dateFormatterDateLabel(date: user.createdAt.dateValue())
                lastMessageLabel.text = user.email
            }
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImageView.layer.cornerRadius = 33
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func dateFormatterDateLabel(date:Date)->String{
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter.string(from: date)
    }
    
}
