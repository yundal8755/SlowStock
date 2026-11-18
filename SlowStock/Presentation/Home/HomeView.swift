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
        
        configureHierachy()
        configureLayout()
        configureUI()
    }
    
    // 해당 view는 Storyboard로 생성되는 방식을 지원하지 않는다는 뜻
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - UI Logic

extension HomeView {
    
    private func configureHierachy() {
        addSubview(mainAppBar)
        addSubview(collectionView)
    }
    
    private func configureLayout() {
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
    
    private func configureUI() {
        backgroundColor = AppColor.background
    }
    
    private func registCell() {
        self.collectionView.register(TopMoneyCollectionViewCell.self, forCellWithReuseIdentifier: TopMoneyCollectionViewCell.identi)
    }
}

final class TopMoneyCollectionViewCell: UICollectionViewCell {
    
    static let identi: String = "TopMoneyCollectionViewCell"
    
    private let firstText = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierachy()
        setLayout()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setHierachy() {
        self.contentView.addSubview(firstText)
    }
    
    private func setLayout() {
        firstText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstText.centerXAnchor.constraint(equalTo: centerXAnchor),
            firstText.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    private func setUI() {
        firstText.text = "$124,532.80"
        firstText.font = .systemFont(ofSize: 50)
        self.contentView.backgroundColor = .red
    }
}
