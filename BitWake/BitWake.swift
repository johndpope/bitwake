//
//  BitWake.swift
//  BitWake
//
//  Created by Niklas Berglund on 2017-06-16.
//  Copyright © 2017 Niklas Berglund. All rights reserved.
//

import Foundation

let kUserDefaultsSuiteName = "com.bitwake"
let kWalletsFileName = "walletsCollectionStore"

enum Cryptocurrency {
    case BTC
}

public class BitWake {
    public static func ensureHaveApplicationSupportDirectory() {
        let applicationSupportUrl = BitWake.applicationSupportUrl()
        
        if !FileManager.default.fileExists(atPath: applicationSupportUrl!.path) {
            BitWake.createApplicationSupportDirectory()
        }
    }
    
    private static func createApplicationSupportDirectory() {
        let applicationSupportUrl = BitWake.applicationSupportUrl()
        
        do {
            try FileManager.default.createDirectory(at: applicationSupportUrl!, withIntermediateDirectories: false, attributes: nil)
        }
        catch let error {
            debugPrint(error)
        }
    }
    
    public static func applicationSupportUrl() -> URL? {
        
        do {
            let applicationSupportUrl = try FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let applicationName = ProcessInfo.processInfo.processName
            
            return applicationSupportUrl.appendingPathComponent(applicationName, isDirectory: true)
        }
        catch let error {
            debugPrint(error)
            return nil
        }
    }
    
    public static func walletsFileUrl() -> URL {
        return self.applicationSupportUrl()!.appendingPathComponent(kWalletsFileName, isDirectory: false)
    }
}
