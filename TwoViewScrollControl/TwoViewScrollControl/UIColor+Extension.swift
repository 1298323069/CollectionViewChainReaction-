//
//  UIColor+Extension.swift
//  SinaWeibo
//
//  Created by 梁坤 on 15/11/15.
//  Copyright © 2015年 lk. All rights reserved.
//

import UIKit

extension UIColor {

    class func randomColor() -> UIColor {
        
        let R: CGFloat = CGFloat(random() % 255) / 255.0
        let G: CGFloat = CGFloat(random() % 255) / 255.0
        let B: CGFloat = CGFloat(random() % 255) / 255.0
        
    return UIColor(red: R, green: G, blue: B, alpha: 1)
        
    }

}
