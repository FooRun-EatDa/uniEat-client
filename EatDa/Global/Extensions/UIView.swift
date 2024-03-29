//
//  UIView.swift
//  EatDa
//
//  Created by 김나희 on 2022/02/10.
//

import UIKit

extension UIView {
    func makeShadow(_ color: UIColor, _ opacity: Float, _ offset: CGSize, _ radius: CGFloat) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
    }
    
    func makeRound(radius: CGFloat = 4) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}
