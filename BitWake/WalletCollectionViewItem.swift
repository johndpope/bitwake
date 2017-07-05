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
    @IBOutlet weak var balanceTextField: NSTextField!
    
    public static let size = CGSize(width: 123.00, height: 50.0)
    
    override init?(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var wallet: Wallet? {
        didSet {
            self.nameTextField.stringValue = wallet!.name
            
            if let address = wallet!.address {
                self.addressTextField.stringValue = address
            }
            else {
                self.addressTextField.stringValue = ""
            }
            
            if let balance = wallet!.balance {
                self.balanceTextField.stringValue = "\(balance) BTC"
            }
        }
    }
    
    fileprivate func updateLabels() {
        self.nameTextField.stringValue = wallet!.name
        
        if let address = wallet!.address {
            self.addressTextField.stringValue = address
        }
        else {
            self.addressTextField.stringValue = ""
        }
        
        if let balance = wallet!.balance {
            self.balanceTextField.stringValue = "\(balance) BTC"
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameTextField.stringValue = "Name here"
        self.addressTextField.stringValue = "Address here"
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.white.cgColor
    }
}

extension WalletCollectionViewItem: WalletDelegate {
    func walletWasUpdated() {
        self.updateLabels()
    }
}
