//
//  NetworkManager.swift
//  NYTimes
//
//  Created by Samad on 9/7/19.
//  Copyright © 2019 Samad. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

typealias ObjectBlock = (_ responseObject: [String:Any]?) -> Void
typealias ErrorBlock = (_ error: Error?) -> Void

class NetworkManager {
    static let shared = NetworkManager()
    
    func makeGetCall(url: String, parameters: [String:Any]?, successBlock: @escaping ObjectBlock, errorBlock: @escaping ErrorBlock) -> Void {
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { (response) in
            switch response.result {
            case .success(let json):
                successBlock(json as? [String : Any])
            case .failure(let error):
                errorBlock(error)
            }
        }
    }
    
}
