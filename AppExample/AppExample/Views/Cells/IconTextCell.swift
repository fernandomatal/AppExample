//
//  IconCell.swift
//  AppExample
//
//  Created by Luis Fernando Mata on 2/23/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit

class IconTextCell: UITableViewCell {

    private var cellIcon: UIImageView!
    private var labelsStackView: UIStackView!
    private var cellTitle: UILabel!
    private var cellText: UILabel!
    
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
        cellIcon = UIImageView()
        cellIcon.tintColor = UIColor.aeDarkerGrey
        contentView.addSubview(cellIcon)
        cellIcon.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().inset(8)
            make.size.equalTo(20)
        }
        
        cellTitle = UILabel()
        
        cellText = UILabel()
        cellText.numberOfLines = 0
        
        labelsStackView = UIStackView(arrangedSubviews: [cellTitle,
                                                         cellText])
        labelsStackView.distribution = .equalSpacing
        labelsStackView.axis = .vertical
        labelsStackView.alignment = .leading
        contentView.addSubview(labelsStackView)
        labelsStackView.snp.makeConstraints { (make) in
            make.top.equalTo(cellIcon)
            make.left.equalTo(cellIcon.snp.right).offset(12)
            make.right.bottom.equalToSuperview().inset(8).priority(900)
        }
    }
    
    private func bindStyles() {
        cellTitle.font = UIFont.Raleway.bold.withSize(20)
        cellText.font = UIFont.Raleway.regular.withSize(14)
    }
    
    func configureWith(iconName: String, title: String?, details: String?) {
        cellIcon.image = UIImage(named: iconName)
        cellTitle.text = title
        cellText.text = details
        layoutIfNeeded()
    }
}
