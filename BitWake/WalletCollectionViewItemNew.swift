//
//  WalletCollectionViewItemNew.swift
//  BitWake
//
//  Created by Niklas Berglund on 2017-07-08.
//  Copyright © 2017 Niklas Berglund. All rights reserved.
//

import Cocoa

protocol WalletCollectionViewItemNewDelegate {
    func wantToSaveNewWallet(_ wallet: Wallet)
}

class WalletCollectionViewItemNew: NSCollectionViewItem {
    
    public static let height = CGFloat(60.0)
    
    fileprivate var delegate: WalletCollectionViewItemNewDelegate?
    
    @IBOutlet weak var nameTextField: NSTextField!
    @IBOutlet weak var addressTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func clickedSave(_ sender: Any) {
        debugPrint("Save")
        
        let walletName = self.nameTextField.stringValue
        let walletAddress = self.addressTextField.stringValue
        
        if (!walletName.isEmpty && !walletAddress.isEmpty)
        {
            let wallet = Wallet(name: walletName, address: walletAddress)
            self.delegate?.wantToSaveNewWallet(wallet)
        }
    }
}
