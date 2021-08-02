//
//  MyError.swift
//  PlayformExercise
//
//  Created by shlomo carmen on 02/08/2021.
//

import Foundation

enum MyError: Error {
    case serverError(Error)
    case noData
    
    var message: String {
        switch self {
        case .serverError(let error):
            return error.localizedDescription
        case .noData:
            return "No Data"
        }
    }
    
}
