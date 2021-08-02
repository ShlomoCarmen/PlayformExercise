//
//  Item.swift
//  PlayformExercise
//
//  Created by shlomo carmen on 02/08/2021.
//

import Foundation

struct Item: Codable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
    
    init(data: Data) throws {
        self = try JSONDecoder().decode(Item.self, from: data)
    }
    
}
