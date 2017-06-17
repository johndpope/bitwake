
//
//  Wallets.swift
//  BitHawk
//
//  Created by Niklas Berglund on 2017-06-09.
//  Copyright © 2017 Niklas Berglund. All rights reserved.
//

import Foundation

let kWalletsCollection = "WalletsCollection"
let kWallets: String = "Wallets"

class WalletsCollection: NSObject {
    static var shared = WalletsCollection()
    
    var wallets: [Wallet] = []
    
    
    // Private because it's a singleton
    private override init() {
        super.init()
        
        // Load wallets on file if there are any
        let walletsStorePath = BitWake.walletsFileUrl().path
        
        if FileManager.default.fileExists(atPath: walletsStorePath) {
            let storedWallets = NSKeyedUnarchiver.unarchiveObject(withFile: walletsStorePath)
            
            if storedWallets != nil {
                self.wallets = storedWallets! as! [Wallet]
            }
        }
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }
    
    public func updateWalletsStore() {
        let walletsFileUrl = BitWake.walletsFileUrl()
        NSKeyedArchiver.archiveRootObject(self.wallets as NSArray, toFile: walletsFileUrl.path)
    }
    
    func wallet(atIndex: Int) -> Wallet? {
        return self.wallets[atIndex]
    }
    
    func add(_ wallet: Wallet) {
        self.wallets.append(wallet)
    }
    
    func remove(walletIndex: Int) {
        self.wallets.remove(at: walletIndex)
    }
}
