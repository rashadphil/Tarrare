//
//  APIManager.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/7/22.
//

import Foundation
import Alamofire
import Apollo
import ApolloWebSocket

import FirebaseAuth

class APIManager {
    
    var endpointURL = "http://localhost:62528/graphql"
    
    /// A web socket transport to use for subscriptions
    private lazy var webSocketTransport: WebSocketTransport = {
        let url = URL(string: endpointURL)!
        let webSocketClient = WebSocket(url: url, protocol: .graphql_transport_ws)
        return WebSocketTransport(websocket: webSocketClient)
    }()
    
    /// An HTTP transport to use for queries and mutations
    private lazy var normalTransport: RequestChainNetworkTransport = {
        let url = URL(string: endpointURL)!
        return RequestChainNetworkTransport(interceptorProvider: DefaultInterceptorProvider(store: self.store), endpointURL: url)
    }()
    
    private lazy var splitNetworkTransport = SplitNetworkTransport(
        uploadingNetworkTransport: self.normalTransport,
        webSocketNetworkTransport: self.webSocketTransport
    )
    
    private(set) lazy var apollo = ApolloClient(networkTransport: self.splitNetworkTransport, store: self.store)
    
    private lazy var store = ApolloStore()
    
    
    private static var sharedAPIManager: APIManager = {
        let apiManager = APIManager()
        return apiManager
    }()
    
    class func shared() -> APIManager {
        return sharedAPIManager
    }
    
    func processGraphQLResult<T>(key: String?, json: JSONObject?) -> T? where T: Decodable {
        guard let json = json else {
            return nil
        }
        
        let result: JSONObject = json
        var jsonObject: Any = result
        if let key = key, let keyedResult = result[key] {
            guard JSONSerialization.isValidJSONObject(keyedResult) else {
                if let keyedResult = keyedResult as? T {
                    return keyedResult
                }
                return nil
            }
            jsonObject = keyedResult
        }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [])
            
            let decoder = JSONDecoder()
            
            // handle any responses with dates
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            let obj = try decoder.decode(T.self, from: jsonData)
            return obj
        } catch let error {
            print(error)
            return nil
        }
        
    }
    
    // Query
    func call<T: Decodable, Query: GraphQLQuery>(key: String, query: Query, cachePolicy : CachePolicy = .fetchIgnoringCacheCompletely, completion: @escaping(T?) -> Void) {
        
        apollo.fetch(query: query, cachePolicy: cachePolicy, resultHandler: {result in
            switch result {
            case .success(let graphQLResult):
                guard let object : T = self.processGraphQLResult(key: key, json: graphQLResult.data?.jsonObject as? JSONObject) else {
                    completion(nil)
                    return
                }
                completion(object)
                break
            case .failure(let error):
                print(error)
                break
            }
        })
    }
    
    // Mutation
    func call<T: Decodable, Mutation: GraphQLMutation>(key: String, mutation: Mutation, completion: @escaping(T?) -> Void) {
        
        apollo.perform(mutation: mutation, resultHandler: {result in
            switch result {
            case .success(let graphQLResult):
                guard let object : T = self.processGraphQLResult(key: key, json: graphQLResult.data?.jsonObject as? JSONObject) else {
                    completion(nil)
                    return
                }
                completion(object)
                break
            case .failure(let error):
                print(error)
                break
            }
        })
    }
    
    // Subscription
    func call<T: Decodable, Subscription: GraphQLSubscription>(key: String, subscription: Subscription, completion: @escaping(T?) -> Void) -> Cancellable {
        let subscription = apollo.subscribe(subscription: subscription , resultHandler: {result in
            switch result {
            case .success(let graphQLResult):
                guard let object : T = self.processGraphQLResult(key: key, json: graphQLResult.data?.jsonObject as? JSONObject) else {
                    completion(nil)
                    return
                }
                completion(object)
                break
            case .failure(let error):
                print(error)
                break
            }
        })
        return subscription
    }
    
    
    func loginUser(email: String, password: String, completion: @escaping (User?) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password, completion: {(authResult, error) in
            guard error == nil else {
                print("Failed to login user: \(error?.localizedDescription)")
                return
            }
            
            self.call(key: "login", mutation: LoginUserMutation(email: email, password: password), completion: completion)
            
        })
    }
    
    func registerUser(firstName: String, lastName: String, email: String, password: String, completion: @escaping(User?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password, completion: {(authResult, error) in
            guard error == nil else {
                print("Failed to register user")
                return
            }
            
            self.call(key: "register", mutation: RegisterUserMutation(firstName: firstName, lastName: lastName, email: email, password: password), completion: completion)
        } )
    }
    
    func logoutUser(completion: @escaping(Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
        } catch let signOutError as NSError {
            completion(false)
            print("Error signing out: %@", signOutError)
        }
    }
    
}

