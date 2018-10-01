//
//  RestaurantLocalDataManager.swift
//  Pubs
//
//  Created by Do Duc on 30/09/2018.
//  Copyright © 2018 Buscu. All rights reserved.
//

import Foundation

typealias Closure<T> = (T) -> Void

protocol RestaurantDataManager {
    static func fetchRestaurants(_ completion: @escaping Closure<[Restaurant]>)
    static func fetchOptions(_ completion: @escaping Closure<[Place]>)
    static func fetchOption(by office: String, completion: @escaping Closure<Place?>)
    static func fetchCurrentOption(_ completion: @escaping Closure<Place?>)
}

final class RestaurantLocalDataManager: RestaurantDataManager {

    static func fetchRestaurants(_ completion: @escaping Closure<[Restaurant]>) {
        guard let restaurants = [Restaurant].from(jsonFile: "restaurants") else {
            fatalError("no restaurants")
        }

        completion(restaurants)
    }

    static func fetchOptions(_ completion: @escaping Closure<[Place]>) {
        guard let restaurants = [Place].from(jsonFile: "lunch-options") else {
            fatalError("no options")
        }

        completion(restaurants)
    }

    static func fetchOption(by office: String, completion: @escaping Closure<Place?>) {
        fetchOptions { places in
            guard let place = places.first(where: { $0.officeLocation == office }) else {
                completion(nil)
                return
            }

            processOption(place, completion: completion)
        }
    }

    static func fetchCurrentOption(_ completion: @escaping Closure<Place?>) {
        fetchOptions { places in
            guard let place = places.first(where: { $0.isCurrent }) else {
                completion(nil)
                return
            }

            processOption(place, completion: completion)
        }
    }

    // MARK: private methods

    private static func processOption(_ input: Place, completion: @escaping Closure<Place>) {
        var input = input

        fetchRestaurants { restaurants in
            input.config(restaurants)
            completion(input)
        }
    }

}
