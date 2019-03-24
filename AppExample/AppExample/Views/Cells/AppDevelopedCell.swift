//
//  AppDevelopedCell.swift
//  AppExample
//
//  Created by Luis Fernando Mata on 3/9/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit
import RxSwift

class AppDevelopedCell: UICollectionViewCell {
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var usersLabel: UILabel!
    @IBOutlet weak var osLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var technologiesLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        backgroundColor = .clear
    }
    
    func configureWith(app: AppDeveloped) {
        nameLabel.text = app.name
        platformLabel.text = NSLocalizedString("Platform", comment: "") + ": " + app.platform
        usersLabel.text = NSLocalizedString("Users", comment: "") + ": " + app.users
        osLabel.text = NSLocalizedString("OS", comment: "") + ": " + app.os
        languageLabel.text = NSLocalizedString("ProgrammingLanguage", comment: "") + ": " + app.language
        descriptionLabel.text = app.description
        let bulletsString = app.technologies.enumerated().reduce("", { $1.offset != 0 ? ($0 + "\n• " + $1.element) : $0 + "• " + $1.element })
        technologiesLabel.text = bulletsString
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        platformLabel.text = nil
        usersLabel.text = nil
        osLabel.text = nil
        languageLabel.text = nil
        descriptionLabel.text = nil
        technologiesLabel.text = nil
    }
}
