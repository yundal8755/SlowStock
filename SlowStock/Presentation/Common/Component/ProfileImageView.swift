//
//  ProfileImageView.swift
//  SlowStock
//
//  Created by mac on 11/16/26.
//

import UIKit

class ProfileImageView: UIView {
    
    private let imageView = UIImageView()
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierachy()
        setupLayout()
        setupUI()
    }
    
    private func setupHierachy() {
        self.addSubview(imageView)
    }
    
    private func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 36),
            imageView.heightAnchor.constraint(equalToConstant: 36),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    private func setupUI() {
        imageView.image = UIImage(resource: .dummyImg)
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .red
        
        self.imageView.layer.masksToBounds = true
    }
    
    // subView들에 대한 Layout이 잡히면 호출되는 메서드
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setNeedsLayout()
        let myWidth = self.frame.width
        self.imageView.layer.cornerRadius = myWidth / 2
        print(myWidth)
    }
}
