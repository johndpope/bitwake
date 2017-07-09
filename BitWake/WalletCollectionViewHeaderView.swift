//
//  WalletCollectionViewHeaderView.swift
//  BitWake
//
//  Created by Niklas Berglund on 2017-07-06.
//  Copyright © 2017 Niklas Berglund. All rights reserved.
//

import Foundation
import Cocoa

class WalletCollectionViewHeaderView: NSView {
    @IBOutlet weak var titleLabel: NSTextField!
    
    override func viewDidMoveToSuperview() {
        super.viewDidMoveToSuperview()
        self.layer?.backgroundColor = NSColor(red: 121/255.0, green: 160/255.0, blue: 201/255.0, alpha: 1.0).cgColor
    }
    
    @IBAction func clickedNewWalletButton(_ sender: Any) {
        debugPrint("New wallet")
    }
}

