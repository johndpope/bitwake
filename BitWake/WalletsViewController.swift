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
        let height: CGFloat = CGFloat(numberOfWallets) * WalletCollectionViewItem.size.height
        
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
        return WalletsCollection.shared.count
    }
    
    public func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let collectionViewItem = self.collectionView.makeItem(withIdentifier: "WalletCollectionViewItem", for: indexPath) as! WalletCollectionViewItem
        
        if let wallet = WalletsCollection.shared.wallet(atIndex: indexPath.item) {
            collectionViewItem.wallet = wallet
        }
        
        return collectionViewItem
    }
    
    public func collectionView(_ collectionView: NSCollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> NSView {
        return NSView()
    }
}
