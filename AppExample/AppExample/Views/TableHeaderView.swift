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
    private var whiteBackground: UIView!
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
        
        whiteBackground = UIView()
        whiteBackground.backgroundColor = .white
        contentView.addSubview(whiteBackground)
        
        photoImageView = UIImageView()
        photoImageView.image = UIImage(named: "Fernando Photo")
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.layer.borderColor = UIColor.aeFlatGrey.cgColor
        photoImageView.layer.borderWidth = 2
        photoImageView.layer.masksToBounds = true
        photoImageView.layer.cornerRadius = 60
        photoImageView.contentMode = .scaleAspectFill
        contentView.addSubview(photoImageView)
        photoImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(100).priority(910)
            make.size.equalTo(120).priority(900)
        }
        
        whiteBackground.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(photoImageView.snp.centerY)
        }
        
        nameLabel = UILabel()
        nameLabel.text = NSLocalizedString("FullName", comment: "")
        
        headlineLabel = UILabel()
        headlineLabel.text = NSLocalizedString("Headline", comment: "")
        headlineLabel.numberOfLines = 0
        
        labelsStackView = UIStackView(arrangedSubviews: [nameLabel,
                                                         headlineLabel])
        labelsStackView.alignment = .center
        labelsStackView.spacing = 2
        labelsStackView.distribution = .fill
        labelsStackView.axis = .vertical
        contentView.addSubview(labelsStackView)
        labelsStackView.snp.makeConstraints { (make) in
            make.top.equalTo(photoImageView.snp.bottom).offset(2)
            make.bottom.equalToSuperview().inset(16).priority(500)
            make.right.left.equalToSuperview().inset(10)
            make.height.greaterThanOrEqualTo(1)
        }
    }
    
    private func bindStyles() {
        nameLabel.configureWith(font: UIFont.Raleway.bold.withSize(13), color: UIColor.aeFlatGrey)
        headlineLabel.configureWith(font: UIFont.Raleway.regular.withSize(10), color: UIColor.aeFlatGrey)
    }
}
