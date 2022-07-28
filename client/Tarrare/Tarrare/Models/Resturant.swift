//
//  Resturant.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/13/22.
//

import Foundation
import UIKit

class Resturant: Codable {
    let place : Place
    
    enum CodingKeys: String, CodingKey {
        case place
    }
    
    init(_ place: Place){
        self.place = place
    }

    func setLogoForImageView(imageView: UIImageView) {
        if let websiteURL = self.place.websiteURL {
            let logoLink = "https://logo.clearbit.com/\(websiteURL)"
            imageView.downloaded(from: logoLink)
        }
        
    }
}
