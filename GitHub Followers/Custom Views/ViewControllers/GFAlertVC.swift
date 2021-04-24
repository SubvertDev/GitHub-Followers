//
//  GFAlertVC.swift
//  GitHub Followers
//
//  Created by Subvert on 18.04.2021.
//

import UIKit

class GFAlertVC: UIViewController {

    let containerView = GFAlertContainerView()
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    var padding: CGFloat = 20
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }

    func configureContainerView() {
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    func configureTitleLabel() {
        containerView.addSubview(containerView.titleLabel)
        containerView.titleLabel.text = alertTitle ?? "Whoops!"
        
        NSLayoutConstraint.activate([
            containerView.titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            containerView.titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            containerView.titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            containerView.titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    func configureActionButton() {
        containerView.addSubview(containerView.actionButton)
        containerView.actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        containerView.actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            containerView.actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            containerView.actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            containerView.actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            containerView.actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureMessageLabel() {
        containerView.addSubview(containerView.messageLabel)
        containerView.messageLabel.text = message ?? "Something went wrong..."
        containerView.messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            containerView.messageLabel.topAnchor.constraint(equalTo: containerView.titleLabel.bottomAnchor, constant: 8),
            containerView.messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            containerView.messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            containerView.messageLabel.bottomAnchor.constraint(equalTo: containerView.actionButton.topAnchor, constant: -12)
        ])
    }
    
    @objc func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
    
}
