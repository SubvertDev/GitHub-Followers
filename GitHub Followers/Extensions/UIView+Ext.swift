//
//  UIView+Ext.swift
//  GitHub Followers
//
//  Created by Subvert on 29.04.2021.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
