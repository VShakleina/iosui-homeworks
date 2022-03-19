//
//  Setupable.swift
//  Navigation
//
//  Created by Viktoriia Shakleina on 18.03.2022.
//

import Foundation

protocol ViewModelProtocol {}

protocol Setupable {
    func setup(with viewModel: ViewModelProtocol)
}
