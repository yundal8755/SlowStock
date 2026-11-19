//
//  HomeView.swift
//  SlowStock
//
//  Created by mac on 9/18/26.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    private let mainAppBar = MainAppBar()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierachy()
        setupLayout()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - UI Logic

extension HomeView {
    
    private func setupHierachy() {
        addSubview(mainAppBar)
        addSubview(collectionView)
    }
    
    private func setupLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        mainAppBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: mainAppBar.bottomAnchor, constant: 24),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    private func setupUI() {
        backgroundColor = AppColor.background
        
        self.collectionView.register(
            FirstSectionCollectionViewCell.self,
            forCellWithReuseIdentifier: FirstSectionCollectionViewCell.id
        )
    }
}
