//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Viktoriia Shakleina on 19.03.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var photoLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var photoStack: UIStackView = {
        var stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private var arrowImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "arrow.forward")
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private var photoImage1: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 6
        image.image = photos[0]
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private var photoImage2: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 6
        image.image = photos[1]
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private var photoImage3: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 6
        image.image = photos[2]
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private var photoImage4: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 6
        image.image = photos[3]
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(backView)
        self.backView.addSubview(photoLabel)
        self.backView.addSubview(arrowImage)
        self.backView.addSubview(photoStack)
        self.photoStack.addArrangedSubview(photoImage1)
        self.photoStack.addArrangedSubview(photoImage2)
        self.photoStack.addArrangedSubview(photoImage3)
        self.photoStack.addArrangedSubview(photoImage4)
        self.addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addConstraints() {

        let backViewTop = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let backViewLeading = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let backViewTrailing = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let backViewBottom = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)

        let photoLabelTop = self.photoLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 12)
        let photoLabelLeading = self.photoLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 12)
        let photoLabelBottom = self.photoLabel.bottomAnchor.constraint(equalTo: self.photoStack.topAnchor, constant: -12)

        let arrowImageTrailing = self.arrowImage.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -12)
        let arrowImageY = self.arrowImage.centerYAnchor.constraint(equalTo: self.photoLabel.centerYAnchor)

        let widthPhoto = (UIScreen.main.bounds.width - 48) / 4
        let widthPhoto1 = self.photoImage1.widthAnchor.constraint(equalToConstant: widthPhoto)
        let widthPhoto2 = self.photoImage2.widthAnchor.constraint(equalToConstant: widthPhoto)
        let widthPhoto3 = self.photoImage3.widthAnchor.constraint(equalToConstant: widthPhoto)
        let widthPhoto4 = self.photoImage4.widthAnchor.constraint(equalToConstant: widthPhoto)

        //  на макете написано "width = height = (screen width - all offsets) /4", но при этом визуально видно, что картинки прямоугольной формы, сделала соотношение 0.8
        let heightPhoto1 = self.photoImage1.heightAnchor.constraint(equalTo: photoImage1.widthAnchor, multiplier: 0.8)
        let heightPhoto2 = self.photoImage2.heightAnchor.constraint(equalTo: photoImage2.widthAnchor, multiplier: 0.8)
        let heightPhoto3 = self.photoImage3.heightAnchor.constraint(equalTo: photoImage3.widthAnchor, multiplier: 0.8)
        let heightPhoto4 = self.photoImage4.heightAnchor.constraint(equalTo: photoImage4.widthAnchor, multiplier: 0.8)

        let stackBottom = self.photoStack.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -12)
        let stackLeading = self.photoStack.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 12)
        let stackTrailing = self.photoStack.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -12)


        NSLayoutConstraint.activate([backViewTop, backViewLeading, backViewTrailing, backViewBottom, photoLabelTop, photoLabelLeading, photoLabelBottom, arrowImageTrailing, arrowImageY, widthPhoto1, widthPhoto2, widthPhoto3, widthPhoto4, heightPhoto1, heightPhoto2, heightPhoto3, heightPhoto4, stackBottom, stackLeading, stackTrailing])
    }




}
