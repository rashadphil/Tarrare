//
//  LoadingCircleView.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/28/22.
//

import Foundation
import UIKit

class LoadingCircleView : UIView {
    let loadingCircle = CAShapeLayer()
    let backgroundCircle = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLoader()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLoader() {
        self.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        
        let rect = self.bounds
        let circularPath = UIBezierPath(ovalIn: rect)
        
        loadingCircle.path = circularPath.cgPath
        loadingCircle.fillColor = UIColor.clear.cgColor
        loadingCircle.strokeColor = UIColor.black.cgColor
        loadingCircle.lineWidth = 15
        loadingCircle.strokeEnd = 0.30
        loadingCircle.lineCap = .round
        
        backgroundCircle.path = circularPath.cgPath
        backgroundCircle.fillColor = UIColor.clear.cgColor
        backgroundCircle.strokeColor = UIColor(named: "LightGray")!.cgColor
        backgroundCircle.lineWidth = 15
        backgroundCircle.strokeEnd = 1
        backgroundCircle.lineCap = .round
        
        self.layer.addSublayer(backgroundCircle)
        self.layer.addSublayer(loadingCircle)
        
    }
    
    func animate() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            self.transform = CGAffineTransform(rotationAngle: .pi)
        }) { (completed) in
            UIView.animate(withDuration: 0.8, delay: 0, options: .curveLinear, animations: {
                self.transform = CGAffineTransform(rotationAngle: 0)
            }) { (completed) in
                self.animate()
            }
        }
    }
    
}
