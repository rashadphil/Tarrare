//
//  OrderMatchViewController.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 8/1/22.
//

import Foundation
import UIKit
import MapKit


class OrderMatchViewController : UIViewController {
    var match : Match? {
        didSet {
            
            guard let delivery = match?.delivery else { return }
            
            delivererUserView.user = delivery.user

            deliveryBuildingPlaceItemView.place = delivery.deliveryBuilding.place
            deliveryBuildingPlaceItemView.setImage(image: UIImage(systemName: "mappin.circle.fill")!)

            restaurantPlaceItemView.place = delivery.resturant.place
            restaurantPlaceItemView.setImage(image: UIImage(systemName: "takeoutbag.and.cup.and.straw.fill")!)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChatIconGesture()
        
        self.view.backgroundColor = .white
        title = "Order Matched!"
        
        view.addSubview(mapView)
        view.addSubview(containerView)
        
        self.containerView.addArrangedSubview(self.delivererUserView)
        self.containerView.addArrangedSubview(self.deliveryInfoStackView)
        self.containerView.addHorizontalSeparator(color: .black)
        
        self.deliveryInfoStackView.addArrangedSubview(self.deliveryBuildingPlaceItemView)
        self.deliveryInfoStackView.addArrangedSubview(self.restaurantPlaceItemView)
        
    }
    
    override func viewWillLayoutSubviews() {
        
        let displayWidth = self.view.frame.width
        let displayHeight = self.view.frame.height
        
        let sidePadding = 25.0
        
        self.mapView.anchor(top: navigationController?.navigationBar.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: displayWidth, height: displayHeight/2, enableInsets: false)
        
        self.containerView.anchor(top: self.mapView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: sidePadding, paddingBottom: 0, paddingRight: sidePadding, width: 0, height: 0, enableInsets: false)
    }
    
    // MARK: - Components
    
    private let mapView : MKMapView = {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        return mapView
    }()
    
    let containerView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.distribution = .equalSpacing
        stackview.spacing = 10
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    let delivererUserView : DelivererUserView = {
        let view = DelivererUserView()
        return view
    }()
    
    let deliveryInfoStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.distribution = .fillProportionally
        stackview.spacing = 6
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    let deliveryBuildingPlaceItemView : CustomPlaceLocationView = {
        let view = CustomPlaceLocationView(frame: CGRect())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let restaurantPlaceItemView : CustomPlaceLocationView = {
        let view = CustomPlaceLocationView(frame: CGRect())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //MARK: - Gestures/Actions
    @objc func didTapChatIcon(_ sender: Any) {
        guard let delivererUser = match?.delivery.user else { return }
        
        let individualChatVC = IndividualChatViewController()
        individualChatVC.targetUser = delivererUser
        self.navigationController?.show(individualChatVC, sender: self)
    }
    
    func addChatIconGesture() {
        self.delivererUserView.chatIconButton.addTarget(self, action: #selector(didTapChatIcon(_:)), for: .touchUpInside)
    }
}

class DelivererUserView : UIView {
    public var user: User? {
        didSet {
            guard let user = user else { return }

            self.nameLabel.text = user.firstName
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
      }
    
    private func setupView() {
        self.backgroundColor = .white
        
        self.addSubview(profilePictureImageView)
        self.addSubview(nameAndTitleStackView)
        self.addSubview(chatIconView)
        
        self.nameAndTitleStackView.addArrangedSubview(self.nameLabel)
        self.nameAndTitleStackView.addArrangedSubview(self.titleLabel)
        
        self.chatIconView.addSubview(self.chatIconButton)
        
        self.setupLayout()
    }
    
    private func setupLayout() {
        self.profilePictureImageView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: nil, paddingTop: 25, paddingLeft: 0, paddingBottom: 10, paddingRight: 0, width: 65, height: 65, enableInsets: false)
        
        self.nameAndTitleStackView.anchor(top: nil, left: self.profilePictureImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        self.nameAndTitleStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.chatIconView.anchor(top: self.topAnchor, left: self.nameAndTitleStackView.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 70, height: 0, enableInsets: false)
        

        self.chatIconButton.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 35, height: 35, enableInsets: false)
        self.chatIconButton.centerXAnchor.constraint(equalTo: self.chatIconView.centerXAnchor).isActive = true
        self.chatIconButton.centerYAnchor.constraint(equalTo: self.chatIconView.centerYAnchor).isActive = true
    }
    
    let profilePictureImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .black
        imageView.image = UIImage(systemName: "person.circle")
        
        return imageView
    }()
    
    let nameAndTitleStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.spacing = 3
        stackview.alignment = .top
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.FontDefaults.bold, size: 17)
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.FontDefaults.medium, size: 16)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "DarkGray")!
        label.text = "Deliverer"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let chatIconView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let chatIconButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.backgroundColor = .black
        button.setImage(UIImage(systemName: "bubble.left.fill"), for: .normal)
        button.layer.cornerRadius = 35/2
        return button
    }()
}

