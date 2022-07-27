//
//  OrderViewController.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/11/22.
//

import Foundation
import UIKit
import CoreLocation

class DeliverViewController: UIViewController, CLLocationManagerDelegate {
    
    var currentResturant: Place? 
    var deliveryBuilding: Place?
    var tappedLocationLabel: UILabel?
    var user : User! = User.getCurrent()
    var parentNavController: UINavigationController?
    var currentDelivery : Delivery? = Delivery.userCurrent
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDeliveryLabels()
        
        view.backgroundColor = .white
        
        view.addSubview(containerView)
        containerView.addSubview(resturantSelectStackView)
        resturantSelectStackView.addArrangedSubview(myResturantLabel)
        resturantSelectStackView.addArrangedSubview(resturantLocationLabel)
        
        containerView.addSubview(deliveryLocationSelectStackView)
        deliveryLocationSelectStackView.addArrangedSubview(myDeliveryLocationLabel)
        deliveryLocationSelectStackView.addArrangedSubview(deliveryLocationLabel)
        
        containerView.addSubview(tableInfoStackView)
        tableInfoStackView.addArrangedSubview(currentOrdersLabel)
        tableInfoStackView.addArrangedSubview(statusView)
        statusView.addSubview(myDeliveryStatusLabel)
        statusView.addSubview(userDeliveryStatusLabel)
        
