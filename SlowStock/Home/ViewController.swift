//
//  ViewController.swift
//  SlowStock
//
//  Created by mac on 9/16/26.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let homeView = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(homeView)
        
        homeView.snp.makeConstraints { 
            $0.edges.equalToSuperview()
        }
    }
}

