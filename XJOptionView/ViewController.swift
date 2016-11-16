//
//  ViewController.swift
//  XJOptionView
//
//  Created by rxj on 16/9/28.
//  Copyright © 2016年 rxj. All rights reserved.
//

import UIKit

let navHeight: CGFloat = 64

class ViewController: UIViewController {

    var tableArray = TableArray()
    lazy var titles = {
       return ["最新", "最新热门", "热门新闻", "图片", "直播", "专题", "不好看的视频", "好玩的游戏"]
    }()
    lazy var optionView: XJOptionView = {
//        let newOptionView: XJOptionView = XJOptionView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: navHeight - 1))
        let newOptionView: XJOptionView = XJOptionView(frame: CGRect(x: 0, y: 64, width: screenWidth, height: navHeight - 1), type: .line)
        newOptionView.normalColor = UIColor.gray
        newOptionView.selectedColor = UIColor.red
        newOptionView.optionViewDelegate = self
        return newOptionView
    }()
    lazy var pageView: XJPageView = {
       let aPageView = XJPageView()
        aPageView.frame = CGRect(x: 0, y: navHeight + 63, width: screenWidth, height: screenHeight - navHeight - 63)
        aPageView.pageViewDelegate = self
        return aPageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        automaticallyAdjustsScrollViewInsets = false
//        navigationItem.titleView = optionView
        view.addSubview(optionView)
        view.addSubview(pageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}
//MARK: XJOptionViewDelegate
extension ViewController: XJOptionViewDelegate {
    func numberOfItemsInOptionView(_ optionView: XJOptionView) -> Int {
        return titles.count
    }
    func optionView(_ optionView: XJOptionView, itemSizeOfIndex index: Int) -> CGSize {
        let title = titles[index]
        let size = NSString(string: title).boundingRect(with: CGSize.zero, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: setSystemFontSize(14)], context: nil)
        return CGSize(width: size.width, height: 40)
    }
    func optionView(_ optionView: XJOptionView, cellPointConfig cellConfig: XJOptionViewCellPoint) {
        let cell = cellConfig.pointee
        cell.textLabel.text = titles[cell.index]
    }
    func optionView(_ optionView: XJOptionView, didSelectedItemOfIndex index: Int) {
       pageView.currentIndex = index
    }
}

//MARK: XJPageViewDelegate
extension ViewController: XJPageViewDelegate {
    func numbersOfItemsInPageView(_ pageView: XJPageView) -> Int {
        return titles.count
    }
    func pageView(_ pageView: XJPageView, cellForPageViewAtIndex index: Int) -> XJPageViewCell {
        let cell: XJPageViewCell = pageView.dequeueReusableCell(withReuseIdentifier: "XJPageViewCell", for: IndexPath(row: index, section: 0)) as! XJPageViewCell
        cell.index = index
        let table = tableArray.tables[index]
        table.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight - navHeight)
        cell.addSubview(table)
        return cell
    }
    func pageView(_ pageView: XJPageView, didScrollToFloatIndex floatIndex: Float) {
        guard floatIndex >= 0 && (floatIndex < Float(titles.count - 1)) else {
            return
        }
        optionView.floatIndex = floatIndex
    }
}
