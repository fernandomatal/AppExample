//
//  ExperienceDetailViewController.swift
//  AppExample
//
//  Created by Luis Fernando Mata on 2/22/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit

class ExperienceDetailViewController: UIViewController {
    private let iconCellIdentifier = CellNib.TableView.iconTextCell.rawValue
    
    @IBOutlet weak var tableView: UITableView!
    
    private var experience: Experience? {
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
        tableView.registerClass(nib: CellNib.TableView.iconTextCell)
    }
    
    private func renderExperience() {
        title = experience?.name
    }
    
    func configureWith(experience: Experience) {
        self.experience = experience
    }
}

// MARK: - Table view data source
extension ExperienceDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return experienceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ExperienceCell
        cell.configureWith(experience: experienceList[indexPath.row])
        
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