        addResturantLabelGesture()
        addDeliveryLocationGesture()
        addDeliveryStatusGesture()
    }
    
    
    override func viewWillLayoutSubviews() {
        let displayWidth = self.view.frame.width
        let displayHeight = self.view.frame.height
        
        let sidePadding = 20.0
        
        containerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: sidePadding, paddingBottom: 0, paddingRight: sidePadding, width: displayWidth, height: displayHeight/2, enableInsets: false)
        containerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        resturantSelectStackView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: containerView.frame.width, height: 30, enableInsets: false)
        myResturantLabel.anchor(top: resturantSelectStackView.topAnchor, left: resturantSelectStackView.leftAnchor, bottom: resturantSelectStackView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        resturantLocationLabel.anchor(top: resturantSelectStackView.topAnchor, left: myResturantLabel.rightAnchor, bottom: resturantSelectStackView.bottomAnchor, right: resturantSelectStackView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        deliveryLocationSelectStackView.anchor(top: resturantSelectStackView.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: containerView.frame.width, height: 30, enableInsets: false)
        myDeliveryLocationLabel.anchor(top: deliveryLocationSelectStackView.topAnchor, left: deliveryLocationSelectStackView.leftAnchor, bottom: deliveryLocationSelectStackView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        deliveryLocationLabel.anchor(top: deliveryLocationSelectStackView.topAnchor, left: myDeliveryLocationLabel.rightAnchor, bottom: deliveryLocationSelectStackView.bottomAnchor, right: deliveryLocationSelectStackView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        tableInfoStackView.anchor(top: deliveryLocationSelectStackView.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 25, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: containerView.frame.width, height: 50, enableInsets: false)
        currentOrdersLabel.anchor(top: tableInfoStackView.topAnchor, left: tableInfoStackView.leftAnchor, bottom: tableInfoStackView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        statusView.anchor(top: tableInfoStackView.topAnchor, left: currentOrdersLabel.rightAnchor, bottom: tableInfoStackView.bottomAnchor, right: tableInfoStackView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        myDeliveryStatusLabel.anchor(top: statusView.topAnchor, left: statusView.leftAnchor, bottom: nil, right: statusView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        userDeliveryStatusLabel.anchor(top: myDeliveryStatusLabel.bottomAnchor, left: statusView.leftAnchor, bottom: statusView.bottomAnchor, right: statusView.rightAnchor, paddingTop: -3, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
    }
    
    private let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    // User Resturant
    private let resturantSelectStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.spacing = 3
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let myResturantLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular_Bold", size: 17)
        label.textColor = .black
        label.text = "My Resturant: "
        return label
    }()
    
    private let resturantLocationLabel: LocationUILabel = {
        let label = LocationUILabel()
        label.textAlignment = .center
        label.setContentHuggingPriority(UILayoutPriority(1000), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
        return label
    }()
    
    // User Delivery Location
    private let deliveryLocationSelectStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.spacing = 3
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let myDeliveryLocationLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular_Bold", size: 17)
        label.textColor = .black
        label.text = "Delivery Location: "
        return label
    }()
    
    private let deliveryLocationLabel: LocationUILabel = {
        let label = LocationUILabel()
        label.textAlignment = .center
        label.setContentHuggingPriority(UILayoutPriority(1000), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
        return label
    }()
    
    private let tableInfoStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.spacing = 3
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let currentOrdersLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular_SemiBold", size: 22)
        label.textColor = .black
        label.text = "Current Orders"
        return label
    }()
    
    private let statusView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let myDeliveryStatusLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular_Bold", size: 15)
        label.textColor = .black
        label.text = "Delivery Status: "
        return label
    }()
    
    private var userDeliveryStatusLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular_Medium", size: 15)
        label.textAlignment = .right
        return label
    }()
    
    func placeDeliverRequest() {
        if let currentResturant = currentResturant, let deliveryBuilding = deliveryBuilding {
            Delivery.createDelivery(userId: self.user.id, orderStatus: "placed", resturantPlaceId: currentResturant.id, deliveryBuildingPlaceId: deliveryBuilding.id, completion: {createdDelivery in
                
                Delivery.userCurrent = createdDelivery
                self.currentDelivery = createdDelivery
                self.updateDeliveryLabels()
            })
        }
    }
    
    func cancelDeliverRequest() {
        guard let currentDelivery = currentDelivery else { return }

        Delivery.cancelDelivery(deliveryId: currentDelivery.id, completion: {_ in
            
            Delivery.userCurrent = nil
            self.currentDelivery = nil
            self.updateDeliveryLabels()
        })
    }
    
    func updateDeliveryLabels() {
        guard let currentDelivery = currentDelivery else {
            self.updateDeliveryStatusLabel(false)
            return
        }

        self.setCurrentResturant(place: currentDelivery.resturant.place)
        self.setCurrentDeliveryLocation(place: currentDelivery.deliveryBuilding.place)
        self.updateDeliveryStatusLabel(true)
    }
    
    func updateDeliveryStatusLabel(_ status : Bool? = nil) {
        
        let deliveryStatus = status == nil ? self.user.delivering : status!
        
        if (deliveryStatus) {
            self.userDeliveryStatusLabel.textColor = UIColor(named: "DarkGreen")
            self.userDeliveryStatusLabel.text = "Delivering"
        } else {
            self.userDeliveryStatusLabel.textColor = UIColor(named: "DarkRed")
            self.userDeliveryStatusLabel.text = "Not Delivering"
        }
    }
    
    func toggleUserDeliveryStatus() {
        if currentDelivery == nil {
            self.placeDeliverRequest()
        } else {
            self.cancelDeliverRequest()
        }
    }
    
    func setCurrentResturant(place: Place) {
        self.currentResturant = place
        self.resturantLocationLabel.setText(text: place.name)
    }
    
    func setCurrentDeliveryLocation(place: Place) {
        self.deliveryBuilding = place
        self.deliveryLocationLabel.setText(text: place.name)
    }
        
    
    // GESTURES / ACTIONS
    
    func addResturantLabelGesture() {
        let labelTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapResturantLabel))
        resturantLocationLabel.isUserInteractionEnabled = true
        resturantLocationLabel.addGestureRecognizer(labelTapGesture)
    }
    
    @objc func didTapResturantLabel() {
        let selectLocationVC = SelectLocationViewController()
        tappedLocationLabel = resturantLocationLabel
        
        selectLocationVC.delegate = self
        self.present(selectLocationVC, animated: true)
    }
    
    func addDeliveryLocationGesture() {
        let labelTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapDeliveryLocationLabel))
        deliveryLocationLabel.isUserInteractionEnabled = true
        deliveryLocationLabel.addGestureRecognizer(labelTapGesture)
    }
    
    @objc func didTapDeliveryLocationLabel() {
        let selectLocationVC = SelectLocationViewController()
        tappedLocationLabel = deliveryLocationLabel
        
        selectLocationVC.delegate = self
        self.present(selectLocationVC, animated: true)
    }
    
    func addDeliveryStatusGesture() {
        let viewTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapDeliveryStatusView))
        userDeliveryStatusLabel.isUserInteractionEnabled = true
        userDeliveryStatusLabel.addGestureRecognizer(viewTapGesture)
    }
    
    @objc func didTapDeliveryStatusView() {
        toggleUserDeliveryStatus()
    }
    
    
}

extension DeliverViewController : SelectLocationViewDelegate {
    func sendSelectedPlace(place: Place) {
        if (tappedLocationLabel == resturantLocationLabel) {
            setCurrentResturant(place: place)
        } else {
            setCurrentDeliveryLocation(place: place)
        }
    }
}

