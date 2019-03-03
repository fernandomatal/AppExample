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
    var cellTitle: UILabel!
    var cellText: UILabel!
    
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
            make.left.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(24)
            make.size.equalTo(25)
        }
        
        cellTitle = UILabel()
        
        cellText = UILabel()
        cellText.numberOfLines = 0
        
        labelsStackView = UIStackView(arrangedSubviews: [cellTitle,
                                                         cellText])
        labelsStackView.distribution = .equalSpacing
        labelsStackView.axis = .vertical
        labelsStackView.alignment = .leading
        labelsStackView.spacing = 12
        contentView.addSubview(labelsStackView)
        labelsStackView.snp.makeConstraints { (make) in
            make.top.equalTo(cellIcon)
            make.left.equalTo(cellIcon.snp.right).offset(8)
            make.right.bottom.equalToSuperview().inset(24).priority(900)
        }
    }
    
    private func bindStyles() {
        cellTitle.font = UIFont.Raleway.bold.withSize(24)
        cellText.configureWith(font: UIFont.Raleway.regular.withSize(16), color: UIColor.aeFlatGrey)
    }
    
    func configureWith(iconName: String?, title: String?, details: String?) {
        cellIcon.image = UIImage(named: iconName ?? "")
        cellIcon.isHidden = iconName == nil
        cellTitle.text = title
        cellTitle.isHidden = title == nil
        cellText.text = details
        cellText.isHidden = details == nil
        layoutIfNeeded()
    }
    
    func configureWith(iconName: String?, title: String?, bullets: [String]) {
        cellIcon.image = UIImage(named: iconName ?? "")
        cellTitle.text = title
        let bulletsString = bullets.enumerated().reduce("", { $1.offset != 0 ? ($0 + "\n• " + $1.element) : $0 + "• " + $1.element })
        self.cellText.text = bulletsString
        layoutIfNeeded()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellIcon.image = nil
        cellIcon.isHidden = false
        cellTitle.text = nil
        cellTitle.isHidden = false
        cellText.text = nil
        cellText.isHidden = false
        accessoryType = .none
        selectionStyle = .default
    }
}
