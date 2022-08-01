//
//  Match.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/20/22.
//

import Foundation
import UIKit

class Match: Codable {
    let id : Int
    let deliveryId: Int
    let delivery: Delivery
    let orderId: Int
    let order: Order
    let completed: Bool
    let delivererAccepted: Bool
    let ordererAccepted: Bool
    
    enum CodingKeys: String, CodingKey {
      case id 
      case deliveryId
      case delivery
      case orderId
      case order
      case completed
      case delivererAccepted
      case ordererAccepted
    }
    
    static func acceptMatch(matchId: Int, completion: @escaping(Match?) -> Void) {
        APIManager.shared().call(key: "acceptMatch", mutation: AcceptMatchMutation(matchId: matchId), completion: completion)
    }
    
    static func declineMatch(matchId: Int, completion: @escaping(Match?) -> Void) {
        APIManager.shared().call(key: "declineMatch", mutation: DeclineMatchMutation(matchId: matchId), completion: completion)
    }
    
    static func newMatchListen(completion: @escaping(Match?) -> Void) {
        let _ = APIManager.shared().call(key: "newMatch", subscription: NewMatchListenSubscription(), completion: completion)
    }
    
    static func updateMatchListen(completion: @escaping(Match?) -> Void) {
        let _ = APIManager.shared().call(key: "matchUpdate", subscription: UpdateMatchListenSubscription(), completion: completion)
    }
    
}

