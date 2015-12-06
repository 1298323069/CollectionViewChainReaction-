//
//  String+Extension.swift
//  EmojiKeyboard
//
//  Created by 梁坤 on 15/11/22.
//  Copyright © 2015年 lk. All rights reserved.
//

import UIKit
extension String {

//分类中只能定义计算型属性（ 只读的属性 ）
        var emojiString: String {
    //使用扫描器扫描指定的字符串
    let scaner = NSScanner(string: self)
    //扫描字符串中的十六进制字符串
        var value:UInt32 = 0
        scaner.scanHexInt(&value)
         //将十六进制字符串转换为UniCode字符串
        let char = Character(UnicodeScalar(value))
        return "\(char)"
        
    
    }

}