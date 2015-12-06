//
//  TagViewCell.swift
//  TwoViewScrollControl
//
//  Created by 梁坤 on 15/12/1.
//  Copyright © 2015年 lk. All rights reserved.
//

import UIKit

class TagViewCell: UICollectionViewCell {
    
    var model: tagTitle? {
        didSet {
            
        self.tagLabel.text = model?.tagTile
            self.tagLabel.font = model?.normalTitleFont
            self.tagLabel.textColor = model?.normalTitleColor
        
        }
    
    }
    override var selected: Bool {
        
        didSet {
        super.selected = self.selected
            if selected {
            self.tagLabel.font = self.model?.selectedTitleFont
            self.tagLabel.textColor = self.model?.selectedTitleColor
            
            } else {
            self.tagLabel.font = self.model?.normalTitleFont
                self.tagLabel.textColor = self.model?.normalTitleColor
            
            }
        }
    
    }
    override var highlighted:Bool {
        didSet {
        super.highlighted = self.highlighted
            if highlighted {
                self.tagLabel.font = self.model?.selectedTitleFont
                self.tagLabel.textColor = self.model?.selectedTitleColor
            
            } else {
                
                self.tagLabel.font = self.model?.normalTitleFont
                self.tagLabel.textColor = self.model?.normalTitleColor

            
            }
        }
    }
    
    //重写构造方法
    override init(frame: CGRect) {
//        super.selected
        super.init(frame: frame)
        
        setUPUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        private func setUPUI() {
    
    contentView.addSubview(tagLabel)
        
        tagLabel.frame = self.bounds
        tagLabel.backgroundColor = UIColor.blueColor()
    
    }
    // 懒加载控件
    private lazy var tagLabel: UILabel = {
        
        let label = UILabel()
        
        label.textAlignment = .Center
        
    
    return label
    }()
}
