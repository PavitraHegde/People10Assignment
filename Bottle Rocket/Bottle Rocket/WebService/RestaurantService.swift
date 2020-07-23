//
//  RestaurantService.swift
//  Bottle Rocket
//
//  Created by Pavitra on 23/07/20.
//  Copyright © 2020 Mahabaleshwar. All rights reserved.
//

import Foundation

class RestaurantService {
    
    private let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
    private let baseURL = "https://s3.amazonaws.com/br-codingexams/restaurants.json"
    var dataTask: URLSessionTask?
    
    func fetchLunchItemList(completionHandler: @escaping (_ errorMessage: String?, _ response: RestaurantDetails? ) -> Void) {
        
        if let urlComponent = URLComponents(string: "\(baseURL)") {
            guard let url = urlComponent.url else {
                return
            }
        
        dataTask = session.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                completionHandler(error.localizedDescription, nil)
                print(error.localizedDescription)
                return
            }
            if let response = response as? HTTPURLResponse, response.statusCode == 200, let responseData = data  {
                
                let jsonDecoder = JSONDecoder()
                
                do {
                    let restaurantResponse = try jsonDecoder.decode(RestaurantDetails.self, from: responseData)
                    completionHandler(nil, restaurantResponse)
                } catch  {                    completionHandler(error.localizedDescription, nil)
                }
            } else {
                return
            }
            
        })
        
        }
        
    dataTask?.resume()
}
}
