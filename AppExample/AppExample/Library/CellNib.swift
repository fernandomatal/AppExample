//
//  CellNib.swift
//  AppExample
//
//  Created by Luis Fernando Mata on 2/20/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit

public struct CellNib {
    public enum CollectionView: String {
        case appDevelopedCell
        
        var NibClass: AnyClass? {
            switch self {
            default:
                return nil
            }
        }
        
        var NibName: String? {
            switch self {
            case .appDevelopedCell:
                return String(describing: AppDevelopedCell.self)
            }
        }
    }
    
    public enum TableView: String {
        case experienceCell
        case experienceTitleCell
        case iconTextCell
        
        var NibClass: AnyClass? {
            switch self {
            case .experienceCell:
                return ExperienceCell.self
            case .experienceTitleCell:
                return ExperienceTitleCell.self
            case .iconTextCell:
                return IconTextCell.self
            }
        }
        
        var NibName: String? {
            switch self {
            default:
                return nil
            }
        }
        
    }
}

extension UITableView {
    public func register(nib: CellNib.TableView) {
        if let nibName = nib.NibName {
            self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nib.rawValue)
        } else {
            self.register(nib.NibClass, forCellReuseIdentifier: nib.rawValue)
        }
    }
}

extension UICollectionView {
    public func register(nib: CellNib.CollectionView) {
        if let nibName = nib.NibName {
            self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nib.rawValue)
        } else {
            self.register(nib.NibClass, forCellWithReuseIdentifier: nib.rawValue)
        }
    }
}
