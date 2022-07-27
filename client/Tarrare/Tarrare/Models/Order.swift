//
//  Order.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/21/22.
//

import Foundation
import Alamofire


class Order: Codable {
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
    
    // Tracks user's order for app lifetime (initialized at start)
    private static var _userCurrent: Order?
    static var userCurrent: Order? {
        get {return _userCurrent}
        set (order) {
            _userCurrent = order
        }
    }

    // MARK: - Database Order Methods
    
    static func fetchCurrentFromDatabase(completion: @escaping(Order?) -> Void){
        guard let currentUser = User.getCurrent() else { return }

        APIManager.shared().call(key: "getUserOrder", query: GetUserOrderQuery(userId: currentUser.id), completion: completion)
    }
    
    static func createOrder(userId: Int, resturantPlaceId: Int, deliveryBuildingPlaceId: Int, completion: @escaping(Order?) -> Void) {
        APIManager.shared().call(key: "upsertOrder", mutation: UpsertOrderMutation(userId: userId, orderStatus: "placed", resturantPlaceId: resturantPlaceId, deliveryBuildingPlaceId: deliveryBuildingPlaceId), completion: completion)
    }
    
    static func cancelOrder(orderId: Int, completion: @escaping(Order?) -> Void) {
        APIManager.shared().call(key: "cancelOrder", mutation: CancelOrderMutation(orderId: orderId), completion: completion)
    }
}