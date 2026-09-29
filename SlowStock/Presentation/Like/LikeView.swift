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
    private let likeLabel = UILabel()
    
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
        
//        likeLabel.text = "좋아요"
        likeLabel.font = UIFont(name: "안녕", size: 16)
    }
    
    private func configureLayout() {
        searchBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
        }
    }
}
