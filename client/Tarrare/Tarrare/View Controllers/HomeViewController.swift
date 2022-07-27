//
//  HomeViewController.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/8/22.
//

import Foundation
import UIKit
import CoreLocation

class HomeViewController: UIViewController, CLLocationManagerDelegate {
    
    enum ViewType {
        case Order
        case Deliver
    }
    
    let locationManager = CLLocationManager()
    var currentPlace: Place?
    var currentViewType: ViewType = .Order
    var childView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        } else {
            requestUserCurrentPlace()
        }
        
        orderViewController.parentNavController = self.navigationController
        deliverViewController.parentNavController = self.navigationController
        
        view.backgroundColor = .white
        childView = orderViewController.view
        
        setupNavbar()
        view.addSubview(childView)
        
        addOrderNavButtonGesture()
        addDeliverNavButtonGesture()
    }
    
    func setupNavbar() {
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        let stackView = UIStackView(arrangedSubviews: [orderNavButton, deliverNavButton])
        stackView.backgroundColor = .white
        stackView.spacing = 10
        stackView.alignment = .center
        navigationItem.titleView = stackView
        
    }
    
    override func viewWillLayoutSubviews() {
        orderNavButton.contentEdgeInsets = UIEdgeInsets(top: 5.0, left: 10.0, bottom: 5.0, right: 10.0)
        deliverNavButton.contentEdgeInsets = UIEdgeInsets(top: 5.0, left: 10.0, bottom: 5.0, right: 10.0)
        
        let displayWidth = self.view.frame.width
        let displayHeight = self.view.frame.height
        let navBar = self.navigationController!.navigationBar
        
        childView.anchor(top: navBar.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: displayWidth, height: displayHeight - 200, enableInsets: false)
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager){
        requestUserCurrentPlace()
    }
    
    func requestUserCurrentPlace() {
        APIManager.shared().getCurrentPlace(completion: {place in
            place.createPlace(completion: {currentPlace in 
              self.currentPlace = currentPlace
            })
        })
    }
    
    private let customNavBarView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let orderNavButton : UIButton = {
        let button = UIButton()
        button.setTitle("Order", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Regular_Semibold", size: 17)
        button.backgroundColor = .black
        button.layer.cornerRadius = 15
        return button
    }()
    
    private let deliverNavButton : UIButton = {
        let button = UIButton()
        button.setTitle("Deliver", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Regular_Normal", size: 17)
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        return button
    }()
    
    private var orderViewController: OrderViewController = {
        let viewController = OrderViewController()
        return viewController
    }()
    
    private var deliverViewController: DeliverViewController = {
        let viewController = DeliverViewController()
        return viewController
    }()
    
    
    func updateNavBarButtons() {
        var selectedButton : UIButton?
        var unselectedButton : UIButton?
        
        if (self.currentViewType == .Order) {
            selectedButton = self.orderNavButton
            unselectedButton = self.deliverNavButton
        } else {
            selectedButton = self.deliverNavButton
            unselectedButton = self.orderNavButton
        }
        selectedButton!.setTitleColor(.white, for: .normal)
        selectedButton!.titleLabel?.font = UIFont(name: "Inter-Regular_Semibold", size: 17)
        selectedButton!.backgroundColor = .black
        
        unselectedButton!.setTitleColor(.black, for: .normal)
        unselectedButton!.titleLabel?.font = UIFont(name: "Inter-Regular_Normal", size: 17)
        unselectedButton!.backgroundColor = .white
    }
    
    func handleChildViewChange() {
        switch self.currentViewType {
        case .Order:
            self.childView = orderViewController.view
            break
        case .Deliver:
            self.childView = deliverViewController.view
            break
        }
        
        // reload view
        self.childView.removeFromSuperview()
        self.view.addSubview(childView)
        
        updateNavBarButtons()
    }
    
    
    
    // GESTURES / ACTIONS
    @objc func didTapOrderNavButton() {
        if (self.currentViewType == .Order) {
           return
        }
        self.currentViewType = .Order
        handleChildViewChange()
    }
    
    func addOrderNavButtonGesture() {
        orderNavButton.addTarget(self, action: #selector(didTapOrderNavButton), for: .touchUpInside)
    }
    
    @objc func didTapDeliverNavButton() {
        if (self.currentViewType == .Deliver) {
           return
        }
        self.currentViewType = .Deliver
        handleChildViewChange()
    }
    
    func addDeliverNavButtonGesture() {
        deliverNavButton.addTarget(self, action: #selector(didTapDeliverNavButton), for: .touchUpInside)
    }
    
}

