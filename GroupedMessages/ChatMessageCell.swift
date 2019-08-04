//
//  ChatMessageCell.swift
//  GroupedMessages
//
//  Created by Wilfred Furthado M on 03/03/19.
//  Copyright © 2019 Pervacio. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    
    let messageLabel = UILabel()
    let bubbleBackgroundVIew = UIView()
    
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    
    var chatMessage: ChatMessage! {
        didSet {
            bubbleBackgroundVIew.backgroundColor = chatMessage.isIncoming ? UIColor.white : UIColor.darkGray
            messageLabel.textColor = chatMessage.isIncoming ? UIColor.black : UIColor.white
            messageLabel.text = chatMessage.text
            
            if chatMessage.isIncoming {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            } else {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            }
        }
    }
    
//
//    var isIncoming: Bool! {
//        didSet {
//            bubbleBackgroundVIew.backgroundColor = isIncoming ? UIColor.white : UIColor.darkGray
//            messageLabel.textColor = isIncoming ? UIColor.black : UIColor.white
//        }
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.clear
        
        bubbleBackgroundVIew.backgroundColor = UIColor.yellow
        bubbleBackgroundVIew.translatesAutoresizingMaskIntoConstraints = false
        bubbleBackgroundVIew.layer.cornerRadius = 12.0
        
        addSubview(bubbleBackgroundVIew)
        
        addSubview(messageLabel)
        
//        messageLabel.backgroundColor = UIColor.blue
        messageLabel.text = "I would like to have some kind of pulse animation infinite loop scale in - scale out on a UIButton so it gets users' attention immediately."
//        messageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        messageLabel.numberOfLines = 0
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32).isActive = true
//        messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true
        
        
        bubbleBackgroundVIew.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16).isActive = true
        bubbleBackgroundVIew.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16).isActive = true
        bubbleBackgroundVIew.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16).isActive = true
        bubbleBackgroundVIew.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16).isActive = true
        
        leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        leadingConstraint.isActive = false
        
        trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        trailingConstraint.isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
