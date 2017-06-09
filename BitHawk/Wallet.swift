//
//  Wallet.swift
//  BitHawk
//
//  Created by Niklas Berglund on 2017-06-09.
//  Copyright © 2017 Niklas Berglund. All rights reserved.
//

import Foundation

class Wallet {
    var name: String
    var address: String?
    var balance: Double?
    
    init(name: String, address: String?) {
        self.name = name
        self.address = address
    }
}
