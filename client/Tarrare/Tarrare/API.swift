// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class AcceptMatchMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AcceptMatch($matchId: Int!) {
      acceptMatch(matchId: $matchId) {
        __typename
        ...MatchInfo
      }
    }
    """

  public let operationName: String = "AcceptMatch"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + MatchInfo.fragmentDefinition)
    document.append("\n" + DeliveryInfo.fragmentDefinition)
    document.append("\n" + PlaceInfo.fragmentDefinition)
    document.append("\n" + UserInfo.fragmentDefinition)
    document.append("\n" + OrderInfo.fragmentDefinition)
    return document
  }

  public var matchId: Int

  public init(matchId: Int) {
    self.matchId = matchId
  }

  public var variables: GraphQLMap? {
    return ["matchId": matchId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("acceptMatch", arguments: ["matchId": GraphQLVariable("matchId")], type: .object(AcceptMatch.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(acceptMatch: AcceptMatch? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "acceptMatch": acceptMatch.flatMap { (value: AcceptMatch) -> ResultMap in value.resultMap }])
    }

    public var acceptMatch: AcceptMatch? {
      get {
        return (resultMap["acceptMatch"] as? ResultMap).flatMap { AcceptMatch(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "acceptMatch")
      }
    }

    public struct AcceptMatch: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Match"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(MatchInfo.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var matchInfo: MatchInfo {
          get {
            return MatchInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class AllDeliveriesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query AllDeliveries {
      allDeliveries {
        __typename
        ...DeliveryInfo
      }
    }
    """

  public let operationName: String = "AllDeliveries"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + DeliveryInfo.fragmentDefinition)
    document.append("\n" + PlaceInfo.fragmentDefinition)
    document.append("\n" + UserInfo.fragmentDefinition)
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("allDeliveries", type: .nonNull(.list(.object(AllDelivery.selections)))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allDeliveries: [AllDelivery?]) {
      self.init(unsafeResultMap: ["__typename": "Query", "allDeliveries": allDeliveries.map { (value: AllDelivery?) -> ResultMap? in value.flatMap { (value: AllDelivery) -> ResultMap in value.resultMap } }])
    }

    public var allDeliveries: [AllDelivery?] {
      get {
        return (resultMap["allDeliveries"] as! [ResultMap?]).map { (value: ResultMap?) -> AllDelivery? in value.flatMap { (value: ResultMap) -> AllDelivery in AllDelivery(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: AllDelivery?) -> ResultMap? in value.flatMap { (value: AllDelivery) -> ResultMap in value.resultMap } }, forKey: "allDeliveries")
      }
    }

    public struct AllDelivery: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Delivery"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(DeliveryInfo.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var deliveryInfo: DeliveryInfo {
          get {
            return DeliveryInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class CancelDeliveryMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CancelDelivery($deliveryId: Int!) {
      cancelDelivery(deliveryId: $deliveryId) {
        __typename
        ...DeliveryInfo
      }
    }
    """

  public let operationName: String = "CancelDelivery"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + DeliveryInfo.fragmentDefinition)
    document.append("\n" + PlaceInfo.fragmentDefinition)
    document.append("\n" + UserInfo.fragmentDefinition)
    return document
  }

  public var deliveryId: Int

  public init(deliveryId: Int) {
    self.deliveryId = deliveryId
  }

  public var variables: GraphQLMap? {
    return ["deliveryId": deliveryId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("cancelDelivery", arguments: ["deliveryId": GraphQLVariable("deliveryId")], type: .object(CancelDelivery.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(cancelDelivery: CancelDelivery? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "cancelDelivery": cancelDelivery.flatMap { (value: CancelDelivery) -> ResultMap in value.resultMap }])
    }

    public var cancelDelivery: CancelDelivery? {
      get {
        return (resultMap["cancelDelivery"] as? ResultMap).flatMap { CancelDelivery(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "cancelDelivery")
      }
    }

    public struct CancelDelivery: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Delivery"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(DeliveryInfo.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var deliveryInfo: DeliveryInfo {
          get {
            return DeliveryInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class CancelOrderMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CancelOrder($orderId: Int!) {
      cancelOrder(ordererId: $orderId) {
        __typename
        ...OrderInfo
      }
    }
    """

  public let operationName: String = "CancelOrder"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + OrderInfo.fragmentDefinition)
    document.append("\n" + PlaceInfo.fragmentDefinition)
    document.append("\n" + UserInfo.fragmentDefinition)
    return document
  }

  public var orderId: Int

  public init(orderId: Int) {
    self.orderId = orderId
  }

  public var variables: GraphQLMap? {
    return ["orderId": orderId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("cancelOrder", arguments: ["ordererId": GraphQLVariable("orderId")], type: .object(CancelOrder.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(cancelOrder: CancelOrder? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "cancelOrder": cancelOrder.flatMap { (value: CancelOrder) -> ResultMap in value.resultMap }])
    }

    public var cancelOrder: CancelOrder? {
      get {
        return (resultMap["cancelOrder"] as? ResultMap).flatMap { CancelOrder(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "cancelOrder")
      }
    }

    public struct CancelOrder: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Order"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(OrderInfo.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var orderInfo: OrderInfo {
          get {
            return OrderInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class CreatePlaceMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreatePlace($name: String!, $fullAddress: String!, $streetAddress: String!, $state: String!, $city: String!, $zipcode: Int!, $googlePlaceId: String!) {
      createPlace(
        name: $name
        fullAddress: $fullAddress
        streetAddress: $streetAddress
        state: $state
        city: $city
        zipcode: $zipcode
        googlePlaceId: $googlePlaceId
      ) {
        __typename
        ...PlaceInfo
      }
    }
    """

  public let operationName: String = "CreatePlace"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + PlaceInfo.fragmentDefinition)
    return document
  }

  public var name: String
  public var fullAddress: String
  public var streetAddress: String
  public var state: String
  public var city: String
  public var zipcode: Int
  public var googlePlaceId: String

  public init(name: String, fullAddress: String, streetAddress: String, state: String, city: String, zipcode: Int, googlePlaceId: String) {
    self.name = name
    self.fullAddress = fullAddress
    self.streetAddress = streetAddress
    self.state = state
    self.city = city
    self.zipcode = zipcode
    self.googlePlaceId = googlePlaceId
  }

  public var variables: GraphQLMap? {
    return ["name": name, "fullAddress": fullAddress, "streetAddress": streetAddress, "state": state, "city": city, "zipcode": zipcode, "googlePlaceId": googlePlaceId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createPlace", arguments: ["name": GraphQLVariable("name"), "fullAddress": GraphQLVariable("fullAddress"), "streetAddress": GraphQLVariable("streetAddress"), "state": GraphQLVariable("state"), "city": GraphQLVariable("city"), "zipcode": GraphQLVariable("zipcode"), "googlePlaceId": GraphQLVariable("googlePlaceId")], type: .object(CreatePlace.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createPlace: CreatePlace? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createPlace": createPlace.flatMap { (value: CreatePlace) -> ResultMap in value.resultMap }])
    }

    public var createPlace: CreatePlace? {
      get {
        return (resultMap["createPlace"] as? ResultMap).flatMap { CreatePlace(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createPlace")
      }
    }

    public struct CreatePlace: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Place"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(PlaceInfo.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, name: String, fullAddress: String, streetAddress: String, state: String, city: String, zipcode: Int, googlePlaceId: String) {
        self.init(unsafeResultMap: ["__typename": "Place", "id": id, "name": name, "fullAddress": fullAddress, "streetAddress": streetAddress, "state": state, "city": city, "zipcode": zipcode, "googlePlaceId": googlePlaceId])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var placeInfo: PlaceInfo {
          get {
            return PlaceInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class DeclineMatchMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DeclineMatch($matchId: Int!) {
      declineMatch(matchId: $matchId) {
        __typename
        ...MatchInfo
      }
    }
    """

  public let operationName: String = "DeclineMatch"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + MatchInfo.fragmentDefinition)
    document.append("\n" + DeliveryInfo.fragmentDefinition)
    document.append("\n" + PlaceInfo.fragmentDefinition)
    document.append("\n" + UserInfo.fragmentDefinition)
    document.append("\n" + OrderInfo.fragmentDefinition)
    return document
  }

  public var matchId: Int

  public init(matchId: Int) {
    self.matchId = matchId
  }

  public var variables: GraphQLMap? {
    return ["matchId": matchId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("declineMatch", arguments: ["matchId": GraphQLVariable("matchId")], type: .object(DeclineMatch.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(declineMatch: DeclineMatch? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "declineMatch": declineMatch.flatMap { (value: DeclineMatch) -> ResultMap in value.resultMap }])
    }

    public var declineMatch: DeclineMatch? {
      get {
        return (resultMap["declineMatch"] as? ResultMap).flatMap { DeclineMatch(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "declineMatch")
      }
    }

    public struct DeclineMatch: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Match"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(MatchInfo.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var matchInfo: MatchInfo {
          get {
            return MatchInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class GetUserDeliveryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetUserDelivery($userId: Int!) {
      getUserDelivery(userId: $userId) {
        __typename
        ...DeliveryInfo
      }
    }
    """

  public let operationName: String = "GetUserDelivery"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + DeliveryInfo.fragmentDefinition)
    document.append("\n" + PlaceInfo.fragmentDefinition)
    document.append("\n" + UserInfo.fragmentDefinition)
    return document
  }

  public var userId: Int

  public init(userId: Int) {
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getUserDelivery", arguments: ["userId": GraphQLVariable("userId")], type: .object(GetUserDelivery.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getUserDelivery: GetUserDelivery? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getUserDelivery": getUserDelivery.flatMap { (value: GetUserDelivery) -> ResultMap in value.resultMap }])
    }

    public var getUserDelivery: GetUserDelivery? {
      get {
        return (resultMap["getUserDelivery"] as? ResultMap).flatMap { GetUserDelivery(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "getUserDelivery")
      }
    }

    public struct GetUserDelivery: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Delivery"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(DeliveryInfo.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var deliveryInfo: DeliveryInfo {
          get {
            return DeliveryInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class GetUserOrderQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetUserOrder($userId: Int!) {
      getUserOrder(userId: $userId) {
        __typename
        ...OrderInfo
      }
    }
    """

  public let operationName: String = "GetUserOrder"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + OrderInfo.fragmentDefinition)
    document.append("\n" + PlaceInfo.fragmentDefinition)
    document.append("\n" + UserInfo.fragmentDefinition)
    return document
  }

  public var userId: Int

  public init(userId: Int) {
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getUserOrder", arguments: ["userId": GraphQLVariable("userId")], type: .object(GetUserOrder.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getUserOrder: GetUserOrder? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getUserOrder": getUserOrder.flatMap { (value: GetUserOrder) -> ResultMap in value.resultMap }])
    }

    public var getUserOrder: GetUserOrder? {
      get {
        return (resultMap["getUserOrder"] as? ResultMap).flatMap { GetUserOrder(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "getUserOrder")
      }
    }

    public struct GetUserOrder: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Order"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(OrderInfo.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var orderInfo: OrderInfo {
          get {
            return OrderInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class NewMatchListenSubscription: GraphQLSubscription {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    subscription NewMatchListen {
      newMatch {
        __typename
        ...MatchInfo
      }
    }
    """

  public let operationName: String = "NewMatchListen"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + MatchInfo.fragmentDefinition)
    document.append("\n" + DeliveryInfo.fragmentDefinition)
    document.append("\n" + PlaceInfo.fragmentDefinition)
    document.append("\n" + UserInfo.fragmentDefinition)
    document.append("\n" + OrderInfo.fragmentDefinition)
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Subscription"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("newMatch", type: .object(NewMatch.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(newMatch: NewMatch? = nil) {
      self.init(unsafeResultMap: ["__typename": "Subscription", "newMatch": newMatch.flatMap { (value: NewMatch) -> ResultMap in value.resultMap }])
    }

    public var newMatch: NewMatch? {
      get {
        return (resultMap["newMatch"] as? ResultMap).flatMap { NewMatch(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "newMatch")
      }
    }

    public struct NewMatch: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Match"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(MatchInfo.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var matchInfo: MatchInfo {
          get {
            return MatchInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class UpsertDeliveryMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpsertDelivery($userId: Int!, $orderStatus: String!, $resturantPlaceId: Int!, $deliveryBuildingPlaceId: Int!) {
      upsertDelivery(
        userId: $userId
        orderStatus: $orderStatus
        resturantPlaceId: $resturantPlaceId
        deliveryBuildingPlaceId: $deliveryBuildingPlaceId
      ) {
        __typename
        ...DeliveryInfo
      }
    }
    """

  public let operationName: String = "UpsertDelivery"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + DeliveryInfo.fragmentDefinition)
    document.append("\n" + PlaceInfo.fragmentDefinition)
    document.append("\n" + UserInfo.fragmentDefinition)
    return document
  }

  public var userId: Int
  public var orderStatus: String
  public var resturantPlaceId: Int
  public var deliveryBuildingPlaceId: Int

  public init(userId: Int, orderStatus: String, resturantPlaceId: Int, deliveryBuildingPlaceId: Int) {
    self.userId = userId
    self.orderStatus = orderStatus
    self.resturantPlaceId = resturantPlaceId
    self.deliveryBuildingPlaceId = deliveryBuildingPlaceId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "orderStatus": orderStatus, "resturantPlaceId": resturantPlaceId, "deliveryBuildingPlaceId": deliveryBuildingPlaceId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("upsertDelivery", arguments: ["userId": GraphQLVariable("userId"), "orderStatus": GraphQLVariable("orderStatus"), "resturantPlaceId": GraphQLVariable("resturantPlaceId"), "deliveryBuildingPlaceId": GraphQLVariable("deliveryBuildingPlaceId")], type: .object(UpsertDelivery.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(upsertDelivery: UpsertDelivery? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "upsertDelivery": upsertDelivery.flatMap { (value: UpsertDelivery) -> ResultMap in value.resultMap }])
    }

    public var upsertDelivery: UpsertDelivery? {
      get {
        return (resultMap["upsertDelivery"] as? ResultMap).flatMap { UpsertDelivery(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "upsertDelivery")
      }
    }

    public struct UpsertDelivery: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Delivery"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(DeliveryInfo.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var deliveryInfo: DeliveryInfo {
          get {
            return DeliveryInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class UpsertOrderMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpsertOrder($userId: Int!, $orderStatus: String!, $resturantPlaceId: Int!, $deliveryBuildingPlaceId: Int!) {
      upsertOrder(
        userId: $userId
        orderStatus: $orderStatus
        resturantPlaceId: $resturantPlaceId
        deliveryBuildingPlaceId: $deliveryBuildingPlaceId
      ) {
        __typename
        ...OrderInfo
      }
    }
    """

  public let operationName: String = "UpsertOrder"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + OrderInfo.fragmentDefinition)
    document.append("\n" + PlaceInfo.fragmentDefinition)
    document.append("\n" + UserInfo.fragmentDefinition)
    return document
  }

  public var userId: Int
  public var orderStatus: String
  public var resturantPlaceId: Int
  public var deliveryBuildingPlaceId: Int

  public init(userId: Int, orderStatus: String, resturantPlaceId: Int, deliveryBuildingPlaceId: Int) {
    self.userId = userId
    self.orderStatus = orderStatus
    self.resturantPlaceId = resturantPlaceId
    self.deliveryBuildingPlaceId = deliveryBuildingPlaceId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "orderStatus": orderStatus, "resturantPlaceId": resturantPlaceId, "deliveryBuildingPlaceId": deliveryBuildingPlaceId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("upsertOrder", arguments: ["userId": GraphQLVariable("userId"), "orderStatus": GraphQLVariable("orderStatus"), "resturantPlaceId": GraphQLVariable("resturantPlaceId"), "deliveryBuildingPlaceId": GraphQLVariable("deliveryBuildingPlaceId")], type: .object(UpsertOrder.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(upsertOrder: UpsertOrder? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "upsertOrder": upsertOrder.flatMap { (value: UpsertOrder) -> ResultMap in value.resultMap }])
    }

    public var upsertOrder: UpsertOrder? {
      get {
        return (resultMap["upsertOrder"] as? ResultMap).flatMap { UpsertOrder(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "upsertOrder")
      }
    }

    public struct UpsertOrder: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Order"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(OrderInfo.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var orderInfo: OrderInfo {
          get {
            return OrderInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class CreateMessageMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateMessage($text: String!, $senderId: Int!, $recieverId: Int!) {
      createMessage(text: $text, senderId: $senderId, recieverId: $recieverId) {
        __typename
        ...MessageInfo
      }
    }
    """

  public let operationName: String = "CreateMessage"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + MessageInfo.fragmentDefinition)
    return document
  }

  public var text: String
  public var senderId: Int
  public var recieverId: Int

  public init(text: String, senderId: Int, recieverId: Int) {
    self.text = text
    self.senderId = senderId
    self.recieverId = recieverId
  }

  public var variables: GraphQLMap? {
    return ["text": text, "senderId": senderId, "recieverId": recieverId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createMessage", arguments: ["text": GraphQLVariable("text"), "senderId": GraphQLVariable("senderId"), "recieverId": GraphQLVariable("recieverId")], type: .object(CreateMessage.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createMessage: CreateMessage? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createMessage": createMessage.flatMap { (value: CreateMessage) -> ResultMap in value.resultMap }])
    }

    public var createMessage: CreateMessage? {
      get {
        return (resultMap["createMessage"] as? ResultMap).flatMap { CreateMessage(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createMessage")
      }
    }

    public struct CreateMessage: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Message"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(MessageInfo.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(createdAt: String, id: Int, recieverId: Int, senderId: Int, text: String, convoId: Int) {
        self.init(unsafeResultMap: ["__typename": "Message", "createdAt": createdAt, "id": id, "recieverId": recieverId, "senderId": senderId, "text": text, "convoId": convoId])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var messageInfo: MessageInfo {
          get {
            return MessageInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class GetConversationQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetConversation($senderId: Int!, $recieverId: Int!) {
      getConversation(senderId: $senderId, recieverId: $recieverId) {
        __typename
        ...MessageInfo
      }
    }
    """

  public let operationName: String = "GetConversation"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + MessageInfo.fragmentDefinition)
    return document
  }

  public var senderId: Int
  public var recieverId: Int

  public init(senderId: Int, recieverId: Int) {
    self.senderId = senderId
    self.recieverId = recieverId
  }

  public var variables: GraphQLMap? {
    return ["senderId": senderId, "recieverId": recieverId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getConversation", arguments: ["senderId": GraphQLVariable("senderId"), "recieverId": GraphQLVariable("recieverId")], type: .nonNull(.list(.object(GetConversation.selections)))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getConversation: [GetConversation?]) {
      self.init(unsafeResultMap: ["__typename": "Query", "getConversation": getConversation.map { (value: GetConversation?) -> ResultMap? in value.flatMap { (value: GetConversation) -> ResultMap in value.resultMap } }])
    }

    public var getConversation: [GetConversation?] {
      get {
        return (resultMap["getConversation"] as! [ResultMap?]).map { (value: ResultMap?) -> GetConversation? in value.flatMap { (value: ResultMap) -> GetConversation in GetConversation(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: GetConversation?) -> ResultMap? in value.flatMap { (value: GetConversation) -> ResultMap in value.resultMap } }, forKey: "getConversation")
      }
    }

    public struct GetConversation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Message"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(MessageInfo.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(createdAt: String, id: Int, recieverId: Int, senderId: Int, text: String, convoId: Int) {
        self.init(unsafeResultMap: ["__typename": "Message", "createdAt": createdAt, "id": id, "recieverId": recieverId, "senderId": senderId, "text": text, "convoId": convoId])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var messageInfo: MessageInfo {
          get {
            return MessageInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class GetUserConversationsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetUserConversations($currentUserId: Int!) {
      getUserConversations(currentUserId: $currentUserId) {
        __typename
        id
        memberOneId
        memberOne {
          __typename
          ...UserInfo
        }
        memberTwoId
        memberTwo {
          __typename
          ...UserInfo
        }
        messages {
          __typename
          ...MessageInfo
        }
      }
    }
    """

  public let operationName: String = "GetUserConversations"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + UserInfo.fragmentDefinition)
    document.append("\n" + MessageInfo.fragmentDefinition)
    return document
  }

  public var currentUserId: Int

  public init(currentUserId: Int) {
    self.currentUserId = currentUserId
  }

  public var variables: GraphQLMap? {
    return ["currentUserId": currentUserId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getUserConversations", arguments: ["currentUserId": GraphQLVariable("currentUserId")], type: .nonNull(.list(.object(GetUserConversation.selections)))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getUserConversations: [GetUserConversation?]) {
      self.init(unsafeResultMap: ["__typename": "Query", "getUserConversations": getUserConversations.map { (value: GetUserConversation?) -> ResultMap? in value.flatMap { (value: GetUserConversation) -> ResultMap in value.resultMap } }])
    }

    public var getUserConversations: [GetUserConversation?] {
      get {
        return (resultMap["getUserConversations"] as! [ResultMap?]).map { (value: ResultMap?) -> GetUserConversation? in value.flatMap { (value: ResultMap) -> GetUserConversation in GetUserConversation(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: GetUserConversation?) -> ResultMap? in value.flatMap { (value: GetUserConversation) -> ResultMap in value.resultMap } }, forKey: "getUserConversations")
      }
    }

    public struct GetUserConversation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Convo"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("memberOneId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("memberOne", type: .object(MemberOne.selections)),
          GraphQLField("memberTwoId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("memberTwo", type: .object(MemberTwo.selections)),
          GraphQLField("messages", type: .nonNull(.list(.object(Message.selections)))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, memberOneId: Int, memberOne: MemberOne? = nil, memberTwoId: Int, memberTwo: MemberTwo? = nil, messages: [Message?]) {
        self.init(unsafeResultMap: ["__typename": "Convo", "id": id, "memberOneId": memberOneId, "memberOne": memberOne.flatMap { (value: MemberOne) -> ResultMap in value.resultMap }, "memberTwoId": memberTwoId, "memberTwo": memberTwo.flatMap { (value: MemberTwo) -> ResultMap in value.resultMap }, "messages": messages.map { (value: Message?) -> ResultMap? in value.flatMap { (value: Message) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var memberOneId: Int {
        get {
          return resultMap["memberOneId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "memberOneId")
        }
      }

      public var memberOne: MemberOne? {
        get {
          return (resultMap["memberOne"] as? ResultMap).flatMap { MemberOne(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "memberOne")
        }
      }

      public var memberTwoId: Int {
        get {
          return resultMap["memberTwoId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "memberTwoId")
        }
      }

      public var memberTwo: MemberTwo? {
        get {
          return (resultMap["memberTwo"] as? ResultMap).flatMap { MemberTwo(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "memberTwo")
        }
      }

      public var messages: [Message?] {
        get {
          return (resultMap["messages"] as! [ResultMap?]).map { (value: ResultMap?) -> Message? in value.flatMap { (value: ResultMap) -> Message in Message(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Message?) -> ResultMap? in value.flatMap { (value: Message) -> ResultMap in value.resultMap } }, forKey: "messages")
        }
      }

      public struct MemberOne: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(UserInfo.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(email: String, id: Int, firstName: String, lastName: String, delivering: Bool) {
          self.init(unsafeResultMap: ["__typename": "User", "email": email, "id": id, "firstName": firstName, "lastName": lastName, "delivering": delivering])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var userInfo: UserInfo {
            get {
              return UserInfo(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct MemberTwo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(UserInfo.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(email: String, id: Int, firstName: String, lastName: String, delivering: Bool) {
          self.init(unsafeResultMap: ["__typename": "User", "email": email, "id": id, "firstName": firstName, "lastName": lastName, "delivering": delivering])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var userInfo: UserInfo {
            get {
              return UserInfo(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Message"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(MessageInfo.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(createdAt: String, id: Int, recieverId: Int, senderId: Int, text: String, convoId: Int) {
          self.init(unsafeResultMap: ["__typename": "Message", "createdAt": createdAt, "id": id, "recieverId": recieverId, "senderId": senderId, "text": text, "convoId": convoId])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var messageInfo: MessageInfo {
            get {
              return MessageInfo(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class MessageListenSubscription: GraphQLSubscription {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    subscription MessageListen($recieverId: Int!) {
      newMessage(recieverId: $recieverId) {
        __typename
        ...MessageInfo
      }
    }
    """

  public let operationName: String = "MessageListen"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + MessageInfo.fragmentDefinition)
    return document
  }

  public var recieverId: Int

  public init(recieverId: Int) {
    self.recieverId = recieverId
  }

  public var variables: GraphQLMap? {
    return ["recieverId": recieverId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Subscription"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("newMessage", arguments: ["recieverId": GraphQLVariable("recieverId")], type: .object(NewMessage.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(newMessage: NewMessage? = nil) {
      self.init(unsafeResultMap: ["__typename": "Subscription", "newMessage": newMessage.flatMap { (value: NewMessage) -> ResultMap in value.resultMap }])
    }

    public var newMessage: NewMessage? {
      get {
        return (resultMap["newMessage"] as? ResultMap).flatMap { NewMessage(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "newMessage")
      }
    }

    public struct NewMessage: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Message"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(MessageInfo.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(createdAt: String, id: Int, recieverId: Int, senderId: Int, text: String, convoId: Int) {
        self.init(unsafeResultMap: ["__typename": "Message", "createdAt": createdAt, "id": id, "recieverId": recieverId, "senderId": senderId, "text": text, "convoId": convoId])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var messageInfo: MessageInfo {
          get {
            return MessageInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class LoginUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation LoginUser($email: String!, $password: String!) {
      login(email: $email, password: $password) {
        __typename
        ...UserInfo
      }
    }
    """

  public let operationName: String = "LoginUser"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + UserInfo.fragmentDefinition)
    return document
  }

  public var email: String
  public var password: String

  public init(email: String, password: String) {
    self.email = email
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["email": email, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("login", arguments: ["email": GraphQLVariable("email"), "password": GraphQLVariable("password")], type: .object(Login.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.flatMap { (value: Login) -> ResultMap in value.resultMap }])
    }

    public var login: Login? {
      get {
        return (resultMap["login"] as? ResultMap).flatMap { Login(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(UserInfo.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(email: String, id: Int, firstName: String, lastName: String, delivering: Bool) {
        self.init(unsafeResultMap: ["__typename": "User", "email": email, "id": id, "firstName": firstName, "lastName": lastName, "delivering": delivering])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var userInfo: UserInfo {
          get {
            return UserInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class RegisterUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation RegisterUser($firstName: String!, $lastName: String!, $email: String!, $password: String!) {
      register(
        firstName: $firstName
        lastName: $lastName
        email: $email
        password: $password
      ) {
        __typename
        ...UserInfo
      }
    }
    """

  public let operationName: String = "RegisterUser"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + UserInfo.fragmentDefinition)
    return document
  }

  public var firstName: String
  public var lastName: String
  public var email: String
  public var password: String

  public init(firstName: String, lastName: String, email: String, password: String) {
    self.firstName = firstName
    self.lastName = lastName
    self.email = email
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["firstName": firstName, "lastName": lastName, "email": email, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("register", arguments: ["firstName": GraphQLVariable("firstName"), "lastName": GraphQLVariable("lastName"), "email": GraphQLVariable("email"), "password": GraphQLVariable("password")], type: .object(Register.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(register: Register? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "register": register.flatMap { (value: Register) -> ResultMap in value.resultMap }])
    }

    public var register: Register? {
      get {
        return (resultMap["register"] as? ResultMap).flatMap { Register(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "register")
      }
    }

    public struct Register: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(UserInfo.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(email: String, id: Int, firstName: String, lastName: String, delivering: Bool) {
        self.init(unsafeResultMap: ["__typename": "User", "email": email, "id": id, "firstName": firstName, "lastName": lastName, "delivering": delivering])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var userInfo: UserInfo {
          get {
            return UserInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public struct PlaceInfo: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment PlaceInfo on Place {
      __typename
      id
      name
      fullAddress
      streetAddress
      state
      city
      zipcode
      googlePlaceId
    }
    """

  public static let possibleTypes: [String] = ["Place"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(Int.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("fullAddress", type: .nonNull(.scalar(String.self))),
      GraphQLField("streetAddress", type: .nonNull(.scalar(String.self))),
      GraphQLField("state", type: .nonNull(.scalar(String.self))),
      GraphQLField("city", type: .nonNull(.scalar(String.self))),
      GraphQLField("zipcode", type: .nonNull(.scalar(Int.self))),
      GraphQLField("googlePlaceId", type: .nonNull(.scalar(String.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: Int, name: String, fullAddress: String, streetAddress: String, state: String, city: String, zipcode: Int, googlePlaceId: String) {
    self.init(unsafeResultMap: ["__typename": "Place", "id": id, "name": name, "fullAddress": fullAddress, "streetAddress": streetAddress, "state": state, "city": city, "zipcode": zipcode, "googlePlaceId": googlePlaceId])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: Int {
    get {
      return resultMap["id"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var fullAddress: String {
    get {
      return resultMap["fullAddress"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "fullAddress")
    }
  }

  public var streetAddress: String {
    get {
      return resultMap["streetAddress"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "streetAddress")
    }
  }

  public var state: String {
    get {
      return resultMap["state"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "state")
    }
  }

  public var city: String {
    get {
      return resultMap["city"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "city")
    }
  }

  public var zipcode: Int {
    get {
      return resultMap["zipcode"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "zipcode")
    }
  }

  public var googlePlaceId: String {
    get {
      return resultMap["googlePlaceId"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "googlePlaceId")
    }
  }
}

public struct UserInfo: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment UserInfo on User {
      __typename
      email
      id
      firstName
      lastName
      delivering
    }
    """

  public static let possibleTypes: [String] = ["User"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("email", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(Int.self))),
      GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
      GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
      GraphQLField("delivering", type: .nonNull(.scalar(Bool.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(email: String, id: Int, firstName: String, lastName: String, delivering: Bool) {
    self.init(unsafeResultMap: ["__typename": "User", "email": email, "id": id, "firstName": firstName, "lastName": lastName, "delivering": delivering])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var email: String {
    get {
      return resultMap["email"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "email")
    }
  }

  public var id: Int {
    get {
      return resultMap["id"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var firstName: String {
    get {
      return resultMap["firstName"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "firstName")
    }
  }

  public var lastName: String {
    get {
      return resultMap["lastName"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "lastName")
    }
  }

  public var delivering: Bool {
    get {
      return resultMap["delivering"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "delivering")
    }
  }
}

public struct OrderInfo: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment OrderInfo on Order {
      __typename
      deliveryBuilding {
        __typename
        placeId
        place {
          __typename
          ...PlaceInfo
        }
      }
      deliveryBuildingPlaceId
      id
      orderStatus
      resturant {
        __typename
        placeId
        place {
          __typename
          ...PlaceInfo
        }
      }
      resturantPlaceId
      user {
        __typename
        ...UserInfo
      }
      userId
    }
    """

  public static let possibleTypes: [String] = ["Order"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("deliveryBuilding", type: .object(DeliveryBuilding.selections)),
      GraphQLField("deliveryBuildingPlaceId", type: .nonNull(.scalar(Int.self))),
      GraphQLField("id", type: .nonNull(.scalar(Int.self))),
      GraphQLField("orderStatus", type: .nonNull(.scalar(String.self))),
      GraphQLField("resturant", type: .object(Resturant.selections)),
      GraphQLField("resturantPlaceId", type: .nonNull(.scalar(Int.self))),
      GraphQLField("user", type: .object(User.selections)),
      GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(deliveryBuilding: DeliveryBuilding? = nil, deliveryBuildingPlaceId: Int, id: Int, orderStatus: String, resturant: Resturant? = nil, resturantPlaceId: Int, user: User? = nil, userId: Int) {
    self.init(unsafeResultMap: ["__typename": "Order", "deliveryBuilding": deliveryBuilding.flatMap { (value: DeliveryBuilding) -> ResultMap in value.resultMap }, "deliveryBuildingPlaceId": deliveryBuildingPlaceId, "id": id, "orderStatus": orderStatus, "resturant": resturant.flatMap { (value: Resturant) -> ResultMap in value.resultMap }, "resturantPlaceId": resturantPlaceId, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "userId": userId])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var deliveryBuilding: DeliveryBuilding? {
    get {
      return (resultMap["deliveryBuilding"] as? ResultMap).flatMap { DeliveryBuilding(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "deliveryBuilding")
    }
  }

  public var deliveryBuildingPlaceId: Int {
    get {
      return resultMap["deliveryBuildingPlaceId"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "deliveryBuildingPlaceId")
    }
  }

  public var id: Int {
    get {
      return resultMap["id"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var orderStatus: String {
    get {
      return resultMap["orderStatus"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "orderStatus")
    }
  }

  public var resturant: Resturant? {
    get {
      return (resultMap["resturant"] as? ResultMap).flatMap { Resturant(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "resturant")
    }
  }

  public var resturantPlaceId: Int {
    get {
      return resultMap["resturantPlaceId"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "resturantPlaceId")
    }
  }

  public var user: User? {
    get {
      return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "user")
    }
  }

  public var userId: Int {
    get {
      return resultMap["userId"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "userId")
    }
  }

  public struct DeliveryBuilding: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["DeliveryBuilding"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("placeId", type: .nonNull(.scalar(Int.self))),
        GraphQLField("place", type: .object(Place.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(placeId: Int, place: Place? = nil) {
      self.init(unsafeResultMap: ["__typename": "DeliveryBuilding", "placeId": placeId, "place": place.flatMap { (value: Place) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var placeId: Int {
      get {
        return resultMap["placeId"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "placeId")
      }
    }

    public var place: Place? {
      get {
        return (resultMap["place"] as? ResultMap).flatMap { Place(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "place")
      }
    }

    public struct Place: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Place"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(PlaceInfo.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, name: String, fullAddress: String, streetAddress: String, state: String, city: String, zipcode: Int, googlePlaceId: String) {
        self.init(unsafeResultMap: ["__typename": "Place", "id": id, "name": name, "fullAddress": fullAddress, "streetAddress": streetAddress, "state": state, "city": city, "zipcode": zipcode, "googlePlaceId": googlePlaceId])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var placeInfo: PlaceInfo {
          get {
            return PlaceInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }

  public struct Resturant: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Resturant"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("placeId", type: .nonNull(.scalar(Int.self))),
        GraphQLField("place", type: .object(Place.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(placeId: Int, place: Place? = nil) {
      self.init(unsafeResultMap: ["__typename": "Resturant", "placeId": placeId, "place": place.flatMap { (value: Place) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var placeId: Int {
      get {
        return resultMap["placeId"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "placeId")
      }
    }

    public var place: Place? {
      get {
        return (resultMap["place"] as? ResultMap).flatMap { Place(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "place")
      }
    }

    public struct Place: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Place"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(PlaceInfo.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, name: String, fullAddress: String, streetAddress: String, state: String, city: String, zipcode: Int, googlePlaceId: String) {
        self.init(unsafeResultMap: ["__typename": "Place", "id": id, "name": name, "fullAddress": fullAddress, "streetAddress": streetAddress, "state": state, "city": city, "zipcode": zipcode, "googlePlaceId": googlePlaceId])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var placeInfo: PlaceInfo {
          get {
            return PlaceInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }

  public struct User: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["User"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(UserInfo.self),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(email: String, id: Int, firstName: String, lastName: String, delivering: Bool) {
      self.init(unsafeResultMap: ["__typename": "User", "email": email, "id": id, "firstName": firstName, "lastName": lastName, "delivering": delivering])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var userInfo: UserInfo {
        get {
          return UserInfo(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}

public struct DeliveryInfo: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment DeliveryInfo on Delivery {
      __typename
      deliveryBuilding {
        __typename
        placeId
        place {
          __typename
          ...PlaceInfo
        }
      }
      deliveryBuildingPlaceId
      id
      orderStatus
      resturant {
        __typename
        placeId
        place {
          __typename
          ...PlaceInfo
        }
      }
      resturantPlaceId
      user {
        __typename
        ...UserInfo
      }
      userId
    }
    """

  public static let possibleTypes: [String] = ["Delivery"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("deliveryBuilding", type: .object(DeliveryBuilding.selections)),
      GraphQLField("deliveryBuildingPlaceId", type: .nonNull(.scalar(Int.self))),
      GraphQLField("id", type: .nonNull(.scalar(Int.self))),
      GraphQLField("orderStatus", type: .nonNull(.scalar(String.self))),
      GraphQLField("resturant", type: .object(Resturant.selections)),
      GraphQLField("resturantPlaceId", type: .nonNull(.scalar(Int.self))),
      GraphQLField("user", type: .object(User.selections)),
      GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(deliveryBuilding: DeliveryBuilding? = nil, deliveryBuildingPlaceId: Int, id: Int, orderStatus: String, resturant: Resturant? = nil, resturantPlaceId: Int, user: User? = nil, userId: Int) {
    self.init(unsafeResultMap: ["__typename": "Delivery", "deliveryBuilding": deliveryBuilding.flatMap { (value: DeliveryBuilding) -> ResultMap in value.resultMap }, "deliveryBuildingPlaceId": deliveryBuildingPlaceId, "id": id, "orderStatus": orderStatus, "resturant": resturant.flatMap { (value: Resturant) -> ResultMap in value.resultMap }, "resturantPlaceId": resturantPlaceId, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "userId": userId])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var deliveryBuilding: DeliveryBuilding? {
    get {
      return (resultMap["deliveryBuilding"] as? ResultMap).flatMap { DeliveryBuilding(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "deliveryBuilding")
    }
  }

  public var deliveryBuildingPlaceId: Int {
    get {
      return resultMap["deliveryBuildingPlaceId"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "deliveryBuildingPlaceId")
    }
  }

  public var id: Int {
    get {
      return resultMap["id"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var orderStatus: String {
    get {
      return resultMap["orderStatus"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "orderStatus")
    }
  }

  public var resturant: Resturant? {
    get {
      return (resultMap["resturant"] as? ResultMap).flatMap { Resturant(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "resturant")
    }
  }

  public var resturantPlaceId: Int {
    get {
      return resultMap["resturantPlaceId"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "resturantPlaceId")
    }
  }

  public var user: User? {
    get {
      return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "user")
    }
  }

  public var userId: Int {
    get {
      return resultMap["userId"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "userId")
    }
  }

  public struct DeliveryBuilding: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["DeliveryBuilding"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("placeId", type: .nonNull(.scalar(Int.self))),
        GraphQLField("place", type: .object(Place.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(placeId: Int, place: Place? = nil) {
      self.init(unsafeResultMap: ["__typename": "DeliveryBuilding", "placeId": placeId, "place": place.flatMap { (value: Place) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var placeId: Int {
      get {
        return resultMap["placeId"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "placeId")
      }
    }

    public var place: Place? {
      get {
        return (resultMap["place"] as? ResultMap).flatMap { Place(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "place")
      }
    }

    public struct Place: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Place"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(PlaceInfo.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, name: String, fullAddress: String, streetAddress: String, state: String, city: String, zipcode: Int, googlePlaceId: String) {
        self.init(unsafeResultMap: ["__typename": "Place", "id": id, "name": name, "fullAddress": fullAddress, "streetAddress": streetAddress, "state": state, "city": city, "zipcode": zipcode, "googlePlaceId": googlePlaceId])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var placeInfo: PlaceInfo {
          get {
            return PlaceInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }

  public struct Resturant: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Resturant"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("placeId", type: .nonNull(.scalar(Int.self))),
        GraphQLField("place", type: .object(Place.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(placeId: Int, place: Place? = nil) {
      self.init(unsafeResultMap: ["__typename": "Resturant", "placeId": placeId, "place": place.flatMap { (value: Place) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var placeId: Int {
      get {
        return resultMap["placeId"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "placeId")
      }
    }

    public var place: Place? {
      get {
        return (resultMap["place"] as? ResultMap).flatMap { Place(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "place")
      }
    }

    public struct Place: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Place"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(PlaceInfo.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, name: String, fullAddress: String, streetAddress: String, state: String, city: String, zipcode: Int, googlePlaceId: String) {
        self.init(unsafeResultMap: ["__typename": "Place", "id": id, "name": name, "fullAddress": fullAddress, "streetAddress": streetAddress, "state": state, "city": city, "zipcode": zipcode, "googlePlaceId": googlePlaceId])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var placeInfo: PlaceInfo {
          get {
            return PlaceInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }

  public struct User: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["User"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(UserInfo.self),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(email: String, id: Int, firstName: String, lastName: String, delivering: Bool) {
      self.init(unsafeResultMap: ["__typename": "User", "email": email, "id": id, "firstName": firstName, "lastName": lastName, "delivering": delivering])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var userInfo: UserInfo {
        get {
          return UserInfo(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}

public struct MatchInfo: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment MatchInfo on Match {
      __typename
      completed
      delivererAccepted
      delivery {
        __typename
        ...DeliveryInfo
      }
      deliveryId
      id
      order {
        __typename
        ...OrderInfo
      }
      ordererAccepted
      orderId
    }
    """

  public static let possibleTypes: [String] = ["Match"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("completed", type: .nonNull(.scalar(Bool.self))),
      GraphQLField("delivererAccepted", type: .nonNull(.scalar(Bool.self))),
      GraphQLField("delivery", type: .object(Delivery.selections)),
      GraphQLField("deliveryId", type: .nonNull(.scalar(Int.self))),
      GraphQLField("id", type: .nonNull(.scalar(Int.self))),
      GraphQLField("order", type: .object(Order.selections)),
      GraphQLField("ordererAccepted", type: .nonNull(.scalar(Bool.self))),
      GraphQLField("orderId", type: .nonNull(.scalar(Int.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(completed: Bool, delivererAccepted: Bool, delivery: Delivery? = nil, deliveryId: Int, id: Int, order: Order? = nil, ordererAccepted: Bool, orderId: Int) {
    self.init(unsafeResultMap: ["__typename": "Match", "completed": completed, "delivererAccepted": delivererAccepted, "delivery": delivery.flatMap { (value: Delivery) -> ResultMap in value.resultMap }, "deliveryId": deliveryId, "id": id, "order": order.flatMap { (value: Order) -> ResultMap in value.resultMap }, "ordererAccepted": ordererAccepted, "orderId": orderId])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var completed: Bool {
    get {
      return resultMap["completed"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "completed")
    }
  }

  public var delivererAccepted: Bool {
    get {
      return resultMap["delivererAccepted"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "delivererAccepted")
    }
  }

  public var delivery: Delivery? {
    get {
      return (resultMap["delivery"] as? ResultMap).flatMap { Delivery(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "delivery")
    }
  }

  public var deliveryId: Int {
    get {
      return resultMap["deliveryId"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "deliveryId")
    }
  }

  public var id: Int {
    get {
      return resultMap["id"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var order: Order? {
    get {
      return (resultMap["order"] as? ResultMap).flatMap { Order(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "order")
    }
  }

  public var ordererAccepted: Bool {
    get {
      return resultMap["ordererAccepted"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "ordererAccepted")
    }
  }

  public var orderId: Int {
    get {
      return resultMap["orderId"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "orderId")
    }
  }

  public struct Delivery: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Delivery"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(DeliveryInfo.self),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var deliveryInfo: DeliveryInfo {
        get {
          return DeliveryInfo(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }

  public struct Order: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Order"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(OrderInfo.self),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var orderInfo: OrderInfo {
        get {
          return OrderInfo(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}

public struct MessageInfo: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment MessageInfo on Message {
      __typename
      createdAt
      id
      recieverId
      senderId
      text
      convoId
    }
    """

  public static let possibleTypes: [String] = ["Message"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(Int.self))),
      GraphQLField("recieverId", type: .nonNull(.scalar(Int.self))),
      GraphQLField("senderId", type: .nonNull(.scalar(Int.self))),
      GraphQLField("text", type: .nonNull(.scalar(String.self))),
      GraphQLField("convoId", type: .nonNull(.scalar(Int.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(createdAt: String, id: Int, recieverId: Int, senderId: Int, text: String, convoId: Int) {
    self.init(unsafeResultMap: ["__typename": "Message", "createdAt": createdAt, "id": id, "recieverId": recieverId, "senderId": senderId, "text": text, "convoId": convoId])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var createdAt: String {
    get {
      return resultMap["createdAt"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var id: Int {
    get {
      return resultMap["id"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var recieverId: Int {
    get {
      return resultMap["recieverId"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "recieverId")
    }
  }

  public var senderId: Int {
    get {
      return resultMap["senderId"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "senderId")
    }
  }

  public var text: String {
    get {
      return resultMap["text"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "text")
    }
  }

  public var convoId: Int {
    get {
      return resultMap["convoId"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "convoId")
    }
  }
}
