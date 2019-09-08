//
//  MostRecent.swift
//  NYTimes
//
//  Created by Samad on 9/6/19.
//  Copyright © 2019 Samad. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

final class MostRecent: NSObject, Mappable {
    
    var copyRight: String?
    var mostViewed: [News]?
    
    func mapping(map: Map) {
        copyRight    <- map["copyright"]
        mostViewed   <- map["results"]
    }
    
    override init() {}
    required convenience init?(map: Map) {
        self.init()
    }
    
    func getMostViewedNews(filter: String?, completion: ((MostRecent?, Error?) -> ())? = nil) {
        let url = String(format: NYAPI.mostRecent, filter ?? "7")
        NetworkManager.shared.makeGetCall(url: url, parameters: nil, successBlock: { (response) in
            var recent: MostRecent?
            if let items = response {
                recent = MostRecent(JSON: items)
                completion?(recent,nil)
                completion(recent, nil)
            }
        }) { (error) in
            completion?(nil, error)
            completion(nil, error)
        }
        
    }
    
    
}
