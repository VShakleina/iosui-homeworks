//
//  File.swift
//  Navigation
//
//  Created by Viktoriia Shakleina on 12.03.2022.
//

import UIKit

class LogInViewController: UIViewController {

    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    private var logoImage: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo")
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()

    private var emailPasswordStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.layer.borderWidth = 0.5
        stack.layer.cornerRadius = 10
        stack.clipsToBounds = true
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private var emailTextField: UITextField = {
        let textField  = UITextField()
        textField.textColor = .black
        textField.backgroundColor = .systemGray6
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.placeholder = "Email or phone"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.tintColor = UIColor(named: "accentColor-1")
        textField.clearButtonMode = .always
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.returnKeyType = .done
        textField.keyboardAppearance = .alert
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.backgroundColor = .systemGray6
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.placeholder = "Password"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.tintColor = UIColor(named: "accentColor-1")
        textField.clearButtonMode = .always
        textField.isSecureTextEntry = true
        textField.returnKeyType = .done
        textField.keyboardAppearance = .alert
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private var logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.textColor = .white
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapLogInButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private func alphaForButton() {
        switch logInButton.state {
        case .normal:
            self.logInButton.alpha = 1.0
        case .selected, .disabled, .highlighted:
            self.logInButton.alpha = 0.8
        default:
            self.logInButton.alpha = 0.8
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.tabBarController?.tabBar.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        self.view.addSubview(scrollView)
        self.scrollView.contentSize = self.view.bounds.size
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(logoImage)
        self.contentView.addSubview(emailPasswordStack)
        self.emailPasswordStack.addArrangedSubview(self.emailTextField)
        self.emailPasswordStack.addArrangedSubview(self.passwordTextField)
        self.contentView.addSubview(logInButton)
        self.addConstraints()
        self.alphaForButton()
    }

    private func addConstraints() {

        let scrollViewTop = self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let scrollViewLeading = self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let scrollViewTrailing = self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        let scrollViewBottom = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)

        let contentViewTop = self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
        let contentViewBottom = self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
        let contentViewLeading = self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor)
        let contentViewTrailing = self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor)

        let contentViewWidth = self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor)
        let contentViewHeight = self.contentView.heightAnchor.constraint(equalToConstant: 506)
        contentViewHeight.priority = UILayoutPriority(rawValue: 250)

        let logoToTop = self.logoImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 120)
        let logoCenterX = NSLayoutConstraint(item: logoImage, attribute: .centerX, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 1, constant: 1)
        let logoWidth = self.logoImage.widthAnchor.constraint(equalToConstant: 100)
        let logoHeight = self.logoImage.heightAnchor.constraint(equalTo: self.logoImage.widthAnchor, multiplier: 1)
        let logoToStack = self.logoImage.bottomAnchor.constraint(equalTo: self.emailPasswordStack.topAnchor, constant: -120)
        let stackHeight = self.emailPasswordStack.heightAnchor.constraint(equalToConstant: 100)
        let stackLeading = self.emailPasswordStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
        let stackTrailing = self.emailPasswordStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        let stackToButton = self.emailPasswordStack.bottomAnchor.constraint(equalTo: self.logInButton.topAnchor, constant: -16)
        let buttonHeight = self.logInButton.heightAnchor.constraint(equalToConstant: 50)
        let buttonLeading = self.logInButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
        let buttonTrailing = self.logInButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)

        NSLayoutConstraint.activate([scrollViewTop, scrollViewBottom, scrollViewLeading, scrollViewTrailing, contentViewTop, contentViewBottom, contentViewLeading, contentViewTrailing, contentViewWidth, contentViewHeight, logoToTop, logoCenterX, logoWidth, logoHeight, logoToStack, stackHeight, stackLeading, stackTrailing, stackToButton, buttonHeight, buttonLeading, buttonTrailing])
    }

    @objc func didTapLogInButton(){
        alphaForButton()
        let profileVC = ProfileViewController()
        profileVC.closure = {
        }
        self.navigationController?.pushViewController(profileVC, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        let nc = NotificationCenter.default
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }

    @objc private func kbdHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
}
