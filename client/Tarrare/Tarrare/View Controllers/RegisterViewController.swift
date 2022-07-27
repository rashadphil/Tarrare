//
//  LoginViewController.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/6/22.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(containerView)
        
        containerView.addSubview(signupLabel)
        containerView.addSubview(signUpToContinueLabel)
        containerView.addSubview(firstNameField)
        containerView.addSubview(lastNameField)
        containerView.addSubview(emailField)
        containerView.addSubview(passwordField)
        containerView.addSubview(signupButton)
        
        self.view.addSubview(footerView)
        footerView.addSubview(hasAccountLabel)
        
        addHasAccountLabelGesture()
        addSignupButtonGesture()
    }
    
    
    override func viewWillLayoutSubviews() {
        let displayWidth = self.view.frame.width
        let displayHeight = self.view.frame.height
        
        let sidePadding = 30.0
        
        containerView.anchor(top: nil, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: sidePadding, paddingBottom: 0, paddingRight: sidePadding, width: displayWidth, height: displayHeight/2, enableInsets: false)
        containerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        signupLabel.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: displayWidth, height: 0, enableInsets: false)
        
        signUpToContinueLabel.anchor(top: signupLabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: displayWidth, height: 0, enableInsets: false)
        
        firstNameField.anchor(top: signUpToContinueLabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 40, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: displayWidth, height: 50, enableInsets: false)
        lastNameField.anchor(top: firstNameField.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: displayWidth, height: 50, enableInsets: false)
        emailField.anchor(top: lastNameField.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: displayWidth, height: 50, enableInsets: false)
        passwordField.anchor(top: emailField.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: displayWidth, height: 50, enableInsets: false)
        
        signupButton.anchor(top: passwordField.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: displayWidth, height: 40, enableInsets: false)
        
        footerView.anchor(top: nil, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: displayWidth, height: 90, enableInsets: false)
        hasAccountLabel.anchor(top: footerView.topAnchor, left: footerView.leftAnchor, bottom: footerView.bottomAnchor, right: footerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
    }
    
    private let containerView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let signupLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular_Bold", size: 30)
        label.textColor = .black
        label.text = "Create Account"
        return label
    }()
    
    private let signUpToContinueLabel : UILabel = {
        let label = UILabel()
        label.text = "Please create account to continue"
        label.font = UIFont(name: "Inter-Regular_Bold", size: 15)
        label.textColor = UIColor(named: "LightGray")
        return label
    }()
    
    private let firstNameField : TarrareUITextField = {
        let field = TarrareUITextField()
        field.autocorrectionType = .no
        field.setImage(image: UIImage(systemName: "person")!)
        field.textColor = .black
        field.attributedPlaceholder = NSAttributedString(string: "FIRST NAME", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        return field
        
    }()
    
    private let lastNameField : TarrareUITextField = {
        let field = TarrareUITextField()
        field.autocorrectionType = .no
        field.setImage(image: UIImage(systemName: "person")!)
        field.textColor = .black
        field.attributedPlaceholder = NSAttributedString(string: "LAST NAME", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        return field
        
    }()
    
    private let emailField : TarrareUITextField = {
        let field = TarrareUITextField()
        field.autocorrectionType = .no
        field.setImage(image: UIImage(systemName: "mail")!)
        field.textColor = .black
        field.attributedPlaceholder = NSAttributedString(string: "SCHOOL EMAIL", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        return field
        
    }()
    
    private let passwordField : UITextField = {
        let field = TarrareUITextField()
        field.autocorrectionType = .no
        field.isSecureTextEntry = true
        field.setImage(image: UIImage(systemName: "lock")!)
        field.textColor = .black
        field.attributedPlaceholder = NSAttributedString(string: "PASSWORD", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        return field
    }()
    
    private let signupButton : UIButton = {
        let button = UIButton()
        button.setTitle("SIGN UP", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Regular_Bold", size: 16)
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let footerView: UIView = {
        let view = UIView()
        return view;
    }()
    
    private let hasAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have an account? Log in"
        label.font = UIFont(name: "Inter-Regular_Bold", size: 15)
        label.textColor = .systemBlue
        label.textAlignment = .center
        return label
    }()
    
    func presentHomeVC() {
        let appLoadingVC = AppLoadingViewController()
        appLoadingVC.modalPresentationStyle = .fullScreen
        self.present(appLoadingVC, animated: false)
    }
    
    // GESTURES / ACTIONS
    
    func addHasAccountLabelGesture() {
        let labelTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapHasAccountLabel))
        hasAccountLabel.isUserInteractionEnabled = true
        hasAccountLabel.addGestureRecognizer(labelTapGesture)
    }
    
    @objc func didTapHasAccountLabel() {
        let loginVC = LoginViewController()
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: false)
    }
    
    func addSignupButtonGesture() {
        signupButton.addTarget(self, action: #selector(didTapSignupButton), for: .touchUpInside)
    }
    
    @objc func didTapSignupButton() {
        let firstName = firstNameField.text ?? ""
        let lastName = lastNameField.text ?? ""
        let email = emailField.text ?? ""
        let password = passwordField.text ?? ""
        APIManager.shared().registerUser(firstName: firstName, lastName: lastName, email: email, password: password, completion: {(user) in
            
            if let user = user {
                User.setCurrent(user, writeToUserDefaults: true)
                self.presentHomeVC()
            }
        })
    }
    
    
}
