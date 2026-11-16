//
//  MainAppBar.swift
//  SlowStock
//
//  Created by yundal on 11/16/26.
//

import UIKit

class MainAppBar: UIView {
    
    let profileImage = UIButton()
    let greetMessage = UILabel()
    let appTitleText = UILabel()
    let alarmBtn = UIButton()
    let searchBtn = UIButton()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        configureLayout()
    }
    
    private func configureUI() {
        greetMessage.text = "좋은 아침"
        greetMessage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(greetMessage)
        
        appTitleText.text = "SlowStock"
    }
    
    private func configureLayout() {
        
        NSLayoutConstraint.activate([
            greetMessage.centerXAnchor.constraint(equalTo: centerXAnchor),
            greetMessage.centerYAnchor.constraint(equalTo: centerYAnchor),
            
        ])
    }
}

