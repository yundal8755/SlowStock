//
//  SearchNavBar.swift
//  SlowStock
//
//  Created by mac on 9/18/26.
//

import UIKit
import SnapKit

class SearchNavBar: UIView {
    
    private let logo: UIImageView = {
        let image = UIImageView(image: UIImage(named: "SlowStockLogo"))
        
        return image
    }()
    
    private let searchBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "SearchIcon"), for: .normal)
        btn.tintColor = .label
        
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - UI Logics

extension SearchNavBar {
    
    private func configureUI() {
        logo.contentMode = .scaleAspectFit
        
        addSubview(logo)
        addSubview(searchBtn)
    }
    
    private func configureLayout() {
        logo.snp.makeConstraints {
            $0.leading.centerY.equalToSuperview()
        }
        
        searchBtn.snp.makeConstraints { make in
            make.trailing.centerY.equalToSuperview()
        }
    }
}
