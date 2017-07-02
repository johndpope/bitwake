//
//  Transaction.swift
//  BitWake
//
//  Created by Niklas Berglund on 2017-07-02.
//  Copyright © 2017 Niklas Berglund. All rights reserved.
//

import Foundation

class Transaction {
    public var transactionId: String
    
    public var out: [[String: Float]] = []
    
    init(transactionId: String) {
        self.transactionId = transactionId
    }
    
    public func addOut(address: String, amount: Float) {
        self.out.append([address: amount])
    }
}
