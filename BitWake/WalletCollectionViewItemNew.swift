//
//  WalletCollectionViewItemNew.swift
//  BitWake
//
//  Created by Niklas Berglund on 2017-07-08.
//  Copyright © 2017 Niklas Berglund. All rights reserved.
//

import Cocoa

class WalletCollectionViewItemNew: NSCollectionViewItem {
    
    public static let height = CGFloat(60.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func clickedSave(_ sender: Any) {
        debugPrint("Save")
    }
}
