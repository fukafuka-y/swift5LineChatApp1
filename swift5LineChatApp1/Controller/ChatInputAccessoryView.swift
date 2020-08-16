//
//  ChatInput.swift
//  swift5LineChatApp1
//
//  Created by 深谷祐斗 on 2020/08/16.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit


protocol ChatInputAccessoryViewDelegate:class {
       func tapSendButton(text:String)
   }
   

class ChatInputAccessoryView: UIView{
    
    @IBOutlet weak var chatTextView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    @IBAction func tapSendButton(_ sender: Any) {
        guard let text = chatTextView.text else {return}
        delegate?.tapSendButton(text: text)
    }
    
    weak var delegate:ChatInputAccessoryViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        nibInit()
        setupView()
        autoresizingMask = .flexibleHeight
    }
    
    private func setupView(){
        
        chatTextView.layer.cornerRadius = 15
        chatTextView.layer.borderColor = UIColor.rgb(red: 230, green: 230, blue: 230).cgColor
        chatTextView.layer.borderWidth = 1
        sendButton.layer.cornerRadius = 15
        sendButton.imageView?.contentMode = .scaleAspectFill
        sendButton.contentHorizontalAlignment = .fill
        sendButton.contentVerticalAlignment = .fill
        sendButton.isEnabled = false
        
        chatTextView.text = ""
        chatTextView.delegate = self
        
    }
    
    func removeText(){
        chatTextView.text = ""
        sendButton.isEnabled = false
        
    }
    
    override var intrinsicContentSize: CGSize{
        
        return .zero
    }
    
    private func nibInit(){
        
        let nib = UINib(nibName: "ChatInputAccessoryView", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options:nil).first as? UIView else { return
            }
        
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        self.addSubview(view)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChatInputAccessoryView:UITextViewDelegate{
     
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty{
            sendButton.isEnabled = false
        }else{
            sendButton.isEnabled = true
        }
        
        
    }

}
