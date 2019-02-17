//
//  TableHeaderView.swift
//  AppExample
//
//  Created by Luis Fernando Mata on 2/16/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit
import SnapKit

class TableHeaderView: UIView {
    
    private var contentView: UIView!
    private var photoImageView: UIImageView!
    private var labelsStackView: UIStackView!
    private var nameLabel: UILabel!
    private var headlineLabel: UILabel!

    init() {
        super.init(frame: CGRect.zero)
        initMethods()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        contentView = UIView()
        contentView.backgroundColor = UIColor.clear
        addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        photoImageView = UIImageView()
        photoImageView.contentMode = .scaleAspectFill
        contentView.addSubview(photoImageView)
        photoImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().dividedBy(0.5)
            make.size.equalTo(50)
        }
        
        labelsStackView = UIStackView()
        labelsStackView.alignment = .center
        labelsStackView.spacing = 2
        labelsStackView.distribution = .equalSpacing
        labelsStackView.axis = .vertical
        contentView.addSubview(labelsStackView)
        labelsStackView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.bottom.equalToSuperview().inset(16)
            make.right.left.equalToSuperview().inset(10)
        }
        
        nameLabel = UILabel()
        nameLabel.text = NSLocalizedString("FullName", comment: "")
        labelsStackView.addArrangedSubview(nameLabel)
        
        headlineLabel = UILabel()
        headlineLabel.text = NSLocalizedString("Headline", comment: "")
        headlineLabel.numberOfLines = 0
        labelsStackView.addArrangedSubview(headlineLabel)
    }
    
    private func bindStyles() {
        nameLabel.configureWith(font: UIFont.Raleway.bold.withSize(13), color: UIColor.aeFlatGrey)
        headlineLabel.configureWith(font: UIFont.Raleway.regular.withSize(10), color: UIColor.aeFlatGrey)
    }
}
