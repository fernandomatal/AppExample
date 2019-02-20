//
//  ExperienceTableViewCell.swift
//  AppExample
//
//  Created by Luis Fernando Mata on 2/20/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit

class ExperienceCell: UITableViewCell {
    
    private var companyIconImage: UIImageView!
    private var labelsStackView: UIStackView!
    private var companyNameLabel: UILabel!
    private var roleLabel: UILabel!
    
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
        companyIconImage = UIImageView()
        companyIconImage.contentMode = .scaleAspectFit
        contentView.addSubview(companyIconImage)
        companyIconImage.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview().inset(8)
            make.width.equalTo(companyIconImage.snp.height)
        }
        
        companyNameLabel = UILabel()
        
        roleLabel = UILabel()
        
        labelsStackView = UIStackView(arrangedSubviews: [companyNameLabel,
                                                         roleLabel])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 2
        contentView.addSubview(labelsStackView)
        labelsStackView.snp.makeConstraints { (make) in
            make.centerY.equalTo(companyIconImage)
            make.left.equalTo(companyIconImage.snp.right).offset(12)
            make.right.equalToSuperview().inset(8)
        }
    }
    
    private func bindStyles() {
        companyNameLabel.font = UIFont.Raleway.bold.withSize(18)
        roleLabel.font = UIFont.Raleway.light.withSize(14)
    }
    
    func configureWith(experience: Experience) {
        companyIconImage.image = UIImage(named: experience.logo)
        companyNameLabel.text = experience.name
        roleLabel.text = experience.role
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        companyIconImage.image = nil
        companyNameLabel.text = nil
        roleLabel.text = nil
    }
}
