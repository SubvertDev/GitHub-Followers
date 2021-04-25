//
//  UserInfoVC.swift
//  GitHub Followers
//
//  Created by Subvert on 24.04.2021.
//

import UIKit

class UserInfoVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = cancelButton
        
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something gone wrong!", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
}
