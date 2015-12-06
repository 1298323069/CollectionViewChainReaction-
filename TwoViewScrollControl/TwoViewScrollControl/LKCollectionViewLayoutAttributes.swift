//
//  LKCollectionViewLayoutAttributes.swift
//  TwoViewScrollControl
//
//  Created by 梁坤 on 15/12/1.
//  Copyright © 2015年 lk. All rights reserved.
//

import UIKit

class LKCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
    
    var endX:(endX:CGFloat)->()?
    var tagtitle: tagTitle {
        
        didSet {
            
            if let font = tagtitle.normalTitleFont, string = tagtitle.tagTile {
                let tit = string as NSString
                let a = CGFloat(FLT_MAX)
                let attribute = [NSFontAttributeName:font]
                let option = NSStringDrawingOptions.UsesLineFragmentOrigin
                
                let size = CGSizeMake(a, a)
                let rect: CGRect = tit.boundingRectWithSize(size, options: option, attributes: attribute, context: nil)
                let cgsize = rect.size
                
                self.size = cgsize
                self.frame = CGRect(x: self.X, y: 0, width: self.size.width, height: self.size.height)
                self.endX(endX: self.X + self.size.width)
                

            }
       
        
        }
    
    }
    var X: CGFloat = 0.0
    func initialize () {
    
    
    
    
    }
   
    
    
}
