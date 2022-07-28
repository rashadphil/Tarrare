//
//  DeliveryCell.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/13/22.
//

import Foundation
import UIKit

protocol DeliveryCellProtocol {
    func didTapChatIcon(tappedDelivery: Delivery)
}

class DeliveryCell : UITableViewCell {
    
    var delivery: Delivery? {
        didSet {
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
    }
}
