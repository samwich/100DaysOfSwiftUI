//
//  FileManager-Decodable.swift
//  BucketList
//
//  Created by Sam Johnson on 2023-01-07.
//

import Foundation

extension FileManager {
    func decode<T: Codable>(_ file: String) -> T {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        let url = paths[0].appendingPathComponent(file)
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) document directory.")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}

