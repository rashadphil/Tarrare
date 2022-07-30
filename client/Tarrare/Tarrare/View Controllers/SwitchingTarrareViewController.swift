//
//  SwitchingTarrareViewController.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/29/22.
//

import Foundation
import UIKit

enum CurrentTarrare {
    case delivering
    case ordering
}

class SwitchingTarrareViewController : UIViewController {
    var currentTarrare : CurrentTarrare? {
        didSet {
            guard let currentTarrare = currentTarrare else { return }

            switch currentTarrare {
            case .delivering:
                iconImageView.image = UIImage(named: "figure.walk.motion")
                endIconImage = UIImage(systemName: "takeoutbag.and.cup.and.straw")
                switchingLabel.text = "Switching to ordering"
                break
            case .ordering:
                iconImageView.image = UIImage(systemName: "takeoutbag.and.cup.and.straw")
                endIconImage = UIImage(named: "figure.walk.motion")
                switchingLabel.text = "Switching to delivering"
                break
            }
        }
    }
    
    var endIconImage : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#242422")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.animateIcon()
    }
    
    func animateIcon() {
        let firstHalfRotationTransform = CATransform3DRotate(self.iconImageView.layer.transform, CGFloat.pi/2, 0, 1, 0)
        
        UIView.animate(withDuration: 0.25, delay: 0.3, animations: {
            self.iconImageView.layer.transform = firstHalfRotationTransform
            
        }, completion: {_ in
            
            self.iconImageView.image = self.endIconImage
            let secondHalfRotationTransform = CATransform3DRotate(self.iconImageView.layer.transform, -CGFloat.pi/2, 0, 1, 0)
            
            UIView.animate(withDuration: 0.25) {
                self.iconImageView.layer.transform = secondHalfRotationTransform
            }
        })
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        view.addSubview(centerStackView)
        centerStackView.addArrangedSubview(iconImageView)
        centerStackView.addArrangedSubview(switchingLabel)
        
        centerStackView.frame = CGRect(x: 0, y: 0, width: 200, height: 120)
        centerStackView.center = view.center
        
        iconImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    
    let iconImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        return imageView
    }()
    
    let centerStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .center
        stackview.distribution = .fillEqually
        return stackview
    }()
    
    let switchingLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.FontDefaults.medium, size: 18)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
}
