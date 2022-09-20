//
//  JSONDecoder+Extension.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 19/09/22.
//

import Foundation

public extension JSONDecoder {
    static func decode<T: Decodable>(to type: T.Type, from data: Data) -> T? {
        do {
            let object = try JSONDecoder().decode(type, from: data)
            return object
        } catch {
            print(error)
            return nil
        }
    }
    
    static func decode<T: Decodable>(to type: T.Type, from dictionary: [String: Any]) -> T? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: [])
            let object = try JSONDecoder().decode(type, from: jsonData)
            return object
        } catch {
            print(error)
            return nil
        }
    }
}
