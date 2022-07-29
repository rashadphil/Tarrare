//
//  DeliveryCell.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/13/22.
//

import Foundation
import UIKit

protocol DeliveryCellProtocol {
    func didTapRequestButton(tappedDelivery: Delivery)
}

class DeliveryCell : UITableViewCell {
    
    var delivery: Delivery? {
        didSet {
            guard let delivery = delivery else { return }
            deliveryPlaceNameLabel.text = delivery.deliveryBuilding.place.name
        }
    }
    var delegate : DeliveryCellProtocol!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        self.addRequestButtonGesture()
        
        contentView.addSubview(self.containerStackView)
        contentView.addSubview(self.requestButtonView)
        
        self.requestButtonView.addSubview(self.requestButton)
        
        self.containerStackView.addArrangedSubview(self.locationInfoStackView)
        self.containerStackView.addArrangedSubview(self.distanceInfoStackView)
        self.containerStackView.addHorizontalSeparator(color: .black)
        
        self.locationInfoStackView.addArrangedSubview(self.titleDeliveryLocationLabel)
        self.locationInfoStackView.addArrangedSubview(self.deliveryPlaceNameLabel)
        
        self.distanceInfoStackView.addArrangedSubview(self.titleRelativeDistanceLabel)
        self.distanceInfoStackView.addArrangedSubview(self.distanceView)
        
        self.distanceView.addArrangedSubview(distanceInMilesLabel)
        
        self.containerStackView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 20, paddingBottom: 10, paddingRight: 10, width: 0, height: 0, enableInsets: false)
        
        self.requestButtonView.anchor(top: contentView.topAnchor, left: self.containerStackView.rightAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: -20, width: 0, height: 0, enableInsets: false)
        self.requestButton.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 90, height: 35, enableInsets: false)
        self.requestButton.centerXAnchor.constraint(equalTo: self.requestButtonView.centerXAnchor).isActive = true
        self.requestButton.centerYAnchor.constraint(equalTo: self.requestButtonView.centerYAnchor).isActive = true
    }
    
    private let containerStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = 12
        return stackview
    }()
    
    private let locationInfoStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = 3
        return stackview
    }()
    
    private let titleDeliveryLocationLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.FontDefaults.medium, size: 17)
        label.textColor = UIColor(named: "DarkGray")!
        label.text = "Delivery Location:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let deliveryPlaceNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.FontDefaults.semibold, size: 17)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let distanceInfoStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = 3
        return stackview
    }()
    
    private let titleRelativeDistanceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.FontDefaults.medium, size: 17)
        label.textColor = UIColor(named: "DarkGray")!
        label.text = "You -> Delivery Location:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let distanceView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.alignment = .fill
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let distanceInMilesLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.FontDefaults.medium, size: 16)
        label.textColor = .black
        label.text = "0.0 miles"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let requestButtonView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let requestButton : UIButton = {
        let button = UIButton()
        button.setTitle("Request", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.FontDefaults.medium, size: 16)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.tintColor = .white
        return button
    }()
    
    // MARK: - Actions/Gestures
    
    @objc func didTapRequestButton(_ sender: UIButton) {
        if let delivery = delivery {
            self.delegate.didTapRequestButton(tappedDelivery: delivery)
        }
    }
    
    func addRequestButtonGesture() {
        self.requestButton.addTarget(self, action: #selector(didTapRequestButton(_:)), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
    }
}
