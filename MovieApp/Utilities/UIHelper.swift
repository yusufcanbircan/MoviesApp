//
//  UIHelper.swift
//  MovieApp
//
//  Created by Yusuf Can Bircan on 3.02.2023.
//

import UIKit

enum UIHelper {
    static func createHomeFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: .deviceWidth, height: .deviceWidth * 1.5)
        layout.minimumLineSpacing = 40
        
        return layout
    }
}
