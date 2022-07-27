//
//  DeliverViewController.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/11/22.
//

import Foundation
import UIKit
import CoreLocation

class OrderViewController: UIViewController, UITableViewDelegate {
    let locationManager = CLLocationManager()
    var currentPlace: Place?
    var arrayOfDeliveries : [Delivery] = [Delivery]()
    public var parentNavController: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchDeliveries()
        
        view.backgroundColor = .white
        deliveryTableView.dataSource = self
        deliveryTableView.delegate = self
        
        view.addSubview(containerView)
        containerView.addSubview(locationSelectView)
        containerView.addSubview(deliveryTableView)
        locationSelectView.addSubview(currentLocationLabel)
        
        deliveryTableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(refreshDeliveryData(_:)), for: .valueChanged)
    
        containerView.addSubview(tableInfoStackView)
        tableInfoStackView.addArrangedSubview(currentDeliverersLabel)
        tableInfoStackView.addArrangedSubview(requestView)
        
        
        requestView.addSubview(requestButton)
        requestView.addSubview(filterButton)
        
        addCurrentLocationLabelGesture()
    }
    
    override func viewWillLayoutSubviews() {
        let displayWidth = self.view.frame.width
        let displayHeight = self.view.frame.height
        
        let sidePadding = 10.0
        
        containerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: sidePadding, paddingBottom: 0, paddingRight: sidePadding, width: displayWidth, height: displayHeight, enableInsets: false)
        containerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        locationSelectView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: containerView.frame.width, height: 30, enableInsets: false)
        currentLocationLabel.anchor(top: locationSelectView.topAnchor, left: locationSelectView.leftAnchor, bottom: locationSelectView.bottomAnchor, right: locationSelectView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        let tableInfoViewSidePadding = 10.0
        
        tableInfoStackView.anchor(top: locationSelectView.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 25, paddingLeft: tableInfoViewSidePadding, paddingBottom: 0, paddingRight: tableInfoViewSidePadding, width: containerView.frame.width, height: 50, enableInsets: false)
        currentDeliverersLabel.anchor(top: tableInfoStackView.topAnchor, left: tableInfoStackView.leftAnchor, bottom: tableInfoStackView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        requestView.anchor(top: tableInfoStackView.topAnchor, left: currentDeliverersLabel.rightAnchor, bottom: tableInfoStackView.bottomAnchor, right: tableInfoStackView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        filterButton.anchor(top: requestView.topAnchor, left: requestView.leftAnchor, bottom: requestView.bottomAnchor, right: nil, paddingTop: 2, paddingLeft: 0, paddingBottom: 2, paddingRight: 2, width: 30, height: 30, enableInsets: false)
        requestButton.anchor(top: requestView.topAnchor, left: filterButton.rightAnchor, bottom: requestView.bottomAnchor, right: requestView.rightAnchor, paddingTop: 6, paddingLeft: 4, paddingBottom: 6, paddingRight: 4, width: 100, height: 20, enableInsets: false)
        
        deliveryTableView.anchor(top: tableInfoStackView.bottomAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: containerView.frame.width, height: containerView.frame.height, enableInsets: false)
    }
    
    private let refreshControl = UIRefreshControl()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let locationSelectView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let currentLocationLabel: LocationUILabel = {
        let label = LocationUILabel()
        label.textAlignment = .center
        return label
    }()
    
    // Table Info
    private let tableInfoStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.spacing = 3
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let currentDeliverersLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular_Semibold", size: 22)
        label.textColor = .black
        label.text = "Current Deliverers"
        return label
    }()
    
    private let requestView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let filterButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        let buttonImage = UIImage(systemName: "slider.horizontal.3")
        button.setImage(buttonImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.tintColor = .black
        return button
    }()
    
    private let requestButton : UIButton = {
        let button = UIButton()
        button.setTitle("Request ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Regular", size: 17)
        button.backgroundColor = .black
        button.layer.cornerRadius = 15
        
        let buttonImage = UIImage(systemName: "takeoutbag.and.cup.and.straw")
        button.setImage(buttonImage, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private var userDeliveryStatusLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular_Semibold", size: 15)
        label.textAlignment = .right
        return label
    }()
    
    private let deliveryTableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.layer.masksToBounds = true
        tableView.layer.borderColor = UIColor(named: "LightGray")?.cgColor
        tableView.layer.borderWidth = 1
        tableView.layer.cornerRadius = 10
        
        tableView.register(DeliveryCell.self, forCellReuseIdentifier: "DeliveryCell")
        return tableView
    }()
    
    func setCurrentPlace(place: Place) {
        self.currentPlace = place
        self.currentLocationLabel.setText(text: place.name)
    }
    
    @objc private func refreshDeliveryData(_ sender: Any) {
        fetchDeliveries()
    }
    
    func fetchDeliveries() {
        Delivery.getAllPlacedDeliveries(completion: {deliveries in
            let currentUserId = User.getCurrent()!.id
            
            if let deliveries = deliveries {
                // Remove current user from current deliverer view if needed
                self.arrayOfDeliveries = deliveries.filter { $0.userId != currentUserId }
                self.deliveryTableView.reloadData()
                self.refreshControl.endRefreshing()
                
            }
        })
    }
        
    // GESTURES / ACTIONS
    
    func addCurrentLocationLabelGesture() {
        let labelTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapCurrentLocationLabel))
            currentLocationLabel.isUserInteractionEnabled = true
            currentLocationLabel.addGestureRecognizer(labelTapGesture)
    }
    
    @objc func didTapCurrentLocationLabel() {
        let selectLocationVC = SelectLocationViewController()
        selectLocationVC.delegate = self
        self.present(selectLocationVC, animated: true)
    }
    
    
}

extension OrderViewController : SelectLocationViewDelegate {
    func sendSelectedPlace(place: Place) {
        setCurrentPlace(place: place)
    }
}

extension OrderViewController : DeliveryCellProtocol {
    func didTapChatIcon(tappedDelivery: Delivery) {
        let individualChatVC = IndividualChatViewController()
        
        individualChatVC.targetUser = tappedDelivery.user
        individualChatVC.deliveryInfo = tappedDelivery
        self.parentNavController?.pushViewController(individualChatVC, animated: true)
        
    }

}

extension OrderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfDeliveries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeliveryCell", for: indexPath) as! DeliveryCell
        let currentDelivery = arrayOfDeliveries[indexPath.row]
        cell.delivery = currentDelivery
        cell.delegate = self
        return cell
        
    }
}

