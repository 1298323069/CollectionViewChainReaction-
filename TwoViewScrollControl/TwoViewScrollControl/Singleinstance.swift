//
//  Singleinstance.swift
//  TwoViewScrollControl
//
//  Created by 梁坤 on 15/12/1.
//  Copyright © 2015年 lk. All rights reserved.
//

import UIKit
class selecteTagTitle: NSObject {
    var selecteFont:UIFont? = UIFont.systemFontOfSize(20)
    
    var selecteColor: UIColor? = UIColor.redColor()
    
    override init() {
        

       super.init()
    }
    
    
    
    
    
    class var shareselecteTagTitle: selecteTagTitle {
    
        struct Private {
            static var instance: selecteTagTitle?
            static var Tocken:dispatch_once_t = 0
            
            
        }
        
        dispatch_once(&Private.Tocken) { () -> Void in
            
            Private.instance = selecteTagTitle()
            
        }
        
    return Private.instance!
        
    }
    
}