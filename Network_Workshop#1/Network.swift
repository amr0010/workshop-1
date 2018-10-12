//
//  Network.swift
//  Network_Workshop#1
//
//  Created by Amr on 10/12/18.
//  Copyright © 2018 Amr. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
   static func startNetworking (completion : @escaping([timeLine]? , Error?) -> Void ) {
        let url = "https://nodeswiftcairo.herokuapp.com/api/timelines"
        Alamofire.request(url).responseData { (response) in
            switch response.result {
            case .success(let data) :
                do {
                     let decoder = JSONDecoder()
                     let responseModel = try decoder.decode([timeLine].self, from: data)
                    completion(responseModel, nil)
                }
                catch
                {
                   break
                }
                
                
            case .failure(let error) :
                 completion(nil, error)
            }
        }
    }
}




