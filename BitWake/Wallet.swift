//
//  Wallet.swift
//  BitWake
//
//  Created by Niklas Berglund on 2017-06-09.
//  Copyright © 2017 Niklas Berglund. All rights reserved.
//

import Foundation

let kName = "name"
let kAddress = "address"

class Wallet: NSObject, NSCoding {
    var name: String { didSet { self.updateWalletsStore() } }
    var address: String? { didSet { self.updateWalletsStore() } }
    var balance: Double?
    var type: Cryptocurrency = .BTC // BTC only at the moment
    
    init(name: String, address: String?) {
        self.name = name
        self.address = address
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: kName) as! String
        let address = aDecoder.decodeObject(forKey: kAddress) as! String?
        self.init(name: name, address: address)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: kName)
        aCoder.encode(self.address, forKey: kAddress)
    }
    
    fileprivate func updateWalletsStore() {
        WalletsCollection.shared.updateWalletsStore()
    }
}
