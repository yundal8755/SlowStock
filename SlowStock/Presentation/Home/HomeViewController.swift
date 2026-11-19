//
//  HomeViewController.swift
//  SlowStock
//
//  Created by mac on 11/17/26.
//

import UIKit
import SnapKit


nonisolated enum HomeViewControllerSection: Hashable, Sendable, CaseIterable {
    case firstSection
}

nonisolated struct FirstSectionCollectionViewCellModel: Sendable, Hashable {
    let data: String
}

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    
    private var dataSource: UICollectionViewDiffableDataSource<HomeViewControllerSection,FirstSectionCollectionViewCellModel>? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hierachy
        view.addSubview(homeView)
        
        // Layout
        homeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        homeView.collectionView.setCollectionViewLayout(makeLayout(), animated: true)
        
        // Logic
        setupDatasource()
        applySnapshot()
    }
}


// MARK: - CollectionView Logic
extension HomeViewController {
    
    private func makeLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(120))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(120))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func setupDatasource() {
        dataSource = UICollectionViewDiffableDataSource<HomeViewControllerSection,FirstSectionCollectionViewCellModel>(
            collectionView: homeView.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            switch HomeViewControllerSection.allCases[indexPath.section] {
            case .firstSection:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstSectionCollectionViewCell.id, for: indexPath)
                        as? FirstSectionCollectionViewCell else { return UICollectionViewCell() }
                cell.setData(itemIdentifier)
                return cell
            }
        })
    }
    
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<HomeViewControllerSection, FirstSectionCollectionViewCellModel>()
        
        snapshot.appendSections(HomeViewControllerSection.allCases)
        snapshot.appendItems([.init(data: "첫번째 섹션")], toSection: .firstSection)
        
        dataSource?.apply(snapshot, animatingDifferences: false)
    }
}
