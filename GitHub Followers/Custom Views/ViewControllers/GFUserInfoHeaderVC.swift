//
//  GFUserInfoHeaderVC.swift
//  GitHub Followers
//
//  Created by Subvert on 25.04.2021.
//

import UIKit

class GFUserInfoHeaderVC: UIViewController {
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let loginLabel = GFTitleLabel(textAlignment: .left, fontSize: 34)
    let nameLabel = GFSecondaryTitleLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    let bioLabel = GFBodyLabel(textAlignment: .left)
    
    var user: User!

    init (user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureUI()
        configureUIElements()
    }
    
    func configureUIElements() {
        avatarImageView.downloadImage(from: user.avatarUrl)
        loginLabel.text = user.login
        nameLabel.text = user.name ?? ""
        locationImageView.image = UIImage(systemName: SFSymbols.location)
        locationImageView.tintColor = .secondaryLabel
        locationLabel.text = user.location ?? "No Location"
        bioLabel.text = user.bio ?? "No Bio Available"
        bioLabel.numberOfLines = 3
    }
    
    func addSubviews() {
        view.addSubview(avatarImageView)
        view.addSubview(loginLabel)
        view.addSubview(nameLabel)
        view.addSubview(locationImageView)
        view.addSubview(locationLabel)
        view.addSubview(bioLabel)
    }
    
    func configureUI() {
        let padding: CGFloat = 20
        let textPadding: CGFloat = 12
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90),
            
            loginLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            loginLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textPadding),
            loginLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            loginLabel.heightAnchor.constraint(equalToConstant: 38),
            
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textPadding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            locationImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textPadding),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            locationImageView.heightAnchor.constraint(equalToConstant: 20),
            
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            locationLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            bioLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: textPadding),
            bioLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
}
