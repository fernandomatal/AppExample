//
//  ExperienceTitleCell.swift
//  AppExample
//
//  Created by Luis Fernando Mata on 2/27/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit

class ExperienceTitleCell: UITableViewCell {
    
    private var roleIcon: UIImageView!
    private var roleLabel: UILabel!
    
    private var locationIcon: UIImageView!
    private var locationLabel: UILabel!
    
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
        selectionStyle = .none
    }
    
    private func createUI() {
        roleIcon = UIImageView(image: UIImage(named: "Briefcase"))
        roleIcon.contentMode = .scaleAspectFit
        contentView.addSubview(roleIcon)
        roleIcon.snp.makeConstraints { (make) in
            make.left.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(24)
            make.size.equalTo(25)
        }
        
        roleLabel = UILabel()
        contentView.addSubview(roleLabel)
        roleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(roleIcon)
            make.right.equalToSuperview().inset(24)
            make.left.equalTo(roleIcon.snp.right).offset(8)
        }
        
        locationIcon = UIImageView(image: UIImage(named: "MapPin"))
        locationIcon.contentMode = .scaleAspectFit
        contentView.addSubview(locationIcon)
        locationIcon.snp.makeConstraints { (make) in
            make.centerX.equalTo(roleIcon)
            make.top.equalTo(roleIcon.snp.bottom).offset(18)
            make.size.equalTo(15)
        }
        
        locationLabel = UILabel()
        contentView.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(locationIcon)
            make.left.right.equalTo(roleLabel)
        }
        
        timeIcon = UIImageView(image: UIImage(named: "Calendar"))
        timeIcon.contentMode = .scaleAspectFit
        contentView.addSubview(timeIcon)
        timeIcon.snp.makeConstraints { (make) in
            make.centerX.equalTo(roleIcon)
            make.top.equalTo(locationIcon.snp.bottom).offset(12)
            make.size.equalTo(15)
            make.bottom.equalToSuperview().inset(24).priority(800)
        }
        
        timeLabel = UILabel()
        contentView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(timeIcon)
            make.left.right.equalTo(roleLabel)
        }
    }
    
    private func bindStyles() {
        roleIcon.tintColor = UIColor.aeDarkerGrey
        roleLabel.font = UIFont.Raleway.bold.withSize(28)
        locationIcon.tintColor = UIColor.aeFlatGrey
        locationLabel.configureWith(font: UIFont.Raleway.regular.withSize(16), color: UIColor.aeFlatGrey)
        timeIcon.tintColor = UIColor.aeFlatGrey
        timeLabel.configureWith(font: UIFont.Raleway.regular.withSize(16), color: UIColor.aeFlatGrey)
    }
    
    func configureWith(experience: Experience) {
        roleLabel.text = experience.role
        locationLabel.text = experience.location
        timeLabel.text = calculateTime(joinedAt: experience.joinedAt, leftAt: experience.leftAt)
        layoutIfNeeded()
    }
    
    private func calculateTime(joinedAt: Date, leftAt: Date?) -> String? {
        let finalDate = leftAt ?? Date()
        let formatter = DateComponentsFormatter()
        formatter.maximumUnitCount = 2
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.year, .month]
        return formatter.string(from: joinedAt, to: finalDate)
    }
}
