//
//  News.swift
//  NYTimes
//
//  Created by Samad on 9/6/19.
//  Copyright © 2019 Samad. All rights reserved.
//

import Foundation
import ObjectMapper

final class News: NSObject, Mappable {
    
    var abstract: String?
    var byLine: String?
    var publishedDate: String?
    var title: String?
    var media: [Media]?
    
    func mapping(map: Map) {
        abstract    <- map["abstract"]
        byLine   <- map["byline"]
        publishedDate   <- map["published_date"]
        title   <- map["title"]
        media <- map["media"]
    }
    
    override init() {}
    required convenience init?(map: Map) {
        self.init()
    }

}
