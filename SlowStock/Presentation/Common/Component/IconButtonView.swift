//
//  IconButtonView.swift
//  SlowStock
//
//  Created by mac on 11/16/26.
//

import UIKit

class IconButtonView: UIView {
    
    private let imageView = UIImageView()
    
    private var widthConstraint: NSLayoutConstraint?
    private var heightConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        
        backgroundColor = .systemGray5
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .black
        
        self.widthConstraint = imageView.widthAnchor.constraint(equalToConstant: 16)
        self.heightConstraint = imageView.heightAnchor.constraint(equalToConstant: 16)
         
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            widthConstraint!,
            heightConstraint!,
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let widths = frame.width
        
        layer.cornerRadius = widths / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setIamge(uiImage: UIImage, iconSize: CGSize) {
        self.imageView.image = uiImage
        self.changeSize(size: iconSize)
    }
    
    func setIamge(uiImage: UIImage, iconSize: Double) {
        self.imageView.image = uiImage
        self.changeSize(size: CGSize(width: iconSize, height: iconSize))
    }
    
    private func changeSize(size: CGSize) {
        widthConstraint?.constant = size.width
        heightConstraint?.constant = size.height
    }
}
