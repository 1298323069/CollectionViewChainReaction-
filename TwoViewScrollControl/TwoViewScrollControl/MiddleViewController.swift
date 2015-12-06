//
//  MiddleViewController.swift
//  TwoViewScrollControl
//
//  Created by 梁坤 on 15/12/1.
//  Copyright © 2015年 lk. All rights reserved.
//

import UIKit

class MiddleViewController: UIViewController {
    private func setUPDefaultProprietys() {
        self.normalTitleFont = UIFont.systemFontOfSize(14)
        self.normalTitleColor = UIColor.darkGrayColor()
        
        self.selectTitleFont = UIFont.systemFontOfSize(16)
        self.selectTitleColor = UIColor.redColor()
        
        self.selectIndicatorColor = UIColor.redColor()
        self.tagItemSize = CGSizeZero
        self.tagItemGap = 10.0
        self.selectIndex = -1
        
        
        
    }
    
    
    private lazy var normalTitleFont: UIFont = {
        
        let af = UIFont.systemFontOfSize(20)
        return af
        
    }() //
    private lazy  var normalTitleColor: UIColor = {
        let nc = UIColor.darkGrayColor()
        return nc
    }()
    private lazy var selectTitleFont: UIFont = {
        let sf = UIFont.systemFontOfSize(30)
        return sf
        
    }()
    private lazy  var selectTitleColor: UIColor = {
        let sc = UIColor.redColor()
        return sc
    }()
    var selectIndicatorSize: CGSize?
    private lazy var selectIndicatorColor: UIColor = {
        
        let sc = UIColor.redColor()
        return sc
        
    }()
    var tagItemSize: CGSize = CGSizeZero
    
    
    var tagItemGap: CGFloat = 10
    
    var timeInterval: NSTimer?
    var gapAnimate: Bool?
    
    var tagViewHeight: CGFloat?
    
    var tagFlowLayout: UICollectionViewFlowLayout?
    var tagTitleModelArray = [tagTitle]()
    //加载上方View中的数据
    private func setTagTitleModelArray(arr: [String]) {
        
        for var i = 0; i < arr.count; i++ {
            let model = tagTitle(tagTitle: arr[i], normaltitleFont: self.normalTitleFont, normalTitleColor: self.normalTitleColor, selectedTitleFont: self.selectTitleFont, selectedTitleColor: self.selectTitleColor)
            self.tagTitleModelArray.append(model)
            
        }
        
    }
    
    
    
    
    
    var selectIndex: NSInteger = -1
    
    var displayClass = [UIViewController]()
    var parameters = [String]()
    
    //        var selectIndicator: UIView?
    var graceTimer: NSTimer?
    
    
    //    override func loadView() {
    //
    //    }
    
    func load(arr:[String], displayClass:[UIViewController],params:[AnyObject]?) {
        
        self .setTagTitleModelArray(arr)
        self.displayClass = displayClass
        self.tagCollectionView.reloadData()
        self.pageCollectionView.reloadData()
        self.reSetSelectedIndex()
        
        
        
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    
    func setUPUIWithTagHeigh(tagviewHeigh: CGFloat) {
        self.tagViewHeight = tagviewHeigh
        view.addSubview(tagCollectionView)
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
        
        view.addSubview(pageCollectionView)
        pageCollectionView.delegate = self
        pageCollectionView.dataSource = self
        view.addSubview(selectionIndicator)
        
        tagCollectionView.frame = CGRectMake(0, 0, ScreenWith, tagviewHeigh)
        
        
        selectionIndicator.frame = CGRectMake(0, self.tagViewHeight!, self.tagItemSize.width, self.tagItemSize.height)
        
        
        pageCollectionView.frame = CGRectMake(0, tagviewHeigh + self.tagItemSize.height, ScreenWith, ScreenHeigh)
        
        
        
    }
    //MARK: 懒加载上面的View
    
    
    //懒加载上发的View
    private lazy  var tagCollectionView: UICollectionView = {
        let tagLayout = UICollectionViewFlowLayout()
        //               let tagLayout = LKCOllectionViewFlowLayout()
        //        tagLayout.tagTitles = self.tagTitleModelArray
        
        tagLayout.scrollDirection = .Horizontal
        
        tagLayout.minimumInteritemSpacing = 5
        tagLayout.minimumLineSpacing = 5
        tagLayout.itemSize = CGSize(width: 100, height: 100)
        //
        
        let tagView = UICollectionView(frame: CGRectZero, collectionViewLayout: tagLayout)
        
        
        tagView.registerClass(TagViewCell.self, forCellWithReuseIdentifier:tagCellID)
        tagView.backgroundColor = UIColor.whiteColor()
        tagView.bounces = false
        tagView.showsHorizontalScrollIndicator = true
        tagView.tag = 0
        return tagView
        
    }()
    //MARK: 懒加载指示的控制器
    private lazy var selectionIndicator: UIView = {
        
        let v = UIView()
        v.backgroundColor = UIColor.randomColor()
        
        return v
    }()
    //MARK: 懒加载下面的View
    private lazy var pageCollectionView: UICollectionView = {
        let pageLayout = UICollectionViewFlowLayout()
        pageLayout.scrollDirection = .Horizontal
        pageLayout.minimumLineSpacing = 0
        
        pageLayout.minimumInteritemSpacing = 0
        pageLayout.itemSize = CGSize(width:ScreenWith , height: ScreenHeigh)
        
        
        let pageView = UICollectionView(frame: CGRectZero, collectionViewLayout: pageLayout)
        
        
        pageView.registerClass(PageViewCell.self, forCellWithReuseIdentifier: pageCellId)
        pageView.backgroundColor = UIColor.randomColor()
        pageView.pagingEnabled = true
        pageView.tag = 1
        
        
        
        
        
        return pageView
    }()
    
}

private var gracetimer: NSTimer = {
    let a  = NSTimer()
    return a
    
}()

private var framecashes: [String:AnyObject] = {
    let a = [String : AnyObject]()
    return a
    
}()



extension MiddleViewController: UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tagTitleModelArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(tagCellID, forIndexPath:indexPath) as! TagViewCell
            cell.model = self.tagTitleModelArray[indexPath.item]
            
