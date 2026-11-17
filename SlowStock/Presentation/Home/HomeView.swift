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
    
    let stockTableView = UITableView()
    
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
        addSubview(stockTableView)
    }
    
    private func configureLayout() {
        mainAppBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        stockTableView.snp.makeConstraints {
            $0.top.equalTo(mainAppBar.snp.bottom).offset(20)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    private func configureUI() {
        backgroundColor = AppColor.background

        stockTableView.backgroundColor = AppColor.background
        stockTableView.rowHeight = 80
        stockTableView.separatorStyle = .singleLine
        stockTableView.separatorColor = AppColor.separator
    }
}
