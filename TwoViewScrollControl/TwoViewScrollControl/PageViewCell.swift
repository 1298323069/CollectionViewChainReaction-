//
//  PageViewCell.swift
//  TwoViewScrollControl
//
//  Created by 梁坤 on 15/12/1.
//  Copyright © 2015年 lk. All rights reserved.
//

import UIKit

class PageViewCell: UICollectionViewCell {
    //重写构造方法
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupUI()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //setUPUI
    private func setupUI() {
        contentView.addSubview(view);
        
        view.frame = self.bounds
    
    }
    // 懒加载控件
    private lazy var view: UIView = {
        
    let view = UIView()
        
        return view
    
    }()
    func configCell(controller: UIViewController) {
    controller.view.frame = self.bounds
        contentView.addSubview(controller.view)
    
    }
    
}
