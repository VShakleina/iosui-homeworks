//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Viktoriia Shakleina on 11.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var newButton: UIButton = {
        var button = UIButton()
        button.setTitle("new button", for: .normal)
        button.titleLabel?.textColor = .white
        button.layer.backgroundColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 222/255, green: 193/255, blue: 210/255, alpha: 1)
        self.navigationItem.title = "Профиль"
        self.view.addSubview(self.profileHeaderView)
        self.view.addSubview(self.newButton)
        self.addConstraints()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    private func addConstraints() {
        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let heightPHV = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)

        let newButtonLeading = self.newButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let newButtonTrailing = self.newButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let newButtonBottom = self.newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, heightPHV, newButtonLeading, newButtonTrailing, newButtonBottom])
    }

}
