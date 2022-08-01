//
//  PendingMatchViewController.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/28/22.
//

import Foundation
import UIKit

class PendingMatchViewController : UIViewController {
    public var order: Order? {
        didSet {
            guard let order = order else { return }

            deliveryBuildingPlaceItemView.place = order.deliveryBuilding.place
            deliveryBuildingPlaceItemView.setImage(image: UIImage(systemName: "mappin.circle.fill")!)

            restaurantPlaceItemView.place = order.resturant.place
            restaurantPlaceItemView.setImage(image: UIImage(systemName: "takeoutbag.and.cup.and.straw.fill")!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(self.containerView)
        
        self.containerView.addSubview(self.deliveryInfoStackView)
        self.containerView.addSubview(self.loaderContainerView)
        self.containerView.addSubview(self.footerStackView)
        
        self.loaderContainerView.addSubview(self.loadingCircleView)
        
        self.deliveryInfoStackView.addArrangedSubview(deliveryBuildingPlaceItemView)
        self.deliveryInfoStackView.addArrangedSubview(restaurantPlaceItemView)
        
        self.footerStackView.addArrangedSubview(waitingLabel)
        self.footerStackView.addArrangedSubview(infoLabel)
        self.footerStackView.addArrangedSubview(cancelRequestButton)
        
        self.setupLoader()
        self.setupCancelRequestButton()
    }
    
    override func viewWillLayoutSubviews() {
        let sidePadding = 25.0
        
        self.containerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 100, paddingLeft: sidePadding, paddingBottom: 150, paddingRight: sidePadding, width: 0, height: 0, enableInsets: false)
        self.deliveryInfoStackView.anchor(top: self.containerView.topAnchor, left: self.containerView.leftAnchor, bottom: nil, right: self.containerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        self.loaderContainerView.anchor(top: deliveryInfoStackView.bottomAnchor, left: self.containerView.leftAnchor, bottom: nil, right: self.containerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 300, enableInsets: false)
        
        self.footerStackView.anchor(top: loaderContainerView.bottomAnchor, left: self.containerView.leftAnchor, bottom: nil, right: self.containerView.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0, enableInsets: false)
        
        self.infoLabel.widthAnchor.constraint(equalTo: self.footerStackView.widthAnchor, multiplier: 0.85).isActive = true
        self.cancelRequestButton.widthAnchor.constraint(equalTo: self.footerStackView.widthAnchor, multiplier: 0.85).isActive = true
        
    }
    
    func setupLoader() {
        self.loadingCircleView.frame = CGRect(x: loaderContainerView.center.x + 100, y: 75, width: 150, height: 150)
        self.loadingCircleView.animate()
    }
    
    let containerView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let deliveryInfoStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.distribution = .fillEqually
        stackview.spacing = 10
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
    
    let loaderContainerView : UIView = {
        let view = UIView()
        return view
    }()
    
    let loadingCircleView = LoadingCircleView()
    
    let footerStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.distribution = .fillProportionally
        stackview.spacing = 10
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.alignment = .center
        return stackview
    }()
    
    let waitingLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.FontDefaults.medium, size: 22)
        label.numberOfLines = 0
        label.textColor = .black
        label.text = "Waiting for Match Response..."
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let infoLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.FontDefaults.medium, size: 17)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "DarkGray")!
        label.text = "A match request has been sent to the selected deliverer"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cancelRequestButton : UIButton = {
        let button = UIButton()
        button.setTitle("Cancel Request", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.FontDefaults.medium, size: 22)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Gestures/Actions
    
    @objc func cancelRequest(_ sender: Any) {
        guard let order = self.order else { return }

        Order.cancelOrder(orderId: order.id, completion: { _ in
            self.dismiss(animated: true)
        })
    }
    
    func setupCancelRequestButton() {
        self.cancelRequestButton.addTarget(self, action: #selector(cancelRequest(_:)), for: .touchUpInside)
    }
    
}

class CustomPlaceLocationView : UIView {
    public var place : Place? {
        didSet {
            guard let place = place else { return }

            locationNameLabel.text = place.name
            locationAddressLabel.text = place.fullAddress
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
        self.addSubview(imageView)
        self.addSubview(locationStackView)
        
        self.locationStackView.addArrangedSubview(locationNameLabel)
        self.locationStackView.addArrangedSubview(locationAddressLabel)
        
        self.setupLayout()
    }
    
    private func setupLayout() {
        
        self.imageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        self.locationStackView.anchor(top: topAnchor, left: self.imageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
    }
    
    public func setImage(image: UIImage) {
        imageView.image = image
    }
    
    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .black
        return imageView
    }()
    
    let locationStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.spacing = 3
        stackview.alignment = .top
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    let locationNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.FontDefaults.medium, size: 18)
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationAddressLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.FontDefaults.medium, size: 16)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "DarkGray")!
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
}