            return cell
            
            
        } else {
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(pageCellId, forIndexPath:indexPath) as! PageViewCell
            
            let controller = self.displayClass[indexPath.item]
            
            cell.configCell(controller)
            
            return cell
            
        }
        
    }
    
}

//UICollectionView的代理方法

extension MiddleViewController: UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if isTagView(collectionView) {
            //            collectionView.selectItemAtIndexPath(indexPath, animated: true, scrollPosition: UICollectionViewScrollPosition.None)
            
            
            collectionView.selectItemAtIndexPath(indexPath, animated: true, scrollPosition: UICollectionViewScrollPosition.CenteredHorizontally)
            
            
            //设置点击了以后滚动到中心位置
            
            let cell = collectionView.cellForItemAtIndexPath(indexPath)
            if let a = cell {
                a.selected = true
                let offSet = collectionView.contentOffset.x
                let ceterx = a.center.x
                let indictorx = ceterx - offSet
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    
                    self.selectionIndicator.center.x = indictorx
                    
                    
                    
                })
                
                
            }
            
            
            
            
            
            
            
            
            let xIndex = CGFloat (indexPath.item)
            
            let a: CGFloat = xIndex * ScreenWith
            let y = self.pageCollectionView.frame.origin.y
            //设置下方的View滚动到响应的位置
            let rect:CGRect = CGRect(x: a, y: y, width: ScreenWith, height: ScreenHeigh)
            //            self.pageCollectionView.scrollRectToVisible(rect, animated: true)
            
            self.pageCollectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.Right, animated: true)
            let celcenterx = cell?.center.x
            let  xxx = self.selectionIndicator.center.x
            
            if celcenterx == xxx {
                
            }  else {
                
                let cell = collectionView.cellForItemAtIndexPath(indexPath)
                if let a = cell {
                    
                    let offSet = collectionView.contentOffset.x
                    let ceterx = a.center.x
                    let indictorx = ceterx - offSet
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        
                        self.selectionIndicator.center.x = indictorx
                        
                        
                        
                    })
                    
                    
                }
                
                
                
            }
            
        }
        
        
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        if isTagView(collectionView) == false {
            self.tagCollectionView.x = 0
            print(self.tagCollectionView.x)
            
            self.collectionView(self.tagCollectionView, didSelectItemAtIndexPath: indexPath)
            print(indexPath)
            
        }
    }
    func collectionView(collectionView: UICollectionView, moveItemAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let cell = self.tagCollectionView.cellForItemAtIndexPath(destinationIndexPath)
        print(cell)
        
    }
    
}

//其他相关的扩展的方法

extension MiddleViewController {
    
    //返回字符串大小的方法
    func sizeForTitle(title title:String, font: UIFont) -> CGSize {
        
        let tit = title as NSString
        let a = CGFloat(FLT_MAX)
        let attribute = [NSFontAttributeName:font]
        let option = NSStringDrawingOptions.UsesLineFragmentOrigin
        
        let size = CGSizeMake(a, a)
        let rect: CGRect = tit.boundingRectWithSize(size, options: option, attributes: attribute, context: nil)
        let cgsize = rect.size
        return cgsize
    }
    
    private func reSetSelectedIndex() {
        
        let delayInSecont = 1.0
        
        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delayInSecont * Double(NSEC_PER_SEC)))
        
        
        //设置过一段时间执行选中上方Cell的方法
        
        dispatch_after(popTime, dispatch_get_main_queue()) { () -> Void in
            let indexpath = NSIndexPath(forItem: 0, inSection: 0)
            self.tagCollectionView.selectItemAtIndexPath(indexpath, animated: true, scrollPosition: UICollectionViewScrollPosition.None)
            //            self.collectionView(self.tagCollectionView, didSelectItemAtIndexPath: indexpath)
        }
        
    }
    //判断是否为上方的View
    private func isTagView(view: UICollectionView) -> Bool {
        
        let a = (view.tag == 0) ? true : false
        return a
    }
    
    private func isSizeZero(size:CGSize) -> Bool {
        
        let a = CGSizeEqualToSize(CGSizeZero,size) ? true : false
        return a
        
    }
    
    
    
}
