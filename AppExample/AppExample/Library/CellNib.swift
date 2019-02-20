//
//  CellNib.swift
//  AppExample
//
//  Created by Luis Fernando Mata on 2/20/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit

public struct CellNib {
    public enum TableView: String {
        case experienceCell
        
        var NibClass: AnyClass? {
            switch self {
            case .experienceCell:
                return ExperienceCell.self
            default:
                return nil
            }
        }
    }
}

extension UITableView {
    public func register(nib: CellNib.TableView) {
        self.register(UINib(nibName: nib.rawValue, bundle: nil), forCellReuseIdentifier: nib.rawValue)
    }
    
    public func registerClass(nib: CellNib.TableView) {
        self.register(nib.NibClass, forCellReuseIdentifier: nib.rawValue)
    }
}
