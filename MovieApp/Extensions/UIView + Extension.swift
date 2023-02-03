//
//  UIView + Extension.swift
//  MovieApp
//
//  Created by Yusuf Can Bircan on 3.02.2023.
//

import UIKit


extension UIView {
    func pinToEdgesOf(view: UIView) {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: view.topAnchor),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
