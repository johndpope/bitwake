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

protocol WalletDelegate {
    func walletWasUpdated()
}

class Wallet: NSObject, NSCoding {
    var name: String { didSet { self.updateWalletsStore() } }
    var address: String? { didSet { self.updateWalletsStore() } }
    var balance: Double? { didSet { self.delegate?.walletWasUpdated() } }
    var type: Cryptocurrency = .BTC // BTC only at the moment
    var delegate: WalletDelegate?
    
    init(name: String, address: String?) {
        self.name = name
        self.address = address
        
        super.init()
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
    
    public func getBalance() {        
        Blockchain.shared.checkBalance(wallet: self) { (balance) in
            self.balance = balance
        }
    }
    
    fileprivate func updateWalletsStore() {
        WalletsCollection.shared.updateWalletsStore()
    }
}
