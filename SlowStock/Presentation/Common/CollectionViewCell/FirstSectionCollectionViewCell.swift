//
//  FirstSectionCollectionViewCell.swift
//  SlowStock
//
//  Created by mac on 11/19/26.
//

import UIKit

final class FirstSectionCollectionViewCell: UICollectionViewCell {
    
    static let id: String = "TopMoneyCollectionViewCell"
    
    private let firstText = UILabel()
    
    func setData(_ data: FirstSectionCollectionViewCellModel) {
        firstText.text = data.data
    }
    
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
