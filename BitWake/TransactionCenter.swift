//
//  TransactionCenter.swift
//  BitWake
//
//  Created by Niklas Berglund on 2017-07-03.
//  Copyright © 2017 Niklas Berglund. All rights reserved.
//

import Foundation

class TransactionCenter {
    static var shared = TransactionCenter()
    
    private var transactions: [Transaction] = []
    
    
    init() {
    
    }
    
    public func addTransaction(_ transaction: Transaction) {
        self.transactions.append(transaction)
    }
    
    public func subscribeToTransactions(toWallet: Wallet, onNewTransaction:(Transaction) -> Void) {
        
    }
}
