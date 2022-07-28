//
//  RestaurantCell.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/27/22.
//

import Foundation
import UIKit

class RestaurantCell : UITableViewCell {
    
    var restaurant: Resturant? {
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
