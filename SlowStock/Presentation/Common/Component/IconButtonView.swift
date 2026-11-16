//
//  IconButtonView.swift
//  SlowStock
//
//  Created by mac on 11/16/26.
//

import UIKit

class IconButtonView: UIView {
    
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 4),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 4),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setIamge(uiImage: UIImage) {
        self.imageView.image = uiImage
    }
}
