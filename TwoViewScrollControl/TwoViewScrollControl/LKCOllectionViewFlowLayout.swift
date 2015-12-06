//
//  LKCOllectionViewFlowLayout.swift
//  TwoViewScrollControl
//
//  Created by 梁坤 on 15/12/1.
//  Copyright © 2015年 lk. All rights reserved.
//

import UIKit

class LKCOllectionViewFlowLayout: UICollectionViewFlowLayout {
    
    var X:CGFloat = 0
    
    private var frames:[NSValue] = []
        
    
    
    
    var layouts:[UICollectionViewLayoutAttributes]?
    var tagTitles:[tagTitle]? {
        didSet {
            for var i = 0; i < tagTitles?.count; i++ {
            let item = tagTitles![i]
                
                if let font = item.normalTitleFont, string = item.tagTile {
                    let tit = string as NSString
                    let a = CGFloat(FLT_MAX)
                    let attribute = [NSFontAttributeName:font]
                    let option = NSStringDrawingOptions.UsesLineFragmentOrigin
                    
                    let size = CGSizeMake(a, a)
                    let rect: CGRect = tit.boundingRectWithSize(size, options: option, attributes: attribute, context: nil)
                    let cgsize = rect.size
                    
                    
                    
                    
                    let frame = CGRect(x: self.X, y: 0, width: cgsize.width, height: 100)
                    
                    
                    let Frame: NSValue = NSValue.init(CGRect: frame)
                    
                    self.frames.append(Frame)
                    
                    //                    self.frames.append(Frame)
                    self.X += (cgsize.width + 10)
                    
                    print(cgsize.width)
                    
                    
                    print(self.frames.count)
                    
                }
                
            }

        
        }
    
    }
    
    
//    init(Arr: [tagTitle]) {
//        
//        
//
//        
//        self.tagTitles = Arr
//        
//        
//       super.init()
//        
//        print(self.tagTitles!.count)
//        
//       
//        
//    }

//    required init?(coder aDecoder: NSCoder) {
//        
//        fatalError("init(coder:) has not been implemented")
//    }

  override  func prepareLayout() {
        
        super.prepareLayout()
//        self.frames = [NSValue]()
        self.tagTitles = [tagTitle]()

                print(self.tagTitles)
    
//        for item in tagTitles! {
//            if let font = item.normalTitleFont, string = item.tagTile {
//                let tit = string as NSString
//                let a = CGFloat(FLT_MAX)
//                let attribute = [NSFontAttributeName:font]
//                let option = NSStringDrawingOptions.UsesLineFragmentOrigin
//                
//                let size = CGSizeMake(a, a)
//                let rect: CGRect = tit.boundingRectWithSize(size, options: option, attributes: attribute, context: nil)
//                let cgsize = rect.size
//                
//                
//                
//                
//                let frame = CGRect(x: self.X, y: 0, width: cgsize.width, height: 150)
//                
//                
//                let Frame: NSValue = NSValue.init(CGRect: frame)
//                
//                self.frames.append(Frame)
//                //                    self.frames.append(Frame)
//                self.X += size.width + 50
//                
//                
//                print(self.frames.count)
//                
//            }
//            
//        }
    
            
        
            

        
        
}
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        
        
        var arr = [UICollectionViewLayoutAttributes]()
       let cellCount = self.collectionView!.numberOfItemsInSection(0)
        print(cellCount)
        for var i = 0; i < cellCount; i++ {
        let indexpath = NSIndexPath(forItem: i, inSection: 0)
            
            let attri = self.layoutAttributesForItemAtIndexPath(indexpath)
            arr.append(attri!)
        
        }
        return arr
        
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        

        let index = indexPath.item
        
        
        
        let a = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        
        
        
        
        
        let value = frames[index]
            
        let frame =  value.CGRectValue()
    print(frame)

        
        a.frame = frame
        
    
    return a
        
}
    
//override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
//        
//        return true
//    }
//    
}
