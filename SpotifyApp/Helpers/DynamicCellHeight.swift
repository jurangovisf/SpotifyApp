//
//  DynamicCellHeight.swift
//  SpotifyApp
//
//  Created by Juliana Loaiza Labrador on 29/10/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import Foundation
import UIKit

struct DynamicCellHeight {
    static func getHeightForCollectionView(frame: CGRect,items: Int) -> CGFloat{
        let testViewController = TestViewController.init(items: items)
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: 50, height: 50) // CellHeight
        let collectionView = UICollectionView.init(frame: frame, collectionViewLayout: layout)
        collectionView.delegate = testViewController
        collectionView.dataSource = testViewController
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
        return collectionView.contentSize.height
    }
}

class TestViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    var items: Int?
    
    convenience init() {
        self.init(items: nil)
    }
    
    init(items: Int?) {
        self.items = items
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if items != nil {
            return self.items!
        }else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)
        return cell
    }
    
    
}

class MyCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
