//
//  HomeViewController2.swift
//  SlowStock
//
//  Created by mac on 11/17/26.
//

import UIKit
import SnapKit

class HomeViewController2: UIViewController {
    private let homeView = HomeView()
    
    private enum Section {
        case topMoney
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(homeView)
        
        homeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        homeView.collectionView.setCollectionViewLayout(makeLayout(), animated: true)
    }
    
    private func makeLayout() -> UICollectionViewLayout {
        // item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(120)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(120))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}


// MARK: - DataSource


