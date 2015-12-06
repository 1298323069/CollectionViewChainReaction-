//
//  ViewController.swift
//  testcustomlayout
//
//  Created by 梁坤 on 15/11/13.
//  Copyright © 2015年 lk. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class manuViewController: UICollectionViewController {
    init() {
    let layout = CustomLayout()
      super.init(collectionViewLayout: layout)
        
    
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.registerClass(IconCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    //MARK: CollectionViewDataSource
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! IconCell
        
        return cell
    }


}
class IconCell: UICollectionViewCell {
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.contentView.backgroundColor = UIColor.redColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
