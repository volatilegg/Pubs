//
//  Place.swift
//  Pubs
//
//  Created by Do Duc on 30/09/2018.
//  Copyright © 2018 Buscu. All rights reserved.
//

import Foundation

public struct Place: Codable, Hashable {
    public let officeLocation: String
    public let isCurrent: Bool
    public let options: [String]

    public var restaurants: [Restaurant]?

    public init(officeLocation: String, isCurrent: Bool, options: [String]) {
        self.officeLocation = officeLocation
        self.isCurrent = isCurrent
        self.options = options
    }

    public mutating func config(_ input: [Restaurant]) {
        self.restaurants = input.filter({ options.contains($0.id) })
    }
}
