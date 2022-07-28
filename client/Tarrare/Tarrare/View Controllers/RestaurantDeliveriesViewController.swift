//
//  RestaurantDeliverersViewController.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/28/22.
//

import UIKit
import Foundation

class RestaurantDeliveriesViewController: UIViewController, UITableViewDelegate {
    var arrayOfDeliveries : [Delivery] = [Delivery]()
    var restaurant : Resturant? {
        didSet {
            guard let restaurant = restaurant else { return }
            deliverersAtRestaurantLabel.text = "Deliverers at \(restaurant.place.name)"
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchDeliveries()
        
        view.backgroundColor = .white
        deliveryTableView.dataSource = self
        deliveryTableView.delegate = self
        
        view.addSubview(containerView)
        containerView.addSubview(deliveryTableView)
        
        deliveryTableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(refreshDeliveryData(_:)), for: .valueChanged)
    
        containerView.addSubview(tableInfoStackView)
        tableInfoStackView.addArrangedSubview(deliverersAtRestaurantLabel)
        
    }
    
    override func viewWillLayoutSubviews() {
        let displayWidth = self.view.frame.width
        let displayHeight = self.view.frame.height
        
        let sidePadding = 20.0
        
        containerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 100, paddingLeft: sidePadding, paddingBottom: 0, paddingRight: sidePadding, width: displayWidth, height: displayHeight, enableInsets: false)
        containerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        tableInfoStackView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: displayWidth, height: 50, enableInsets: false)
        
        deliverersAtRestaurantLabel.anchor(top: tableInfoStackView.topAnchor, left: tableInfoStackView.leftAnchor, bottom: tableInfoStackView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        deliveryTableView.anchor(top: tableInfoStackView.bottomAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: containerView.frame.width, height: containerView.frame.height, enableInsets: false)
    }
    
    private let refreshControl = UIRefreshControl()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let tableInfoStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.spacing = 3
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let deliverersAtRestaurantLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular_Semibold", size: 22)
        label.textColor = .black
        return label
    }()
    
    private let deliveryTableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.layer.masksToBounds = true
        tableView.layer.borderColor = UIColor(named: "LightGray")?.cgColor
        tableView.layer.cornerRadius = 10
        
        tableView.register(DeliveryCell.self, forCellReuseIdentifier: "DeliveryCell")
        return tableView
    }()
    
    
    @objc private func refreshDeliveryData(_ sender: Any) {
        fetchDeliveries()
    }
    
    func fetchDeliveries() {
        // TODO (rashadphil) : fetch deliveries for this specific restaurant from the database
        let mockUser = User.getCurrent()!
        
        let mockRestaurant1 = Resturant(Place(name: "Chick-fil-A", streetAddress: "503 W Martin Luther King Jr Blvd", state: "TX", city: "Austin", zipcode: 78701, websiteURL: "chick-fil-a.com"))
        let mockRestaurant2 = Resturant(Place(name: "Chipotle", streetAddress: "2230 Guadalupe St #32", state: "TX", city: "Austin", zipcode: 78705, websiteURL: "chipotle.com"))
        
        let mockDeliveryBuilding1 = DeliveryBuilding(Place(name: "Gates-Dell Complex", streetAddress: "2317 Speedway", state: "TX", city: "Austin", zipcode: 78712, websiteURL: ""))
        let mockDeliveryBuilding2 = DeliveryBuilding(Place(name: "Perry-Castañeda Library", streetAddress: "101 E 21st St", state: "TX", city: "Austin", zipcode: 78712, websiteURL: ""))
        
        let mockDelivery1 = Delivery(user: mockUser, restaurant: mockRestaurant1, deliveryBuilding: mockDeliveryBuilding1)
        let mockDelivery2 = Delivery(user: mockUser, restaurant: mockRestaurant2, deliveryBuilding: mockDeliveryBuilding2)
        
        self.arrayOfDeliveries = [mockDelivery1, mockDelivery2]
        self.deliveryTableView.reloadData()
    }
}

extension RestaurantDeliveriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfDeliveries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeliveryCell", for: indexPath) as! DeliveryCell
        let currentDelivery = arrayOfDeliveries[indexPath.row]
        cell.delivery = currentDelivery
        return cell
        
    }
}


