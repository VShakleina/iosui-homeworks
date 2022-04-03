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
        let scrollViewBottom = self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)

        let contentViewTop = self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
        let contentViewBottom = self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
        let contentViewLeading = self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor)
        let contentViewTrailing = self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor)
        let contentViewWidth = self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor)

        let logoCenterX = NSLayoutConstraint(item: logoImage, attribute: .centerX, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 1, constant: 1)
        let logoWidth = self.logoImage.widthAnchor.constraint(equalToConstant: 100)
        let logoHeight = self.logoImage.heightAnchor.constraint(equalTo: self.logoImage.widthAnchor, multiplier: 1)

        let stackHeight = self.emailPasswordStack.heightAnchor.constraint(equalToConstant: 100)
        let stackLeading = self.emailPasswordStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
        let stackTrailing = self.emailPasswordStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        let stackToButton = self.emailPasswordStack.bottomAnchor.constraint(equalTo: self.logInButton.topAnchor, constant: -16)
        let buttonHeight = self.logInButton.heightAnchor.constraint(equalToConstant: 50)
        let buttonLeading = self.logInButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
        let buttonTrailing = self.logInButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        let buttonBottom = self.logInButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16)

        NSLayoutConstraint.activate([scrollViewTop, scrollViewBottom, scrollViewLeading, scrollViewTrailing, contentViewTop, contentViewBottom, contentViewLeading, contentViewTrailing, contentViewWidth, logoCenterX, logoWidth, logoHeight, stackHeight, stackLeading, stackTrailing, stackToButton, buttonHeight, buttonLeading, buttonTrailing, buttonBottom])

    }


// Немного сложная конструкция) но для правильного отображения клавиатуры, мне нужен был определенный размер contentView, и я не могла пиниться к центру контент вью (размер контент вью меньше размера экрана). У нас в макете заданы констрейнты, поэтому сделала центровку только для маленьких экранов. Единственное не уверена, правильно ли я вынесла дополнительные констрейнты сюда. Насколько я понимаю, на стадии когда я добавляю первые констрейнты, фреймы ещё не определены, и было бы неправильно использовать моё решение в методе addConstraints, но там тоже работает, я неправильно понимаю что-то?)
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let heightView = self.view.safeAreaLayoutGuide.layoutFrame.height
        if heightView < 780 {    // 780 = (120 + 100 + 120 + 50) * 2
            self.emailTextField.centerYAnchor.constraint(equalTo: self.contentView.topAnchor, constant: heightView/2).isActive = true
            self.logoImage.centerYAnchor.constraint(equalTo: self.contentView.topAnchor, constant: heightView/4).isActive = true
        } else {
            self.logoImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 120).isActive = true
            self.logoImage.bottomAnchor.constraint(equalTo: self.emailPasswordStack.topAnchor, constant: -120).isActive = true
        }
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
        super.viewDidDisappear(animated)
        let nc = NotificationCenter.default
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height // не пониманию почему, но без этого не скролится
            let offset = self.contentView.frame.height + kbdSize.height - self.view.frame.height
            if offset > 0 { //иначе на больших экранах всё съезжает вниз, к клавиатуре
                self.scrollView.contentOffset = CGPoint(x: 0, y: offset)
            }
        }
    }

    @objc private func kbdHide(notification: NSNotification) {
        self.scrollView.contentOffset = .zero
        self.scrollView.contentInset.bottom = .zero
    }


}
