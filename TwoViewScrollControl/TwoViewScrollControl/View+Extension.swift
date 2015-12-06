//
//  View+Extension.swift
//  TwoViewScrollControl
//
//  Created by 梁坤 on 15/11/30.
//  Copyright © 2015年 lk. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    public var x: CGFloat {
    
        get {
        return self.frame.origin.x
        }
        set {
            var r = self.frame
            r.origin.x = newValue
            self.frame = r
        }
    
    }
    
    public var y: CGFloat {
        get {
        return self.frame.origin.y
        }
        set {
        var r = self.frame
            r.origin.y = newValue
            self.frame = r
        }
    
    }
    public var weigh: CGFloat {
        get {
        return self.frame.width
        }
        set {
        var r = self.frame
            r.size.width = newValue
            self.frame = r
        }
    }
    public var heigh: CGFloat {
    
        get {
        return self.frame.height
        }
        set {
        var r = self.frame
            r.size.height = newValue
            self.frame = r
        }
    }
    public var centerX: CGFloat {
        get {
        return self.center.x
        }
        set {
            
        var cente = self.center
            cente.x = newValue
            self.center = cente
        }
        
    
    }


}
