//
//  DataSource1.swift
//  XJOptionView
//
//  Created by rxj on 16/10/9.
//  Copyright © 2016年 rxj. All rights reserved.
//

import UIKit

class DataSource1: BasicDataSource {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = identifiers?[0]
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier!, for: indexPath)
        cell.setupContent(data: ["img": "", "title": "标题","desTitle": "副标题", "content": "这个是内容"])
        return cell
    }
   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
   
}
