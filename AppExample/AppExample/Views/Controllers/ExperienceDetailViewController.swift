//
//  ExperienceDetailViewController.swift
//  AppExample
//
//  Created by Luis Fernando Mata on 2/22/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit

class ExperienceDetailViewController: UIViewController {
    fileprivate let iconCellIdentifier = CellNib.TableView.iconTextCell.rawValue
    fileprivate let titleCellIdentifier = CellNib.TableView.experienceTitleCell.rawValue
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let viewLayout: [Section] = Section.ordered
    
    fileprivate var experience: Experience? {
        didSet {
            renderExperience()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableVew()
    }
    
    private func configureTableVew() {
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.registerClass(nib: CellNib.TableView.iconTextCell)
        tableView.registerClass(nib: CellNib.TableView.experienceTitleCell)
    }
    
    private func renderExperience() {
        title = experience?.name
    }
    
    private func createLayout() {
        
    }
    
    func configureWith(experience: Experience) {
        self.experience = experience
    }
    
    fileprivate enum Section {
        case title
        case skills
        case appsDeveloped
        case description
        case moreInfo
        
        var iconName: String? {
            switch self {
            case .skills:
                return "Skills"
            case .appsDeveloped:
                return "Apps"
            case .description:
                return "Description"
            case .moreInfo:
                return "Company"
            default:
                return nil
            }
        }
        
        var tite: String? {
            switch self {
            case .skills:
                return NSLocalizedString("Skills", comment: "")
            case .appsDeveloped:
                return NSLocalizedString("AppsDeveloped", comment: "")
            case .description:
                return NSLocalizedString("Description", comment: "")
            default:
                return nil
            }
        }
        
        static var ordered: [Section] {
            return [.title, .skills, .appsDeveloped, .description, .moreInfo]
        }
    }
}

// MARK: - Table view data source
extension ExperienceDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewLayout.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let experience = experience else {
            return UITableViewCell()
        }
        
        let section = viewLayout[indexPath.row]
        
        switch section {
        case .title:
            return createTitleCell(tableView, cellForRowAt: indexPath, experience: experience)
        case .skills:
            let cell = createBulletCell(tableView, cellForRowAt: indexPath, iconName: section.iconName, cellTitle: section.tite, bullets: experience.mainSkills)
            cell.selectionStyle = .none
            return cell
        case .appsDeveloped:
            let cell = createIconCell(tableView, cellForRowAt: indexPath, iconName: section.iconName, cellTitle: section.tite, cellText: nil)
            cell.accessoryType = .disclosureIndicator
            return cell
        case .description:
            let cell = createIconCell(tableView, cellForRowAt: indexPath, iconName: section.iconName, cellTitle: section.tite, cellText: experience.description)
            cell.selectionStyle = .none
            return cell
        case .moreInfo:
            let cell = createIconCell(tableView, cellForRowAt: indexPath, iconName: section.iconName, cellTitle: experience.name, cellText: nil)
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        
    }
    
    private func createTitleCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, experience: Experience) -> ExperienceTitleCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: titleCellIdentifier) as! ExperienceTitleCell
        cell.configureWith(experience: experience)
        
        return cell
    }
    
    private func createIconCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, iconName: String?, cellTitle: String?, cellText: String?) -> IconTextCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellNib.TableView.iconTextCell.rawValue) as! IconTextCell
        cell.configureWith(iconName: iconName, title: cellTitle, details: cellText)
        
        return cell
    }
    
    private func createBulletCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, iconName: String?, cellTitle: String?, bullets: [String]) -> IconTextCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellNib.TableView.iconTextCell.rawValue) as! IconTextCell
        cell.configureWith(iconName: iconName, title: cellTitle, bullets: bullets)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ExperienceDetailViewController {
    fileprivate enum Cell {
        case iconTextCell
    }
}
