//
//  OrderProfileViewController.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/29/22.
//

import Foundation
import UIKit

class OrderProfileViewController: UIViewController {
    var user : User? {
        didSet {
            guard let user = user else { return }
            self.nameLabel.text = "\(user.firstName) \(user.lastName)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.user = User.getCurrent()
        
        view.addSubview(containerView)
        
        buttonStackView.addArrangedSubview(switchToOrderingButton)
        buttonStackView.addArrangedSubview(logoutButton)
        
        containerView.addSubview(headerView)
        containerView.addSubview(buttonStackView)
        
        headerView.addSubview(nameLabel)
        addLogoutButtonGesture()
    }
    
    override func viewDidLayoutSubviews() {
        let displayWidth = view.frame.width
        let displayHeight = view.frame.height
        
        let sidePadding = 30.0
        
        containerView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: sidePadding, paddingBottom: 0, paddingRight: sidePadding, width: displayWidth, height: displayHeight, enableInsets: false)
        
        headerView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 50, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: displayWidth, height: 100, enableInsets: false)
        
        buttonStackView.anchor(top: headerView.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 110, enableInsets: false)
        
        nameLabel.anchor(top: headerView.topAnchor, left: headerView.leftAnchor, bottom: headerView.bottomAnchor, right: headerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: displayWidth, height: 0, enableInsets: false)
    }
    
    private let containerView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let headerView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.FontDefaults.semibold, size: 25)
        label.textColor = .black
        return label
    }()
    
    private let buttonStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.distribution = .fillEqually
        stackview.spacing = 15
        return stackview
    }()
    
    private let switchToOrderingButton : UIButton = {
        let button = UIButton()
        button.setTitle("Switch to delivering", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.FontDefaults.semibold, size: 19)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    private let logoutButton : UIButton = {
        let button = UIButton()
        button.setTitle("Log out", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.FontDefaults.semibold, size: 19)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        return button
    }()
    
    func presentLoginScreen() {
        let loginVC = LoginViewController()
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: false)
    }
    
    // MARK: - Actions/Gestures
    
    
    func addLogoutButtonGesture() {
        logoutButton.addTarget(self, action: #selector(didTapLogoutButton), for: .touchUpInside)
    }
    
    @objc func didTapLogoutButton() {
        APIManager.shared().logoutUser(completion: {successful in
            if (successful) {
                self.presentLoginScreen()
                UserDefaults.standard.set(nil, forKey: Constants.UserDefaults.currentUser)
            }
        })
    }
}

