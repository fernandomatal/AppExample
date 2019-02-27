//
//  ExperienceTitleCell.swift
//  AppExample
//
//  Created by Luis Fernando Mata on 2/27/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit

class ExperienceTitleCell: UITableViewCell {
    
    private var mainStackView: UIStackView!
    
    private var roleContentView: UIView!
    private var roleIcon: UIImageView!
    private var roleLabel: UILabel!
    
    private var detailsStackView: UIStackView!
    private var locationContentView: UIView!
    private var locationIcon: UIImageView!
    private var locationLabel: UILabel!
    
    private var timeContentView: UIView!
    private var timeIcon: UIImageView!
    private var timeLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initMethods()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initMethods()
    }
    
    private func initMethods() {
        createUI()
        bindStyles()
    }
    
    private func createUI() {
        roleContentView = UIView()
        
        roleIcon = UIImageView()
        roleContentView.addSubview(roleIcon)
        roleIcon.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.size.equalTo(20)
        }
        
        roleLabel = UILabel()
        roleContentView.addSubview(roleLabel)
        roleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(roleIcon)
            make.right.equalToSuperview()
            make.left.equalTo(roleIcon.snp.right)
        }
    }
    
    private func bindStyles() {
        roleIcon.tintColor = UIColor.aeDarkerGrey
    }
    
    func configureWith(iconName: String, title: String?, details: String?) {
        
        layoutIfNeeded()
    }
}
