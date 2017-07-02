//
//  Blockchain.swift
//  BitWake
//
//  Created by Niklas Berglund on 2017-07-02.
//  Copyright © 2017 Niklas Berglund. All rights reserved.
//

import Foundation

class Blockchain {
    private var bitcoinBlockchain = BitcoinBlockchain()
    
    init() {
        self.subscribeBitcoinWallets()
        bitcoinBlockchain.balance(wallet: Wallet(name: "", address: "1JCe8z4jJVNXSjohjM4i9Hh813dLCNx2Sy")) { (btcBalance) in
            debugPrint(btcBalance)
        }
    }
    
    private func subscribeBitcoinWallets() {
        for wallet in WalletsCollection.shared.wallets {
            self.bitcoinBlockchain.subscribe(wallet)
        }
    }
}
