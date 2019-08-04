//
//  ViewController.swift
//  GroupedMessages
//
//  Created by Wilfred Furthado M on 03/03/19.
//  Copyright © 2019 Pervacio. All rights reserved.
//

import UIKit

struct ChatMessage {
    let text: String
    let isIncoming: Bool
    let date: Date
}

extension Date {
    static func dateFromCustomStrinf(customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: customString) ?? Date()
    }
}

class ViewController: UITableViewController {
    
    fileprivate let cellID = "id"
    
    let chatMessages = [
        [ChatMessage(text: "he semi colon sets the type of the pulseAnimation constant. It's not necessary to use but it does tend to increase code clarity when the right hand side of an assignment doesn't make it obvious what type it will assign", isIncoming: true, date: Date()),ChatMessage(text: "It's not necessary to use but it does tend to increase code clarity when the right hand side of an assignment doesn't make it obvious what type it will assign", isIncoming: true, date: Date())],[ChatMessage(text: "he semi colon", isIncoming: false, date: Date()),ChatMessage(text: "Yea", isIncoming: false, date: Date()),ChatMessage(text: "he semi colon sets the type of the pulseAnimation constant. It's not necessary to use but it does tend to increase code clarity when the right hand side of an assignment doesn't make it obvious what type it will assign", isIncoming: true, date: Date())],[ChatMessage(text: "he semi colon sets the type of the pulseAnimation constant. It's not necessary to use but it does tend to increase code clarity when the right hand side of an assignment doesn't make it obvious what type it will assign", isIncoming: true, date: Date()),ChatMessage(text: "he semi colon sets the type of the pulseAnimation constant. It's not necessary to use but it does tend to increase code clarity when the right hand side of an assignment doesn't make it obvious what type it will assign", isIncoming: true, date: Date()),ChatMessage(text: "he semi colon sets the type of the pulseAnimation constant. It's not necessary to use but it does tend to increase code clarity when the right hand side of an assignment doesn't make it obvious what type it will assign", isIncoming: false, date: Date())],[ChatMessage(text: "he semi colon sets the type of the pulseAnimation constant. It's not necessary to use but it does tend to increase code clarity when the right hand side of an assignment doesn't make it obvious what type it will assign", isIncoming: true, date: Date()),ChatMessage(text: "nooo...", isIncoming: false, date: Date()),ChatMessage(text: "he semi colon sets the type.", isIncoming: true, date: Date()),ChatMessage(text: "he semi colon sets the type of the pulseAnimation constant. It's not necessary to use but it does tend to increase code clarity when the right hand side of an assignment doesn't make it obvious what type it will assign", isIncoming: true, date: Date())],[ChatMessage(text: "he semi colon sets the type of the pulseAnimation constant. It's not necessary to use but it does tend to increase code clarity when the right hand side of an assignment doesn't make it obvious what type it will assign", isIncoming: true, date: Date()),ChatMessage(text: "The right hand side of an assignment doesn't make it obvious what type it will assign", isIncoming: false, date: Date()),ChatMessage(text: "hey", isIncoming: false, date: Date())]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.separatorStyle = .none

        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellID)
        
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    class DateHeaderLabel: UILabel {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            backgroundColor = UIColor.black
            textColor = UIColor.white
            textAlignment = .center
            translatesAutoresizingMaskIntoConstraints = false
            font = UIFont.boldSystemFont(ofSize: 14)

        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var intrinsicContentSize: CGSize {

            let originalContentSize = super.intrinsicContentSize
            let height = originalContentSize.height + 12
            layer.cornerRadius = height / 2
            layer.masksToBounds = true
            return CGSize(width: originalContentSize.width + 20, height: height)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if let firstMessegeInSection = chatMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let dateString = dateFormatter.string(from: firstMessegeInSection.date)
            let label = DateHeaderLabel()

            label.text = dateString

            let containerView = UIView()
            
            containerView.addSubview(label)
            
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            
            return containerView
        }
        return nil
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if let firstMessegeInSection = chatMessages[section].first {
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "MM/dd/yyyy"
//            let dateString = dateFormatter.string(from: firstMessegeInSection.date)
//            return dateString
//        }
//        return "Section \(Date())"
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return chatMessages[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ChatMessageCell
        
        let chatMessage = chatMessages[indexPath.section][indexPath.row]
        
//        cell.messageLabel.text = chatMessage.text
        
//        cell.isIncoming = chatMessage.isIncoming
        cell.chatMessage = chatMessage
        return cell
    }
}

