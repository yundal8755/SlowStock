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
        
        configureUI()
        configureLayout()
    }
}


// MARK: - UI Logic

extension LikeViewController {
    
    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(likeView)
    }
    
    private func configureLayout() {
        likeView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
