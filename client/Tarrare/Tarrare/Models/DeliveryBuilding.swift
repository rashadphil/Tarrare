//
//  DeliveryBuilding.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/13/22.
//

import Foundation

class DeliveryBuilding: Codable {
    let placeId : Int
    let place : Place
    
    enum CodingKeys: String, CodingKey {
        case placeId
        case place
    }
    
    init(_ place: Place){
        self.placeId = 0
        self.place = place
    }
}
