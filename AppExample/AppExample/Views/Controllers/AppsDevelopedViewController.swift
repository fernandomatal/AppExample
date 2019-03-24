//
//  AppsDevelopedViewController.swift
//  AppExample
//
//  Created by Luis Fernando Mata on 3/16/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit

class AppsDevelopedViewController: UIViewController {
    fileprivate let cellIdentifier = CellNib.CollectionView.appDevelopedCell.rawValue
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var appsDeveloped: [AppDeveloped] = []
    
    private let collectionViewFlowLayout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = NSLocalizedString("AppsDeveloped", comment: "")
        configureCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        collectionViewFlowLayout.itemSize = CGSize(width: collectionView.frame.width - 40, height: collectionView.frame.height - 70)
        collectionViewFlowLayout.minimumLineSpacing = 20
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 35, left: 20, bottom: 35, right: 20)
    }
    
    private func configureCollectionView() {
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionView.register(nib: CellNib.CollectionView.appDevelopedCell)
        collectionView.allowsSelection = false
        collectionView.collectionViewLayout = collectionViewFlowLayout
        collectionView.isPagingEnabled = true
    }
    
    func configureWith(appsDeveloped: [AppDeveloped]) {
        self.appsDeveloped = appsDeveloped
    }
}

extension AppsDevelopedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appsDeveloped.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! AppDevelopedCell
        
        cell.configureWith(app: appsDeveloped[indexPath.row])
        
        return cell
    }
    
    
}
