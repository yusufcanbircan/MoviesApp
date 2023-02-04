//
//  DetailViewController.swift
//  MovieApp
//
//  Created by Yusuf Can Bircan on 4.02.2023.
//

import UIKit

protocol DetailViewInterface: AnyObject {
    func configureVC()
    func configurePosterImageView()
    func downloadPosterImage()
    func configureTitleLabel()
    func configureDateLabel()
    func configureOverviewLabel()
}

final class DetailViewController: UIViewController {
    
    private let movie: MovieResult
    private let viewModel = DetailViewModel()
    
    private let padding: CGFloat = 16
    
    private var posterImageView: PosterImageView!
    private var titleLabel: UILabel!
    private var dateLabel: UILabel!
    private var overviewLabel: UILabel!
    
    init(movie: MovieResult) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

extension DetailViewController: DetailViewInterface {
    func configureVC() {
        view.backgroundColor = .systemBackground
    }
    
    func configurePosterImageView() {
        posterImageView = PosterImageView(frame: .zero)
        view.addSubview(posterImageView)
        posterImageView.clipsToBounds = true
        
        posterImageView.layer.cornerRadius = 16
        
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            posterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            posterImageView.widthAnchor.constraint(equalToConstant: .deviceWidth * 0.40),
            posterImageView.heightAnchor.constraint(equalToConstant: (.deviceWidth * 0.4) * 1.5)
        ])
        
        posterImageView.backgroundColor = .red
    }
    
    func downloadPosterImage() {
        posterImageView.downloadImage(movie: movie)
    }
    
    func configureTitleLabel() {
        titleLabel = UILabel(frame: .zero)
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = movie.title ?? "No Title"
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: posterImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
    
    func configureDateLabel() {
        dateLabel = UILabel(frame: .zero)
        view.addSubview(dateLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.text = movie.releaseDate ?? "Unknown Release Date"
        dateLabel.font = .systemFont(ofSize: 15)
        dateLabel.textColor = .secondaryLabel
        
        NSLayoutConstraint.activate([
            dateLabel.bottomAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: -padding),
            dateLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: padding),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
        
    }
    
    func configureOverviewLabel() {
        overviewLabel = UILabel(frame: .zero)
        view.addSubview(overviewLabel)
        
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        overviewLabel.text = movie.overview ?? "No Overview"
        overviewLabel.font = .systemFont(ofSize: 18)
        overviewLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: padding*2),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
}
