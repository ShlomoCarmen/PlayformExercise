//
//  API.swift
//  PlayformExercise
//
//  Created by shlomo carmen on 02/08/2021.
//

import Foundation

class API {
    
    class func requestData(id: String, completionHandler:@escaping (_ response: APIResult<Item>)->Void) {
        let stringUrl = "https://jsonplaceholder.typicode.com/todos/\(id)"
        let dataURL = URL(string: stringUrl)!
        let request = URLRequest(url: dataURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        excecuteRequest(request: request) { (data, response, error) in
            guard error == nil else {
                completionHandler(APIResult.failure(MyError.serverError(error!)))
                    return
                }
            if let data = data {
                do {
                    let item = try Item(data: data)
                    completionHandler(.success(item))
                }
                catch {
                    completionHandler(.failure(MyError.serverError(error)))
                }
            } else {
                completionHandler(.failure(MyError.noData))
            }
        }
    }
    
    private class func excecuteRequest(request:URLRequest, completionHandler:@escaping ((Data?, URLResponse?, Error?) -> Void) ) {
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if let _error = error {
                completionHandler(data, response, _error)
            }
            else {
                completionHandler(data, response, nil)
            }
        }
        task.resume()
    }
    
    
}
