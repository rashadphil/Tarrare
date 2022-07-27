//
//  Delivery.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/12/22.
//

import Foundation
import Alamofire

enum Status: String, Codable {
    case placed
    case matched
    case complete
    case cancelled
    
}

class Delivery: Codable {
    var id : Int 
    var orderStatus : String
    var user : User
    var userId : Int 
    var resturant: Resturant
    var resturantPlaceId: Int
    var deliveryBuilding: DeliveryBuilding
    var deliveryBuildingPlaceId: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId
        case orderStatus
        case user
        case resturant
        case resturantPlaceId
        case deliveryBuilding
        case deliveryBuildingPlaceId
    }
    
    // Tracks user's delivery for app lifetime (initialized at start)
    private static var _userCurrent: Delivery?
    static var userCurrent: Delivery? {
        get {return _userCurrent}
        set (delivery) {
            _userCurrent = delivery
        }
    }
    
    // MARK: - Database Delivery Methods
    
    static func getAllPlacedDeliveries(completion: @escaping([Delivery]?) -> Void) {
        APIManager.shared().call(key: "allDeliveries", query: AllDeliveriesQuery(), completion: completion)
    }
    
    static func fetchCurrentFromDatabase(completion: @escaping(Delivery?) -> Void){
        guard let currentUser = User.getCurrent() else { return }

        APIManager.shared().call(key: "getUserDelivery", query: GetUserDeliveryQuery(userId: currentUser.id), completion: completion)
    }
    
    static func createDelivery(userId: Int, orderStatus: String, resturantPlaceId: Int, deliveryBuildingPlaceId: Int, completion: @escaping(Delivery?) -> Void) {
        APIManager.shared().call(key: "upsertDelivery", mutation: UpsertDeliveryMutation(userId: userId, orderStatus: orderStatus, resturantPlaceId: resturantPlaceId, deliveryBuildingPlaceId: deliveryBuildingPlaceId), completion: completion)
    }
    
    static func cancelDelivery(deliveryId: Int, completion: @escaping(Delivery?) -> Void) {
        APIManager.shared().call(key: "cancelDelivery", mutation: CancelDeliveryMutation(deliveryId: deliveryId), completion: completion)
    }
    
    
}

extension Delivery : Equatable {
    static func == (lhs: Delivery, rhs: Delivery) -> Bool {
        return lhs.id == rhs.id
    }
}


