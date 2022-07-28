//
//  MapsAPI.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/8/22.
//

import Foundation
import GooglePlaces

extension APIManager {
    
    func getCurrentPlace(completion: @escaping (Place) -> Void) {
        let placesClient = GMSPlacesClient.shared()
        let placeFields : GMSPlaceField = [.name, .formattedAddress, .placeID, .addressComponents]
        placesClient.findPlaceLikelihoodsFromCurrentLocation(withPlaceFields: placeFields, callback: { [weak self] (placeLikelihoods, error) in
            
            guard self != nil else {
                return
            }
            
            guard error == nil else {
                print("Current place error: \(error?.localizedDescription ?? "")")
                return
            }
            
            guard let place = placeLikelihoods?.first?.place else {
                return
            }
            
            completion(Place(place))
        })
    }
    
    func placeFromID(placeID: String, sessionToken: GMSAutocompleteSessionToken, completion: @escaping (Place) -> Void) {
        let placesClient = GMSPlacesClient.shared()
        let placeFields : GMSPlaceField = [.name, .formattedAddress, .placeID, .addressComponents, .website]
        
        placesClient.fetchPlace(fromPlaceID: placeID, placeFields: placeFields, sessionToken: sessionToken, callback: {
            (gmsPlace: GMSPlace?, error: Error?) in
            
            if let error = error {
                print("Place from ID Error: \(error.localizedDescription)")
            }
            
            if let gmsPlace = gmsPlace {
                let place = Place(gmsPlace)
                place.createPlace(completion: {createdPlace in
                    if let createdPlace = createdPlace {
                        completion(createdPlace)
                    } else {
                        print("Failed to create Place")
                    }
                })
            }
        })
    }
}
