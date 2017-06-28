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
    }
    
    private func configureCollectionView() {
        collectionView.collectionViewLayout = WalletsListLayout()
        collectionView.register(WalletCollectionViewItem.self, forItemWithIdentifier: "WalletCollectionViewItem")
        view.wantsLayer = true
        collectionView.layer?.backgroundColor = NSColor.black.cgColor
    }
}

extension WalletsViewController: NSCollectionViewDataSource {
    public func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    public func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = self.collectionView.makeItem(withIdentifier: "WalletCollectionViewItem", for: indexPath)
        
        return item
    }
    
    public func collectionView(_ collectionView: NSCollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> NSView {
        return NSView()
    }
}
