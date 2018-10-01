//
//  RestaurantDependency.swift
//  Pubs
//
//  Created by Do Duc on 30/09/2018.
//  Copyright © 2018 Buscu. All rights reserved.
//

import Foundation

protocol RestaurantDataManager {
    func fetchAllRestaurant() -> [Restaurant]
}

final class RestaurantLocalDataManager: RestaurantDataManager {
    func fetchAllRestaurant() -> [Restaurant] {
        guard let restaurants = [Restaurant].from(jsonFile: "restaunrants")
    }

}
