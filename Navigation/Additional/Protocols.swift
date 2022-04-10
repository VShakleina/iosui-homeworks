//
//  Protocols.swift
//  Navigation
//
//  Created by Viktoriia Shakleina on 18.03.2022.
//

import UIKit

protocol ViewModelProtocol {}

protocol Setupable {
    func setup(with viewModel: ViewModelProtocol)
}

protocol TapLikedDelegate {
    func updateLike(indexRow: Int)
}

protocol TapImagePostDelegate {
    func enlargePost(indexRow: Int)
}

protocol TapLikedPostDelegate {
    func updateLikePost()
}
