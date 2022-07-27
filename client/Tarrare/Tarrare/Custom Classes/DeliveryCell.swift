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
            delivererNameLabel.text = delivery?.user.firstName
            resturantLabel.text = delivery?.resturant.place.name
            deliveryLocationLabel.text = delivery?.deliveryBuilding.place.name
        }
    }
    var delegate : DeliveryCellProtocol!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        
        contentView.addSubview(userInfoStackView)
        userInfoStackView.addSubview(delivererNameLabel)
        userInfoStackView.addSubview(chatIconImageView)
        
        contentView.addSubview(locationInfoStackView)
        locationInfoStackView.addSubview(resturantView)
        resturantView.addSubview(titleResturantLabel)
        resturantView.addSubview(resturantLabel)
        
        locationInfoStackView.addSubview(deliveryLocationView)
        deliveryLocationView.addSubview(titleDeliveryLocationLabel)
        deliveryLocationView.addSubview(deliveryLocationLabel)
        
        addChatIconImageViewGesture()
        
        let paddingSize = 15.0
        
        userInfoStackView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, paddingTop: 8, paddingLeft: paddingSize, paddingBottom: 8, paddingRight: paddingSize, width: frame.width, height: 40, enableInsets: false)
        delivererNameLabel.anchor(top: userInfoStackView.topAnchor, left: userInfoStackView.leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0, enableInsets: false)
        chatIconImageView.anchor(top: userInfoStackView.topAnchor, left: delivererNameLabel.rightAnchor, bottom: nil, right: userInfoStackView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 30, height: 30, enableInsets: false)
        
        locationInfoStackView.anchor(top: userInfoStackView.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 8, paddingLeft: paddingSize, paddingBottom: 8, paddingRight: paddingSize, width: frame.width, height: 65, enableInsets: false)
        
        resturantView.anchor(top: locationInfoStackView.topAnchor, left: locationInfoStackView.leftAnchor, bottom: locationInfoStackView.bottomAnchor, right: nil , paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: frame.width/2, height: 0, enableInsets: false)
        titleResturantLabel.anchor(top: resturantView.topAnchor, left: resturantView.leftAnchor, bottom: nil, right: resturantView.rightAnchor , paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        resturantLabel.anchor(top: titleResturantLabel.bottomAnchor, left: resturantView.leftAnchor, bottom: resturantView.bottomAnchor, right: resturantView.rightAnchor , paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        deliveryLocationView.anchor(top: locationInfoStackView.topAnchor, left: resturantView.rightAnchor, bottom: locationInfoStackView.bottomAnchor, right: locationInfoStackView.rightAnchor , paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: frame.width/2, height: 0, enableInsets: false)
        titleDeliveryLocationLabel.anchor(top: deliveryLocationView.topAnchor, left: deliveryLocationView.leftAnchor, bottom: nil, right: deliveryLocationView.rightAnchor , paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        deliveryLocationLabel.anchor(top: titleDeliveryLocationLabel.bottomAnchor, left: deliveryLocationView.leftAnchor, bottom: deliveryLocationView.bottomAnchor, right: deliveryLocationView.rightAnchor , paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
    }
    
    private let userInfoStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.spacing = 3
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let delivererNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular_Bold", size: 20)
        label.textColor = .black
        return label
    }()
    
    private let chatIconImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bubble.left")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let locationInfoStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.spacing = 3
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let resturantView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let titleResturantLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular_Semibold", size: 15)
        label.textColor = UIColor(named: "LightGray")
        label.text = "Resturant"
        return label
    }()
    
    private let resturantLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular_Bold", size: 16)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let deliveryLocationView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let titleDeliveryLocationLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular_Semibold", size: 15)
        label.textColor = UIColor(named: "LightGray")
        label.text = "Delivery Location"
        return label
    }()
    
    private let deliveryLocationLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular_Bold", size: 16)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    @objc func didTapChatIcon(_ sender: Any) {
        if let delivery = delivery {
            self.delegate.didTapChatIcon(tappedDelivery: delivery)
        }
    }
    
    func addChatIconImageViewGesture() {
        let imageViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapChatIcon(_:)))
        chatIconImageView.isUserInteractionEnabled = true
        chatIconImageView.addGestureRecognizer(imageViewTapGesture)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
    }
}
