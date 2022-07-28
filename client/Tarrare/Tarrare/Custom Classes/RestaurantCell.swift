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
            
            guard let place = restaurant?.place else {
                return
            }
            
            self.nameLabel.text = place.name
            self.addressStreetLabel.text = place.streetAddress
            self.addressLargerAreasLabel.text = "\(place.city) \(place.state), \(place.zipcode)"
            restaurant?.setLogoForImageView(imageView: self.logoImageView)
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        let cellWidth = contentView.frame.width
        
        contentView.addSubview(self.logoImageView)
        contentView.addSubview(self.nameLabel)
        contentView.addSubview(self.addressView)
        
        self.addressView.addArrangedSubview(self.addressStreetLabel)
        self.addressView.addArrangedSubview(self.addressLargerAreasLabel)
        
        self.setAccessoryView()
        
        self.logoImageView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: 60, height: 60, enableInsets: false)
        self.nameLabel.anchor(top: contentView.topAnchor, left: self.logoImageView.rightAnchor, bottom: nil, right: contentView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        self.addressView.anchor(top: self.nameLabel.bottomAnchor, left: self.logoImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 8, paddingBottom: 0, paddingRight: 10, width: cellWidth, height: 0, enableInsets: false)
        
    }
    
    private let logoImageView : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.FontDefaults.semibold, size: 18)
        label.textColor = .black
        return label
    }()
    
    private let addressView : UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        view.alignment = .top
        return view
    }()
    
    private let addressStreetLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.FontDefaults.medium, size: 14)
        label.textColor = UIColor(named: "DarkGray")
        return label
    }()
    
    private let addressLargerAreasLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.FontDefaults.medium, size: 14)
        label.textColor = UIColor(named: "DarkGray")
        return label
    }()
    
    func setAccessoryView() {
        let imageView = UIImageView(frame:CGRect(x: 0, y: 0, width: 25, height: 25))
        imageView.image = UIImage(systemName: "arrow.right")
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        self.accessoryView = imageView
    }
    
    
    required init?(coder aDecoder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
    }
}
