//
//  WalletCollectionViewHeaderView.swift
//  BitWake
//
//  Created by Niklas Berglund on 2017-07-06.
//  Copyright © 2017 Niklas Berglund. All rights reserved.
//

import Foundation
import Cocoa

protocol WalletCollectionViewHeaderViewDelegate {
    func headerViewClickedNewWallet(_ headerView: WalletCollectionViewHeaderView)
}

class WalletCollectionViewHeaderView: NSView {
    @IBOutlet weak var titleLabel: NSTextField!
    
    public var delegate: WalletCollectionViewHeaderViewDelegate?
    
    override func viewDidMoveToSuperview() {
        super.viewDidMoveToSuperview()
        self.layer?.backgroundColor = NSColor(white:0.320, alpha: 1.0).cgColor
    }
    
    @IBAction func clickedNewWalletButton(_ sender: Any) {
        debugPrint("New wallet")
        
        self.delegate?.headerViewClickedNewWallet(self)
    }
}

