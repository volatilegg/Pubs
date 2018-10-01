//
//  Baconable.swift
//  Pubs
//
//  Created by Do Duc on 30/09/2018.
//  Copyright © 2018 Buscu. All rights reserved.
//

import Foundation

protocol Baconable: Codable { }

extension Baconable {
    static func from(data: Data) -> Self? {
        do {
            return try JSONDecoder().decode(Self.self, from: data)
        } catch {
            Log.error(error)
            return nil
        }
    }

    static func from(jsonFile: String) -> Self? {
        guard let data = Data.readJSON(fileName: jsonFile) else {
            return nil
        }

        return from(data: data)
    }
}

extension Array where Element: Codable {
    static func from(data: Data) -> [Element]? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode([Element].self, from: data)
        } catch {
            Log.error(error)
            return nil
        }

    }

    static func from(jsonFile: String) -> [Element]? {
        guard let data = Data.readJSON(fileName: jsonFile) else {
            return nil
        }

        return from(data: data)
    }

    var jsonData: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }

    var jsonString: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension Data {
    public static func readJSON(fileName: String) -> Data? {
        guard let file = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            return nil
        }

        return try? Data(contentsOf: file)
    }
}
