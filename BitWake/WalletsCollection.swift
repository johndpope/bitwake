
//
//  Wallets.swift
//  BitHawk
//
//  Created by Niklas Berglund on 2017-06-09.
//  Copyright © 2017 Niklas Berglund. All rights reserved.
//

import Foundation

let kWalletsCollection = "WalletsCollection"
let kWallets = "Wallets"

class WalletsCollection: NSObject, NSCoding {
    static let shared = WalletsCollection()
    var wallets: [Wallet] = []
    
    // Private because it's a singleton
    private override init() {}
    
    required init?(coder aDecoder: NSCoder) {
        self.wallets = aDecoder.decodeObject(forKey: kWallets) as! [Wallet]
        
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.wallets, forKey: kWallets)
    }
    
    public func updateWalletsStore() {
        let userDefaults = UserDefaults.standard
        let walletsCollectionEncoded = NSKeyedArchiver.archivedData(withRootObject: self as Any)
        userDefaults.setValue(walletsCollectionEncoded, forKey: kWalletsCollection)
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
