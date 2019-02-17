//
//  WelcomeViewController.swift
//  AppExample
//
//  Created by Luis Fernando Mata on 2/16/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    private var headerView: TableHeaderView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
    }
    
    private func createUI() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        headerView = TableHeaderView()
        tableView.tableHeaderView = headerView
    }
    
    override func viewWillLayoutSubviews() {
        updateSizeForHeaderView(inTableView: tableView)
    }
    
    private func updateSizeForHeaderView(inTableView tableView : UITableView) {
        let size = headerView.systemLayoutSizeFitting(tableView.frame.size, withHorizontalFittingPriority: .required, verticalFittingPriority: .defaultLow)
        headerView.frame.size = size
    }
}

    // MARK: - Table view data source

extension WelcomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
