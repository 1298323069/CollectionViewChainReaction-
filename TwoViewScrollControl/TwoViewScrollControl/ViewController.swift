//
//  ViewController.swift
//  TwoViewScrollControl
//
//  Created by 梁坤 on 15/11/30.
//  Copyright © 2015年 lk. All rights reserved.
//

import UIKit

class ViewController: MiddleViewController {

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        self.tagItemSize = CGSize(width: 80, height: 20)
        
        let  arr:[String] = ["image","table","collect","image","table","collect"]
        setUPUIWithTagHeigh(100)
        
        let display:[UIViewController] = [LKUIViewController(),LKUITableViewController(),manuViewController(),LKUIViewController(),LKUITableViewController(),manuViewController()]
        
        


        
        load(arr, displayClass: display, params: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    


}

