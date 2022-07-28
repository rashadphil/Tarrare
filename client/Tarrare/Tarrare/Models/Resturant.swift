//
//  Resturant.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/13/22.
//

import Foundation
import UIKit

class Resturant: Codable {
    let placeId: Int
    let place : Place
    
    enum CodingKeys: String, CodingKey {
        case placeId
        case place
    }
    
    init(_ place: Place){
        self.placeId = 0
        self.place = place
    }
    
    static func getAllActiveRestaurants(completion: @escaping([Resturant]?) -> Void) {
        APIManager.shared().call(key: "getAllActiveRestaurants", query: GetAllActiveRestaurantsQuery(), completion: completion)
    }

    func setLogoForImageView(imageView: UIImageView) {
        if let websiteURL = self.place.websiteUrl {
            let logoLink = "https://logo.clearbit.com/\(websiteURL)"
            imageView.downloaded(from: logoLink)
        }
    }
}
