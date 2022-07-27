//
//  IndividualChatViewController.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/14/22.
//

import Foundation
import UIKit
import MessageKit
import InputBarAccessoryView

class IndividualChatViewController : MessagesViewController {
    var messageArray: [Message] = [Message]()
    var currentUser: User = User.getCurrent()!
    public var targetUser: User?
    public var deliveryInfo : Delivery?
    
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        messagesCollectionView.backgroundColor = .white
        
        setupNavbar()
        
        configureMessageCollectionView()
        configureMessageInputBar()
        startMessageListener()
        
        fetchConversation()
        
    }
    
    // MARK: - Components
    
    func setupNavbar() {
        navigationItem.titleView?.tintColor = .black
        navigationItem.title = self.targetUser?.firstName
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: requestButton)
    }
    
    private let requestButton : UIButton = {
        let button = UIButton()
        button.setTitle("Request ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Regular", size: 15)
        button.backgroundColor = .black
        button.layer.cornerRadius = 15
        button.frame = CGRect(x: 0, y: 0, width: 90, height: 40)
        
        
        let buttonImage = UIImage(systemName: "takeoutbag.and.cup.and.straw")
        button.setImage(buttonImage, for: .normal)
        button.tintColor = .white
        
        button.addTarget(self, action: #selector(didTapRequestButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - API Requests
    
    func fetchConversation() {
        guard let targetUser = targetUser else {
            return
        }
        Message.getConversation(recieverId: currentUser.id, senderId: targetUser.id, completion: {messages in
            if let messages = messages {
                self.messageArray = messages
                self.messagesCollectionView.reloadData()
                self.messagesCollectionView.scrollToLastItem(at: .bottom, animated: true)
            }
        })
        
    }
    
    func startMessageListener() {
        Message.messageListenForUserId(currentUser.id, completion: {newMessage in
            guard let newMessage = newMessage else {
                return
            }
            
            // make sure the message is from the currently open chat
            if (newMessage.senderId == self.targetUser!.id) {
                self.insertNewMessage(newMessage)
            }
        })
    }
    
    // MARK: - Helpers
    
    private func insertNewMessage(_ message: Message) {
        if (messageArray.contains(message)) {
            return
        }
        messageArray.append(message)
        messagesCollectionView.reloadData()
        messagesCollectionView.scrollToLastItem(at: .bottom, animated: true)
    }
    
    
    // MARK: - MessageView Functions
    func configureMessageCollectionView() {
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        scrollsToLastItemOnKeyboardBeginsEditing = true
        maintainPositionOnKeyboardFrameChanged = true
        showMessageTimestampOnSwipeLeft = true
        
    }
    
    func configureMessageInputBar() {
        messageInputBar.delegate = self
        
        messageInputBar.inputTextView.placeholder = "Type Message"
        messageInputBar.inputTextView.textColor = .black
        messageInputBar.inputTextView.tintColor = .lightGray
        messageInputBar.backgroundView.backgroundColor = .white
        
        messageInputBar.sendButton.setTitleColor(.blue, for: .normal)
        messageInputBar.sendButton.setTitleColor(
            UIColor.blue.withAlphaComponent(0.3),
            for: .highlighted
        )
    }
    
    // MARK: - Gestures/Actions
    @objc func didTapRequestButton() {
        guard let deliveryInfo = deliveryInfo else { return }
        guard let currentUser = User.getCurrent() else { return }
        
        Order.createOrder(userId: currentUser.id, resturantPlaceId: deliveryInfo.resturantPlaceId, deliveryBuildingPlaceId: deliveryInfo.deliveryBuildingPlaceId, completion: { createdOrder in

            Order.userCurrent = createdOrder
        })
    }
}

// MARK: - Data Source
extension IndividualChatViewController: MessagesDataSource {
    func currentSender() -> SenderType {
        return Sender(senderId: String(currentUser.id), displayName: currentUser.firstName)
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messageArray.count
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messageArray[indexPath.section]
    }
    func messageTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 15
    }
    
    func messageTopLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        return NSAttributedString(
            string: message.sender.displayName,
            attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.black])
    }
    
}

// MARK: - Layout
extension IndividualChatViewController: MessagesLayoutDelegate {
    func heightForLocation(message: MessageType, at indexPath: IndexPath, with maxWidth: CGFloat, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 0
    }
}

// MARK: - DisplayDelegate
extension IndividualChatViewController: MessagesDisplayDelegate {
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ? .black : UIColor(named: "MessageGray")!
        
    }
    func textColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ? .white : .black
    }
    
    func messageStyle(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageStyle {
        return isFromCurrentSender(message: message) ? .bubbleTail(.bottomRight, .pointedEdge) :  .bubbleTail(.bottomLeft, .pointedEdge)
    }
}


// MARK: - InputBar Delegate
extension IndividualChatViewController: InputBarAccessoryViewDelegate {
    
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        guard let targetUser = targetUser else {
            return
        }
        
        Message.createMessage(text: text, recieverId: targetUser.id, senderId: currentUser.id, completion: {createdMessage in
            
            inputBar.inputTextView.text = ""
            inputBar.inputTextView.placeholder = "Type Message..."
            if let createdMessage = createdMessage {
                self.insertNewMessage(createdMessage)
            }
            
        })
        
    }
    
    
}
