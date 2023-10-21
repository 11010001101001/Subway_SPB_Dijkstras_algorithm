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
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
    }
    
    func removeShadow() {
        self.layer.shadowColor = UIColor.clear.cgColor
    }
}
