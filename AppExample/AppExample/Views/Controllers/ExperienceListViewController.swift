//
//  ExperienceListViewController.swift
//  AppExample
//
//  Created by Luis Fernando Mata on 2/20/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit

class ExperienceListViewController: UIViewController {
    fileprivate let cellIdentifier = CellNib.TableView.experienceCell.rawValue
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let experienceList: [Experience] = ExperienceManager.shared.experiences.sorted(by: { $0.joinedAt < $1.joinedAt })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = NSLocalizedString("Experience", comment: "")
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configureTableView() {
        tableView.registerClass(nib: CellNib.TableView.experienceCell)
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = 90
        tableView.tableFooterView = UIView()
    }
}

// MARK: - Table view data source
extension ExperienceListViewController: UITableViewDataSource, UITableViewDelegate {
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
