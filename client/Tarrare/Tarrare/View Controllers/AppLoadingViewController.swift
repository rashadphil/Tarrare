//
//  AppLoadingViewController.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/22/22.
//

import Foundation
import UIKit

class AppLoadingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadNeededUserInfo()
   }
    
    // Loads all info need and then presents main view controller when finished
    func loadNeededUserInfo() {
        let dispatchGroup = DispatchGroup()
        
        // Delivery Info
        dispatchGroup.enter()
        Delivery.fetchCurrentFromDatabase { delivery in
            DispatchQueue.main.async {
                Delivery.userCurrent = delivery
                dispatchGroup.leave()
            }
        }
        
        // Order Info
        dispatchGroup.enter()
        Order.fetchCurrentFromDatabase { order in
            DispatchQueue.main.async {
                Order.userCurrent = order
                dispatchGroup.leave()
            }
        }
        
        
        dispatchGroup.notify(queue: .main) {
            let mainTabBarController = MainTabBarController()
            mainTabBarController.modalPresentationStyle = .fullScreen
            self.present(mainTabBarController, animated: false)

        }
    }
}
