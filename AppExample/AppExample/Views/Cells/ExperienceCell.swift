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
    private var companyNameLabel: UILabel!
    private var roleLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
