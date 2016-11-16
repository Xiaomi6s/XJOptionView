//
//  DataSource.swift
//  XJOptionView
//
//  Created by rxj on 16/10/9.
//  Copyright © 2016年 rxj. All rights reserved.
//

import UIKit

typealias Closures = (IndexPath)-> Void

class BasicDataSource: NSObject {
    
    
   fileprivate var selectedClosures: Closures?
    var identifiers: [String]?
    var data: [String]?
    
   convenience init(data: [String], cellIdentifiers: [String]) {
        self.init()
        self.data = data
        self.identifiers = cellIdentifiers
    
    
    }
    
    func cellselected(_ closures: @escaping Closures) {
       selectedClosures = closures
    }
 
}

extension BasicDataSource: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        cell?.textLabel?.text = "cell\(indexPath.row)"
        return cell!
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let closures = selectedClosures {
            closures(indexPath)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
