//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Viktoriia Shakleina on 11.03.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {

    var avatarImageView: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "profileImage")
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var fullNameLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lady"
        return label
    }()

    private var statusLabel: UILabel = {
        var label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "waiting for sth..."
        return label
    }()

    private var setStatusButton: UIButton = {
        var button = UIButton()
        button.addTarget(self, action: #selector(didTapShowStatusButton), for: .touchUpInside)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowOffset.width = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.setTitle("Show status", for: .normal)
        button.titleLabel?.textColor = .white
        button.layer.backgroundColor = UIColor.systemBlue.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var statusTextField: UITextField = {
        var textField = UITextField()
        textField.isHidden = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.clipsToBounds = true
        textField.placeholder = "new status"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private var imageToButton: NSLayoutConstraint?
    private var buttonToStatus: NSLayoutConstraint?

    private func addConstraintsForProfileHeaderView() {
        let imageTopConstraint = self.avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        let imageLeadingConstraint = self.avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let imageHeight = self.avatarImageView.heightAnchor.constraint(equalToConstant: 100)
        imageHeight.priority = UILayoutPriority(rawValue: 999)
        let imageViewAspectRatio = self.avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor, multiplier: 1.0)
        let imageToLabel = self.avatarImageView.trailingAnchor.constraint(equalTo: self.fullNameLabel.leadingAnchor, constant: -30)
        let imageToStatusLabel = self.avatarImageView.trailingAnchor.constraint(equalTo: self.statusLabel.leadingAnchor, constant: -30)
        self.imageToButton = self.avatarImageView.bottomAnchor.constraint(equalTo: self.setStatusButton.topAnchor, constant: -16)
        imageToButton?.priority = UILayoutPriority(rawValue: 999)
        let labelTopConstraint = self.fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27)
        let buttonLeadingConstraint = self.setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let buttonTrailingConstraint = self.setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let buttonHeightConstraint = self.setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        self.buttonToStatus = self.setStatusButton.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 34)
        buttonToStatus?.priority = UILayoutPriority(rawValue: 999)

        NSLayoutConstraint.activate([imageTopConstraint, imageLeadingConstraint, imageHeight, imageViewAspectRatio, self.imageToButton, imageToLabel, imageToStatusLabel, labelTopConstraint, buttonLeadingConstraint, buttonTrailingConstraint, buttonHeightConstraint, self.buttonToStatus].compactMap({ $0 }))
    }

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
    }

    private func setupView() {
        self.addSubview(self.avatarImageView)
        self.addSubview(self.fullNameLabel)
        self.addSubview(self.statusLabel)
        self.addSubview(self.setStatusButton)
        self.addSubview(self.statusTextField)
        self.addConstraintsForProfileHeaderView()
    }

    @objc private func didTapShowStatusButton() {
        self.imageToButton?.isActive = false
        self.buttonToStatus?.isActive = false
        if self.statusTextField.isHidden {

            let textFieldToStatusLabel = self.statusTextField.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 10)
            let textFieldToImage = self.statusTextField.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 30)
            let textFieldTrailingConstraint = self.statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
            let textFieldHeight = self.statusTextField.heightAnchor.constraint(equalToConstant: 40)
            let textFieldToButton = self.statusTextField.bottomAnchor.constraint(equalTo: self.setStatusButton.topAnchor, constant: -10)
            self.buttonToStatus = self.setStatusButton.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 64)
            self.imageToButton = self.avatarImageView.bottomAnchor.constraint(equalTo: self.setStatusButton.topAnchor, constant: -46)

            NSLayoutConstraint.activate([textFieldToStatusLabel, textFieldToImage, textFieldTrailingConstraint, textFieldHeight, textFieldToButton, self.buttonToStatus, self.imageToButton].compactMap({ $0 }))
            self.setStatusButton.setTitle("Set status", for: .normal)
            self.statusTextField.alpha = 1
        } else {
            self.buttonToStatus = self.setStatusButton.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 34)
            self.imageToButton = self.avatarImageView.bottomAnchor.constraint(equalTo: self.setStatusButton.topAnchor, constant: -16)
            NSLayoutConstraint.activate([self.buttonToStatus, self.imageToButton].compactMap({ $0 }))

            self.setStatusButton.setTitle("Show status", for: .normal)
            self.statusTextField.alpha = 0
            if statusTextField.hasText {
                if let text = statusTextField.text {
                    print(text)
                    self.statusLabel.text = text
                }
            }
            self.statusTextField.text = ""
            self.endEditing(true)
        }
        UIView.animate(withDuration: 0.5) {
            self.layoutIfNeeded()
        } completion: { _ in
            self.statusTextField.isHidden.toggle()
        }
    }
}

