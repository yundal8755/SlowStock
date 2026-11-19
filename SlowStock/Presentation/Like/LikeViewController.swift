//
//  LikeViewController.swift
//  SlowStock
//
//  Created by mac on 9/28/26.
//

import UIKit
import SnapKit

final class LikeViewController: UIViewController {
    
    private let likeView = LikeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLayout()
    }
}


// MARK: - UI Logic

extension LikeViewController {
    
    private func setupUI() {
        view.backgroundColor = AppColor.background
        
        view.addSubview(likeView)
    }
    
    private func setupLayout() {
        likeView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
