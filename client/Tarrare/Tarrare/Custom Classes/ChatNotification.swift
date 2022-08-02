//
//  ChatNotification.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 8/1/22.
//

import Foundation
import SwiftMessages
import UIKit

class ChatNotification {
    var message : Message? {
        didSet {
            guard let message = message else { return }
            
            self.messageView.titleLabel?.text = message.sender.displayName
            self.messageView.bodyLabel?.text = message.text
        }
    }
    
    func display(){
        SwiftMessages.show(config: self.messageConfig, view: self.messageView)
    }
    
    var messageConfig : SwiftMessages.Config = {
        var config = SwiftMessages.defaultConfig
        config.duration = .seconds(seconds: 3)
        config.presentationContext = .window(windowLevel: .alert)
        return config
    }()
    
    var messageView : MessageView =  {
        var view = MessageView.viewFromNib(layout: .cardView)
        
        view.configureTheme(backgroundColor: .white.withAlphaComponent(0.9), foregroundColor: UIColor(hex: "#CDD3D6", alpha: 0.9)!)
        view.configureDropShadow()
        
        view.iconImageView?.isHidden = true
        view.iconLabel?.isHidden = true
        view.button?.isHidden = true
        
        view.titleLabel?.font = UIFont(name: Constants.FontDefaults.semibold, size: 15)
        view.bodyLabel?.font = UIFont(name: Constants.FontDefaults.regular, size: 15)
        
        view.titleLabel?.textColor = .black
        view.bodyLabel?.textColor = .black
        
        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
        
        return view
    }()
        
}

