//
//  tableArray.swift
//  XJOptionView
//
//  Created by rxj on 16/10/8.
//  Copyright © 2016年 rxj. All rights reserved.
//

import UIKit

class TableArray: NSObject {
    var count = 8
    var tables = [UITableView]()
    var dataSources = [BasicDataSource]()
    override init() {
        super.init()
        
        for i in 0..<count {
            var dataSource: BasicDataSource?
            if i == 0 {
                let identifier = NSStringFromClass(Cell1.self)
                 dataSource = DataSource1(data: ["data"], cellIdentifiers: [identifier])
                dataSources.append(dataSource!)
            } else {
                dataSource = BasicDataSource()
                dataSources.append(dataSource!)
            }
            dataSource?.cellselected({ (indexpath) in
                print(indexpath)
            })
            
        }
        
        for i in 0..<count {
            let table = UITableView()
            table.dataSource = dataSources[i]
            table.delegate = dataSources[i]
            table.register(Cell1.self, forCellReuseIdentifier: NSStringFromClass(Cell1.self))
            tables.append(table)
        }
    }
}
