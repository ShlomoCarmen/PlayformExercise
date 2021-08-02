//
//  UserDefaultsProvider.swift
//  PlayformExercise
//
//  Created by shlomo carmen on 02/08/2021.
//

import Foundation

class UserDefaultsProvider {

    static var shared = UserDefaultsProvider()

    private let defaults = UserDefaults.standard
    
    private init() {}
    
    var index: Int {
        get {
            return self.defaults.integer(forKey: "index")
        }
        set (index) {
            self.defaults.set(index, forKey: "index")
            self.defaults.synchronize()
        }
    }
    
    var currentData: Item? {
        get {
            guard let data = defaults.value(forKey: "currentData") as? Data else { return nil }
                return (try? PropertyListDecoder().decode(Item.self, from: data))
            
        }
        set (response){
            self.defaults.set(try? PropertyListEncoder().encode(response), forKey:"currentData")
            self.defaults.synchronize()
        }
    }
}
