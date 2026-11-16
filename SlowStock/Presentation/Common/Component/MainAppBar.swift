//
//  MainAppBar.swift
//  SlowStock
//
//  Created by yundal on 11/16/26.
//

import UIKit

class MainAppBar: UIView {
    
    let greetMessage = UILabel()
    let appTitleText = UILabel()
    let alarmBtn = UIButton()
    let searchBtn = UIButton()
    let textStack = UIStackView()
    let profileImage = ProfileImageView()
    
    
    
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
        greetMessage.textColor = AppColor.secondaryText
        greetMessage.font = AppTypography.caption
        greetMessage.textAlignment = .left
        greetMessage.numberOfLines = 1
        greetMessage.lineBreakMode = .byTruncatingTail
        
        appTitleText.text = "Slow Stock"
        appTitleText.font = AppTypography.tabLabel
        appTitleText.textAlignment = .left
        
        textStack.axis = .vertical
        textStack.alignment = .leading
        textStack.spacing = 4
        
        textStack.addArrangedSubview(greetMessage)
        textStack.addArrangedSubview(appTitleText)
        
        addSubview(textStack)
        addSubview(profileImage)
        
        appTitleText.text = "SlowStock"
    }
    
    private func configureLayout() {
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        greetMessage.translatesAutoresizingMaskIntoConstraints = false
        appTitleText.translatesAutoresizingMaskIntoConstraints = false
        textStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImage.centerYAnchor.constraint(equalTo: textStack.centerYAnchor),
            profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),

            textStack.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            textStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 12),
            textStack.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 12),
        ])
    }
}

