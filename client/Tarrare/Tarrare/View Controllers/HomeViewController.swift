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
    
    let locationManager = CLLocationManager()
    var currentPlace: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        } else {
            requestUserCurrentPlace()
        }
        
        view.backgroundColor = .white
        
        createNavBar()
        
        view.addSubview(navBar)
        customNavBarView.addSubview(orderNavButton)
        customNavBarView.addSubview(deliverNavButton)
        customNavBarView.frame = CGRect(x: 0, y:0, width: view.frame.width, height: 200)
        
        view.addSubview(containerView)
        containerView.addSubview(locationSelectView)
        locationSelectView.addSubview(currentLocationLabel)
        
        
        addCurrentLocationLabelGesture()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager){
        requestUserCurrentPlace()
    }
    
    override func viewWillLayoutSubviews() {
        orderNavButton.anchor(top: customNavBarView.topAnchor, left: customNavBarView.leftAnchor, bottom: customNavBarView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 10, width: 70, height: 30, enableInsets: false)
        deliverNavButton.anchor(top: customNavBarView.topAnchor, left: orderNavButton.rightAnchor, bottom: customNavBarView.bottomAnchor, right: customNavBarView.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 70, height: 30, enableInsets: false)
        
        let displayWidth = self.view.frame.width
        let displayHeight = self.view.frame.height
        
        let sidePadding = 20.0
        
        containerView.anchor(top: navBar.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: sidePadding, paddingBottom: 0, paddingRight: sidePadding, width: displayWidth, height: displayHeight/2, enableInsets: false)
        containerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        locationSelectView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: displayWidth, height: 30, enableInsets: false)
        currentLocationLabel.anchor(top: locationSelectView.topAnchor, left: locationSelectView.leftAnchor, bottom: locationSelectView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: locationSelectView.frame.width, height: 0, enableInsets: false)
    }
    
    func createNavBar() {
        let navItem = UINavigationItem(title: "")
        navItem.titleView = self.customNavBarView
        self.navBar.setItems([navItem], animated: false)
    }
    
    private let navBar: UINavigationBar = {
        let barHeight : CGFloat = UIApplication.shared.statusBarFrame.size.height
        let screenSize: CGRect = UIScreen.main.bounds
        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: barHeight, width: screenSize.width, height: 44))
        navBar.isTranslucent = true
        navBar.barTintColor = .white
        navBar.shadowImage = UIImage()
        return navBar
    }()
    
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
    
    private let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let locationSelectView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let currentLocationLabel: LocationUILabel = {
        let label = LocationUILabel()
        return label
    }()
    
    func setCurrentPlace(place: Place) {
        self.currentPlace = place
        self.currentLocationLabel.setText(text: place.name)
    }
        
    func requestUserCurrentPlace() {
        //COMMENTED OUT TO LIMIT API REQUESTS TEMPORARILY
        
        //        APIManager.shared().getCurrentPlace(completion: {(place) in
//            self.setCurrentPlace(place: place)
//        })
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

extension HomeViewController : SelectLocationViewDelegate {
    func sendSelectedPlace(place: Place) {
        setCurrentPlace(place: place)
    }
}
