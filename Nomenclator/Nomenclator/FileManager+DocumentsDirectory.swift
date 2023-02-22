//
//  FileManager+DocumentsDirectory.swift
//  Nomenclator
//
//  Created by Sam Johnson on 2023-02-21.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
