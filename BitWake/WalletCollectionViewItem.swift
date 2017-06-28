//
//  WalletCollectionViewItem.swift
//  BitWake
//
//  Created by Niklas Berglund on 2017-06-18.
//  Copyright © 2017 Niklas Berglund. All rights reserved.
//

import Cocoa

class WalletCollectionViewItem: NSCollectionViewItem {
    @IBOutlet weak var nameTextField: NSTextField!
    @IBOutlet weak var addressTextField: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameTextField.stringValue = "Name here"
        self.addressTextField.stringValue = "Address here"
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.white.cgColor
    }
    
}
