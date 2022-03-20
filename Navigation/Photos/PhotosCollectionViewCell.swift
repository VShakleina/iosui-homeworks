//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Viktoriia Shakleina on 20.03.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    private var photoImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(photoImage)
        self.addConstraints()
    }

    private func addConstraints() {

        let photoTop = self.photoImage.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let photoLeading = self.photoImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let photoTrailing = self.photoImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let photoBottom = self.photoImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)

        NSLayoutConstraint.activate([photoTop, photoLeading, photoTrailing, photoBottom])

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.photoImage.image = nil
    }

    func setup(photo: UIImage) {
        self.photoImage.image = photo
    }

}
