//
//  WelcomeViewController.swift
//  AppExample
//
//  Created by Luis Fernando Mata on 2/16/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    fileprivate let cellIdentifier = "WelcomeCell"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var blurredBackground: UIImageView!
    private var headerView: TableHeaderView!
    
    fileprivate let tableData: [TableData] = TableData.sectionsOrdered()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return internalPreferredStatusBarStyle
    }
    
    private var internalPreferredStatusBarStyle: UIStatusBarStyle = .default {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
    }
    
    private func createUI() {
        internalPreferredStatusBarStyle = .lightContent
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
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        cell.backgroundColor = .white
        cell.textLabel?.font = UIFont.Raleway.regular.withSize(16)
        cell.textLabel?.text = tableData[indexPath.row].localizedTitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let segue = tableData[indexPath.row].segue {
            performSegue(withIdentifier: segue.rawValue, sender: tableData[indexPath.row])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var percentageScrolled = scrollView.contentOffset.y / (headerView.frame.height / 3)
        percentageScrolled = min(1, percentageScrolled)
        percentageScrolled = max(0, percentageScrolled)
        blurredBackground.alpha = percentageScrolled
    }
}

extension WelcomeViewController {
    fileprivate enum TableData {
        case experience
        case aboutMe
        case realm
        case afNetworking
        case rxSwift
        case contact
        case acknowledgments
        
        var localizedTitle: String {
            switch self {
            case .experience:
                return NSLocalizedString("Experience", comment: "")
            default:
                return ""
            }
        }
        
        var segue: Segue? {
            switch self {
            case .experience:
                return .showExperience
            default:
                return nil
            }
        }
        
        static func sectionsOrdered() -> [TableData] {
            return [.experience, .aboutMe, .realm, .afNetworking, .rxSwift, .contact, .acknowledgments]
        }
    }
}
