//
//  UIView+extensions.swift
//  MetroSpb
//
//  Created by Ярослав Куприянов on 21.10.2023.
//

import Foundation
import UIKit

typealias Action = (() -> Void)

extension UIView {
    func withAnimation(action: Action?) {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       options: .curveLinear,
                       animations: {
            action?()
        })
    }
    
    func applyShadow() {
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
    }
    
    func removeShadow() {
        layer.shadowColor = UIColor.clear.cgColor
    }
    
    func deselect() {
        layer.removeAllAnimations()
        transform = .identity
        removeShadow()
    }
    
    func select() {
        transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        applyShadow()
    }
}
