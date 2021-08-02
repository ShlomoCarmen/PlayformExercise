//
//  APIResult.swift
//  PlayformExercise
//
//  Created by shlomo carmen on 02/08/2021.
//

import Foundation

enum APIResult<APIResponseModel> {
    case success(APIResponseModel)
    case failure(MyError)
}
