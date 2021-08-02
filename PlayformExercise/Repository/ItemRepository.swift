//
//  ItemRepository.swift
//  PlayformExercise
//
//  Created by shlomo carmen on 02/08/2021.
//

import Foundation

class ItemRepository {
    
    static let shared = ItemRepository()
    
    private init() {
        
    }
    
    func getAPIData(id: String, completion:@escaping (_ result: Result<Item ,Error>)->Void){
        
        API.requestData(id: id) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure (error))
            case .success(let item):
                completion(.success (item))
            }
        }
    }
    
}
