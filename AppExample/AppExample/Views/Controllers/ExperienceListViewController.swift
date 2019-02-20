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
    
    fileprivate let experienceList: [Experience] = ExperienceManager.shared.experiences
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerClass(nib: CellNib.TableView.experienceCell)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
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
        return UITableViewCell()
    }
}
