//
//  Restaurant.swift
//  Pubs
//
//  Created by Do Duc on 16/09/2018.
//  Copyright © 2018 Buscu. All rights reserved.
//

import Foundation

public struct Restaurant: Codable, Hashable {
    public let id: String
    public let name: String
    public let coodinate: String
    public let address: String

    public init(id: String, name: String, coodinate: String, address: String) {
        self.id = id
        self.name = name
        self.coodinate = coodinate
        self.address = address
    }
}
