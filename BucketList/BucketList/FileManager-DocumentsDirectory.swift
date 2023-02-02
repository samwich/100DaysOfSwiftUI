//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by Sam Johnson on 2023-02-01.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
