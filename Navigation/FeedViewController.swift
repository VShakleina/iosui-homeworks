//
//  FeedViewController.swift
//  Navigation
//
//  Created by Viktoriia Shakleina on 11.03.2022.
//

import UIKit

class FeedViewController: UIViewController {

    private var verticalStack: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var firstButton: UIButton = {
        let fButton = UIButton()
        fButton.setTitle("Показать пост", for: .normal)
        fButton.setTitleColor(UIColor(red: 105/255, green: 40/255, blue: 63/255, alpha: 1), for: .normal)
        fButton.backgroundColor = .white
        fButton.layer.cornerRadius = 12
        fButton.clipsToBounds = true
        fButton.addTarget(self, action: #selector(didTapPostButton), for: .touchUpInside)
        fButton.translatesAutoresizingMaskIntoConstraints = false
        return fButton
    }()

    private lazy var secondButton: UIButton = {
        let sButton = UIButton()
        sButton.setTitle("Показать пост", for: .normal)
        sButton.setTitleColor(UIColor(red: 105/255, green: 40/255, blue: 63/255, alpha: 1), for: .normal)
        sButton.backgroundColor = .white
        sButton.layer.cornerRadius = 12
        sButton.clipsToBounds = true
        sButton.addTarget(self, action: #selector(didTapPostButton), for: .touchUpInside)
        sButton.translatesAutoresizingMaskIntoConstraints = false
        return sButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 222/255, green: 193/255, blue: 210/255, alpha: 1)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Лента"
        self.navigationItem.backButtonTitle = ""
        self.view.addSubview(self.verticalStack)
        self.verticalStack.addArrangedSubview(self.firstButton)
        self.verticalStack.addArrangedSubview(self.secondButton)
        self.addConstraint()
    }

    private func addConstraint() {
        let centerXConst = NSLayoutConstraint(item: verticalStack, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 1)
        let centerYConst = NSLayoutConstraint(item: verticalStack, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 1)
        let firstButtonHeight = self.firstButton.heightAnchor.constraint(equalToConstant: 40)
        let firstButtonWidth = self.firstButton.widthAnchor.constraint(equalToConstant: 180)
        let secondButtonHeight = self.secondButton.heightAnchor.constraint(equalToConstant: 40)
        let secondButtonWidth = self.secondButton.widthAnchor.constraint(equalToConstant: 180)

        NSLayoutConstraint.activate([centerXConst, centerYConst, firstButtonHeight, firstButtonWidth, secondButtonHeight, secondButtonWidth])

    }

    @objc private func didTapPostButton() {
        let postVC = PostViewController()
        postVC.closure = {
        }
        self.navigationController?.pushViewController(postVC, animated: true)
    }

}

