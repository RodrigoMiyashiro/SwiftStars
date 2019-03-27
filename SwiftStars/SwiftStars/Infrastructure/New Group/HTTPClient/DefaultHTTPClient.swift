//
//  DefaultHTTPClient.swift
//  SwiftStars
//
//  Created by Rodrigo Miyashiro on 25/03/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

class DefaultHTTPClient: HTTPClient {
    func get<T>(_ remote: RemoteAddress, with queryParamenters: [String : String]) throws -> T? where T : Decodable {
        let urlComponents = remote.urlComponents(parameters: queryParamenters)
        
        guard let remoteURL = urlComponents.url else {
            throw HTTPError.requestError("Could not create remote URL")
        }
        
        var request = URLRequest(url: remoteURL)
        request.httpMethod = "GET"
        
        let semaphoro = DispatchSemaphore(value: 0)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        var responseData: T?
        var responseError: Error?
        
        session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                responseError = error
                semaphoro.signal()
                return
            }
            
            guard let jsonData = data else {
                semaphoro.signal()
                return
            }
            
            let decoder = JSONDecoder()
            
            responseData = try? decoder.decode(T.self, from: jsonData)
            
            semaphoro.signal()
            }.resume()
        
        semaphoro.wait()
        
        if let _ = responseError {
            throw HTTPError.requestError("There was an error with the request")
        }
        
        return responseData
    }
}
