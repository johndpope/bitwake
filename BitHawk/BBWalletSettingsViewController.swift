//
//  BBWalletSettingsViewController.swift
//  BitHawk
//
//  Created by Niklas Berglund on 2017-05-28.
//  Copyright © 2017 Niklas Berglund. All rights reserved.
//

import Foundation
import Cocoa

class BBWalletSettingsViewController: NSViewController {
    
    @IBOutlet weak var walletsTableView: NSTableView!
    
    override func viewDidLoad() {
        walletsTableView.delegate = self
        walletsTableView.dataSource = self
    }
}

extension BBWalletSettingsViewController: NSTableViewDelegate {
    
}

extension BBWalletSettingsViewController: NSTableViewDataSource {
}
