//
//  Media.swift
//  NYTimes
//
//  Created by Samad on 9/8/19.
//  Copyright © 2019 Samad. All rights reserved.
//

import Foundation
import ObjectMapper

final class Media: NSObject, Mappable {
    
    var type: String?
    var caption: String?
    var image: [Images]?
    
    func mapping(map: Map) {
        type    <- map["copyright"]
        caption   <- map["byline"]
        image <- map["media-metadata"]
    }
    
    override init() {}
    required convenience init?(map: Map) {
        self.init()
    }
    
}

final class Images: NSObject, Mappable {
    
    var url: String?
    
    func mapping(map: Map) {
        url    <- map["url"]
    }
    
    override init() {}
    required convenience init?(map: Map) {
        self.init()
    }
    
}
