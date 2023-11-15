//
//  FileManager-DocumentsDirectory.swift
//  Dice
//
//  Created by Sam Johnson on 2023-10-02.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
