//
//  Cell1.swift
//  XJOptionView
//
//  Created by rxj on 16/10/9.
//  Copyright © 2016年 rxj. All rights reserved.
//

import UIKit

class Cell1: UITableViewCell {

    
    var imgView: UIImageView!
    var titleLabel: UILabel!
    var desLabel: UILabel!
    var contentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstrints()
    }
    
    func setupUI() {
        imgView = UIImageView()
        imgView.backgroundColor = UIColor.purple
        contentView.addSubview(imgView)
        
        titleLabel = UILabel()
        titleLabel.font = setSystemFontSize(16)
        titleLabel.textColor = UIColor.black
        contentView.addSubview(titleLabel)
        
        desLabel = UILabel()
        desLabel.font = setSystemFontSize(14)
        desLabel.numberOfLines = 0
        desLabel.textColor = UIColor.gray
        contentView.addSubview(desLabel)
        
        contentLabel = UILabel()
        contentLabel.numberOfLines = 0
        contentLabel.font = setSystemFontSize(12)
        contentLabel.textColor = UIColor.darkText
        contentView.addSubview(contentLabel)
    }
    func setupConstrints() {
        imgView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(10)
            make.height.width.equalTo(30)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imgView.snp.right).inset(-10)
            make.top.equalTo(imgView.snp.top)
        }
        desLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.left)
            make.top.equalTo(titleLabel.snp.bottom).inset(2)
            
        }
        contentLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imgView.snp.left)
            make.top.equalTo(imgView.snp.bottom)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    override func setupContent(data: [String : String]) {
        titleLabel.text = data["title"]
        desLabel.text = data["desTitle"]
        contentLabel.text = data["content"]
    }

}
