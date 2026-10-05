//
//  LikeView.swift
//  SlowStock
//
//  Created by yundal on 9/29/26.
//

import UIKit
import SnapKit

final class LikeView: UIView {
    
    private let searchBar = SearchNavBar()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - UI Logic

extension LikeView {
    
    private func configureUI() {
        addSubview(searchBar)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(tableView)
        
        titleLabel.text = "좋아요"
        titleLabel.font = .systemFont(ofSize: 24)
        titleLabel.textColor = .label
        
        subtitleLabel.text = "총 3개"
        subtitleLabel.font = .systemFont(ofSize: 12)
        subtitleLabel.textColor = .label
        
        tableView.rowHeight = 80
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .systemGray5
    }
    
    private func configureLayout() {
        searchBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(20)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(20)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }
}
