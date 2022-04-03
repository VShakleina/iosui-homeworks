//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Viktoriia Shakleina on 13.03.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    struct ViewModel: ViewModelProtocol {
        let author: String
        let description: String
        let image: String
        let likes: Int
        let views: Int
    }

    private var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.backgroundColor = .white
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var postImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var viewsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.contentView.backgroundColor = .white

        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.authorLabel)
        self.backView.addSubview(self.postImageView)
        self.backView.addSubview(self.descriptionLabel)
        self.backView.addSubview(self.likesLabel)
        self.backView.addSubview(self.viewsLabel)

        self.addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.authorLabel.text = nil
        self.postImageView.image = nil
        self.descriptionLabel.text = nil
        self.likesLabel.text = nil
        self.viewsLabel.text = nil
    }

    private func addConstraints() {

        let backViewTop = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let backViewLeading = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let backViewTrailing = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let backViewBottom = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)

        let authorLabelTop = self.authorLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 16)
        let authorLabelLeading = self.authorLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        let authorLabelTrailing = self.authorLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16)
        let authorLabelBottom = self.authorLabel.bottomAnchor.constraint(equalTo: self.postImageView.topAnchor, constant: -16)

        let postImageLeading = self.postImageView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor)
        let postImageTrailing = self.postImageView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)
        let postImageBottom = self.postImageView.bottomAnchor.constraint(equalTo: self.descriptionLabel.topAnchor, constant: -16)
        let postHeight = self.postImageView.heightAnchor.constraint(equalTo: self.postImageView.widthAnchor, multiplier: 1.0)

        let descriptionLabelLeading = self.descriptionLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        let descriptionLabelTrailing = self.descriptionLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16)

        let likesLabelTop = self.likesLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 16)
        let likesLabelLeading = self.likesLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        let likesLabelBottom = self.likesLabel.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -16)

        let viewsLabelTop = self.viewsLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 16)
        let viewsLabelTrailing = self.viewsLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16)
        let viewsLabelBottom = self.viewsLabel.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -16)

        NSLayoutConstraint.activate([backViewTop, backViewLeading, backViewTrailing, backViewBottom, authorLabelTop, authorLabelLeading, authorLabelTrailing, authorLabelBottom, postImageLeading, postImageTrailing, postImageBottom, postHeight, descriptionLabelLeading, descriptionLabelTrailing, likesLabelTop, likesLabelLeading, likesLabelBottom, viewsLabelTop, viewsLabelTrailing, viewsLabelBottom])
    }

}

extension PostTableViewCell: Setupable {

    func setup(with viewModel: ViewModelProtocol) {
        guard let viewModel = viewModel as? ViewModel else { return }

        self.authorLabel.text = viewModel.author
        self.postImageView.image = UIImage(named: viewModel.image)
        self.descriptionLabel.text = viewModel.description
        self.likesLabel.text = "Likes: " + String(viewModel.likes)
        self.viewsLabel.text = "Views: " + String(viewModel.views)

    }
}
