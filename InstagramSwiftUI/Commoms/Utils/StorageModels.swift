//
//  StorageModel.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 20/09/22.
//

import Foundation

struct StorageModels {
    
    public static func set<T: Encodable>(_ object: T, key: String) {
        let data = object.toData()
        KeyChain.save(key: key, data: data)
    }

    public static func get<T: Decodable>(type: T.Type, key: String) -> T? {
        if let receivedData = KeyChain.load(key: key) {
            let result = receivedData.decoded(type)
           return result
        }
        return nil
    }
    
    public static func removeObject(key: String) {
        KeyChain.remove(key: key)
    }
}


public extension Encodable {
    
    func toJSON() -> [String:Any] {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(self),
            let json = ((try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]) as [String:Any]??) {
            return json ?? [String:Any]()
        }
        return [String:Any]()
    }
    
    func toData() -> Data {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(self) {
            return data
        }
        return Data()
    }
    
}

public extension Data {
    func decoded<T>(_ type: T.Type, strategy: JSONDecoder.KeyDecodingStrategy? = nil) -> T? where T: Decodable {
        do {
            let decoder = JSONDecoder()
            if let strategy = strategy {
                decoder.keyDecodingStrategy = strategy
            }
            let objc = try decoder.decode(type, from: self)
            return objc
        } catch {
            return nil
        }
    }
}
