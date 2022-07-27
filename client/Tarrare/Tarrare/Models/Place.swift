//
//  Place.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/8/22.
//

import Foundation
import FirebaseAuth
import GooglePlaces
import Alamofire

class Place: Codable {
    var id : Int = 0
    var name : String = ""
    var fullAddress: String = ""
    var streetAddress: String = ""
    var state: String = ""
    var city: String = ""
    var zipcode: Int = 0
    var googlePlaceId: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullAddress
        case streetAddress
        case state
        case city
        case zipcode
        case googlePlaceId
    }
    
    func setAddressComponents(_ addressComponents: [GMSAddressComponent]?) {
        for component in addressComponents! {
            let type = component.type
            if type == "locality" {
                self.city = component.name
            } else if type == "street_number" {
                self.streetAddress += "\(component.name) "
            } else if type == "route" {
                self.streetAddress += component.name
            } else if type == "administrative_area_level_1" {
                self.state = component.name
            } else if type == "postal_code" {
                self.zipcode = Int(component.name) ?? 0
            }
        }
        
    }
    
    init(_ gmsPlace: GMSPlace){
        self.name = gmsPlace.name!
        self.fullAddress = gmsPlace.formattedAddress!
        setAddressComponents(gmsPlace.addressComponents)
        self.googlePlaceId = gmsPlace.placeID!
    }
    
    init(_ gmsPrediction: GMSAutocompletePrediction) {
        self.name = gmsPrediction.attributedPrimaryText.string
        self.fullAddress = gmsPrediction.attributedSecondaryText?.string ?? ""
    }
    
    // send the place to database
    func createPlace(completion: @escaping(Place?) -> Void) {
        APIManager.shared().call(key: "createPlace", mutation: CreatePlaceMutation(name: self.name, fullAddress: self.fullAddress, streetAddress: self.streetAddress, state: self.state, city: self.city, zipcode: self.zipcode, googlePlaceId: self.googlePlaceId), completion: completion)
    }
    
}


