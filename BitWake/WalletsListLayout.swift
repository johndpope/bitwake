//
//  WalletsListLayout.swift
//  BitWake
//
//  Created by Niklas Berglund on 2017-06-18.
//  Copyright © 2017 Niklas Berglund. All rights reserved.
//

import Cocoa

class WalletsListLayout: NSCollectionViewFlowLayout {
    let itemHeight: CGFloat = 50.0
    
    required override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
    }
    
    override func prepare() {
        super.prepare()
        
        self.itemSize = NSSize(width: collectionView!.bounds.width, height: 50.0)
        self.sectionInset = EdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        self.minimumInteritemSpacing = 2.0
        self.minimumLineSpacing = 0.0
    }
}
