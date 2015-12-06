//
//  tagTitle.swift
//  TwoViewScrollControl
//
//  Created by 梁坤 on 15/12/1.
//  Copyright © 2015年 lk. All rights reserved.
//

import UIKit

class tagTitle: NSObject {
    var tagTile: String?
    var normalTitleFont: UIFont?
    var normalTitleColor: UIColor?
    var selectedTitleFont: UIFont?
    var selectedTitleColor: UIColor?
    init( tagTitle: String?, normaltitleFont: UIFont?, normalTitleColor: UIColor?, selectedTitleFont: UIFont?, selectedTitleColor: UIColor? ) {
        
        if let string = tagTitle {
        self.tagTile = string
        }
        if let normalfont = normalTitleFont {
        self.normalTitleFont = normalfont
        }
        if let normalcolor = normalTitleColor {
        self.normalTitleColor = normalcolor
        }
        if let selectfont = selectedTitleFont {
        self.selectedTitleFont = selectfont
        }
        if let selectcolor = selectedTitleColor {
        self.selectedTitleColor = selectcolor
        }
       super.init()
        
    }
    //得到一个构造函数
//    init(dict: [String : AnyObject]) {
//        super.init()
//        setValuesForKeysWithDictionary(dict)
//    }
//    override func setValue(value: AnyObject?, forUndefinedKey key: String) { }

}
