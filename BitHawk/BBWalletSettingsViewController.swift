//
//  BBWalletSettingsViewController.swift
//  BitHawk
//
//  Created by Niklas Berglund on 2017-05-28.
//  Copyright © 2017 Niklas Berglund. All rights reserved.
//

import Foundation
import Cocoa

let visiblityCellId = "VisibilityCellId"
let nameCellId = "NameCellId"
let addressCellId = "AddressCellId"

class BBWalletSettingsViewController: NSViewController {
    
    @IBOutlet weak var walletsTableView: NSTableView!
    @IBOutlet weak var addRemoveSegmentedControl: NSSegmentedControl!
    
    override func viewDidLoad() {
        walletsTableView.delegate = self
        walletsTableView.dataSource = self
    }
    
    @IBAction func clickedSegmentedControl(_ sender: NSSegmentedControl) {
        if sender.selectedSegment == 0 { // Add button
            let numberOfRows = self.walletsTableView.numberOfRows
            self.walletsTableView.insertRows(at: IndexSet(integer: numberOfRows), withAnimation: NSTableViewAnimationOptions.slideDown)
            self.walletsTableView.editColumn(1, row: numberOfRows, with: nil, select: true)
        }
        else { // Remove button
            self.walletsTableView.removeRows(at: self.walletsTableView.selectedRowIndexes, withAnimation: NSTableViewAnimationOptions.effectFade)
        }
    }
}

extension BBWalletSettingsViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        if tableColumn == tableView.tableColumns[0] { // Visibility
            if let cellView = tableView.make(withIdentifier: visiblityCellId, owner: nil) as? NSTableCellView {
                cellView.imageView?.image = NSImage(named: NSImageNameQuickLookTemplate)
                cellView.textField?.stringValue = ""
                
                return cellView
            }
        }
        else if tableColumn == tableView.tableColumns[1] { // Name
            if let cellView = tableView.make(withIdentifier: nameCellId, owner: nil) as? NSTableCellView {
                cellView.textField?.stringValue = ""
                
                return cellView
            }
        }
        else if tableColumn == tableView.tableColumns[2] { // Address
            if let cellView = tableView.make(withIdentifier: addressCellId, owner: nil) as? NSTableCellView {
                cellView.textField?.stringValue = ""
                return cellView
            }
        }
        else {
            debugPrint("Unexpected")
        }
        
        return nil
    }
    
    func tableView(_ tableView: NSTableView, dataCellFor tableColumn: NSTableColumn?, row: Int) -> NSCell? {
        debugPrint("")
        return nil
    }
}

extension BBWalletSettingsViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 3
    }
}
