//
//  Extension.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/7/22.
//

import Foundation
import UIKit
extension UIView {
 
     func anchor (top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat, enableInsets: Bool) {
         
         var topInset = CGFloat(0)
         var bottomInset = CGFloat(0)
     
         if #available(iOS 11, *), enableInsets {
             let insets = self.safeAreaInsets
             topInset = insets.top
             bottomInset = insets.bottom
         }
     
         translatesAutoresizingMaskIntoConstraints = false
         
         if let top = top {
             self.topAnchor.constraint(equalTo: top, constant: paddingTop+topInset).isActive = true
         }
         if let left = left {
             self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
         }
         if let right = right {
             rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
         }
         if let bottom = bottom {
             bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom-bottomInset).isActive = true
         }
         if height != 0 {
             heightAnchor.constraint(equalToConstant: height).isActive = true
         }
         if width != 0 {
             widthAnchor.constraint(equalToConstant: width).isActive = true
         }
     
     }
 
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

extension UIStackView {
    func addHorizontalSeparator(color : UIColor) {
        var i = self.arrangedSubviews.count - 1
        while i > 0 {
            let separator = createSeparator(color: color)
            insertArrangedSubview(separator, at: i)
            separator.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0).isActive = true
            i -= 1
        }
    }
    
    private func createSeparator(color: UIColor) -> UIView {
        let separator = UIView()
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separator.backgroundColor = color
        return separator
    }
}
