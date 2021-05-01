//
//  UITableView+Ext.swift
//  GitHub Followers
//
//  Created by Subvert on 01.05.2021.
//

import UIKit
    
extension UITableView {
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
}
