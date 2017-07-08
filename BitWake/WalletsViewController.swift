//
//  WalletsViewController.swift
//  BitWake
//
//  Created by Niklas Berglund on 2017-06-28.
//  Copyright © 2017 Niklas Berglund. All rights reserved.
//

import Cocoa

class WalletsViewController: NSViewController {
    
    @IBOutlet weak var collectionView: NSCollectionView!
    
    fileprivate var shouldShowNewWalletItem = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureCollectionView()
        
        self.updateHeight()
        
        WalletsCollection.shared.getBalances()
    }
    
    private func configureCollectionView() {
        collectionView.collectionViewLayout = WalletsListLayout()
        collectionView.register(WalletCollectionViewItem.self, forItemWithIdentifier: "WalletCollectionViewItem")
        view.wantsLayer = true
        //collectionView.layer?.backgroundColor = NSColor.black.cgColor
    }
    
    /**
     * Update height to fit wallets
     */
    public func updateHeight() {
        let numberOfWallets = WalletsCollection.shared.count
        var height: CGFloat = CGFloat(numberOfWallets) * WalletCollectionViewItem.size.height + 1 * kCollectionViewHeaderHeight
        
        if self.shouldShowNewWalletItem {
            height += WalletCollectionViewItemNew.height
        }
        
        self.setHeight(height)
    }
    
    fileprivate func setHeight(_ height: CGFloat) {
        self.view.frame.size.height = height
        self.view.needsLayout = true
    }
}

extension WalletsViewController: NSCollectionViewDataSource {
    public func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 { // Wallets
            var count = WalletsCollection.shared.count
            
            if self.shouldShowNewWalletItem {
                count += 1
            }
            
            return count
        }
        else { // Transactions
            return 0
        }
    }
    
    public func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        if indexPath.item < WalletsCollection.shared.count { // Wallet cell
            let collectionViewItem = self.collectionView.makeItem(withIdentifier: "WalletCollectionViewItem", for: indexPath) as! WalletCollectionViewItem
            
            if let wallet = WalletsCollection.shared.wallet(atIndex: indexPath.item) {
                collectionViewItem.wallet = wallet
            }
            
            return collectionViewItem
        }
        else { // New wallet cell
            let newWalletItem = self.collectionView.makeItem(withIdentifier: "WalletCollectionViewItemNew", for: indexPath) as! WalletCollectionViewItemNew
            
            return newWalletItem
        }
    }
    
    public func collectionView(_ collectionView: NSCollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> NSView {
        let headerView = self.collectionView.makeSupplementaryView(ofKind: "header", withIdentifier: "WalletCollectionViewHeaderView", for: indexPath) as! WalletCollectionViewHeaderView
        if indexPath.section == 0 { // Wallets
            headerView.titleLabel.stringValue = "Wallets"
        }
        else { // Transactions
            headerView.titleLabel.stringValue = "Transactions"
        }
        
        return headerView
    }
}
