//
//  UICollectionView + Extension.swift
//  MovieApp
//
//  Created by Yusuf Can Bircan on 3.02.2023.
//

import UIKit

extension UICollectionView {
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
