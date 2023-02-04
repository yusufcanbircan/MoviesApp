//
//  DetailViewModel.swift
//  MovieApp
//
//  Created by Yusuf Can Bircan on 4.02.2023.
//

import UIKit

protocol DetailViewModelInterface {
    var view: DetailViewInterface? { get set }
    
    func viewDidLoad()
}

final class DetailViewModel {
    weak var view: DetailViewInterface?
    
}

extension DetailViewModel: DetailViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configurePosterImageView()
        view?.downloadPosterImage()
        view?.configureTitleLabel()
        view?.configureDateLabel()
        view?.configureOverviewLabel()
    }
}
