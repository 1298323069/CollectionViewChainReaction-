//
//  CustomLayout.swift
//  testcustomlayout
//
//  Created by 梁坤 on 15/11/13.
//  Copyright © 2015年 lk. All rights reserved.
//

import UIKit

class CustomLayout: UICollectionViewLayout {
    //内容区域的总大小
    override func collectionViewContentSize() -> CGSize {
        return CGSizeMake((collectionView?.bounds.width)!, CGFloat((collectionView?.numberOfItemsInSection(0))! * 200 / 3 + 200))
    }
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributesArray = [UICollectionViewLayoutAttributes]()
        let cellCount = self.collectionView!.numberOfItemsInSection(0)
        
        for i in 0..<cellCount {
        let indexpath = NSIndexPath(forItem: i, inSection: 0)
            let  attribute = self.layoutAttributesForItemAtIndexPath(indexpath)
            attributesArray.append(attribute!)
        
        }
        return attributesArray
        
    }
    
    //返回每个单元格的位置和大小
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        //获取当前的布局属性对象
        let attribute = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        
        //单元格的外部空隙
        let itemSpacing:CGFloat = 2.0
        let lineSpacing:CGFloat = 5.0
        //单元格的边长
        let largeItemSide:CGFloat = 200.0
        let smallItemSide:CGFloat = 100.0
        //内部的间隙
        let inset = UIEdgeInsetsMake(2, 5, 2, 5)
        //当前的行数
        let lineNUm =  CGFloat(indexPath.item / 3)
        //当前行的Y坐标
        let lineY = lineNUm * largeItemSide + lineSpacing * lineNUm + inset.top
        //右侧单元格X坐标
        let lagerX = (self.collectionView?.bounds.width)! - largeItemSide - inset.right
        let smallX = (self.collectionView?.bounds.width)! - smallItemSide - inset.right
        let a = indexPath.item % 6
//        public var frame: CGRect
//        public var center: CGPoint
//        public var size: CGSize
//        public var transform3D: CATransform3D
//        @available(iOS 7.0, *)
//        public var bounds: CGRect
//        @available(iOS 7.0, *)
//        public var transform: CGAffineTransform
//        public var alpha: CGFloat
//        public var zIndex: Int // default is 0
//        public var hidden: Bool // As an optimization, UICollectionView might not create a view for items whose hidden attribute is YES
//        public var indexPath: NSIndexPath
//        
//        public var representedElementCategory: UICollectionElementCategory { get }
//        public var representedElementKind: String? { get } // nil when representedElementCategory is UICollectionElementCategoryCell
        let angle = CGFloat(M_PI_4)
        switch a {
            case 0: attribute.frame = CGRectMake(inset.left, lineY, largeItemSide, largeItemSide)
            attribute.transform = CGAffineTransformMakeRotation(angle)
//            attribute.transform3D = CATransform3DMakeRotation(angle, 0, 1, 1)
//            attribute.alpha = 0.5
//            attribute.hidden = true
            case 1: attribute.frame = CGRectMake(smallX, lineY, smallItemSide, smallItemSide)
            case 2: attribute.frame = CGRectMake(smallX, lineY + smallItemSide + inset.top, smallItemSide, smallItemSide)
            
            case 3: attribute.frame = CGRectMake(inset.left, lineY, smallItemSide, smallItemSide)
//            attribute.transform3D = CATransform3DMakeRotation(angle, 0, 1, 1)

            case 4: attribute.frame = CGRectMake(inset.left, lineY + smallItemSide + inset.top , smallItemSide, smallItemSide)
            case 5: attribute.frame = CGRectMake(lagerX, lineY, largeItemSide, largeItemSide)
        
        default: return nil
            }
        return attribute
        }
    
}
