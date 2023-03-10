//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Yusuf Can Bircan on 2.02.2023.
//

import UIKit

protocol HomeViewInterfaceProtocol: AnyObject {
    func configureView()
    func configureCollectionView()
    func reloadCollectionView()
    func navigateToDetailViewController(movie: MovieResult)
}

final class HomeViewController: UIViewController {

    private let viewModel: HomeViewModel = HomeViewModel()
    
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.view = self

        viewModel.viewDidLoad()
    }

}

extension HomeViewController: HomeViewInterfaceProtocol {
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHomeFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseID)
        
        collectionView.pinToEdgesOf(view: view)
    }
    
    func configureView() {
        view.backgroundColor = .systemBackground
        title = "Popular Movies"
    }
    
    func reloadCollectionView() {
        collectionView.reloadOnMainThread()
    }
    
    func navigateToDetailViewController(movie: MovieResult) {
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(DetailViewController(movie: movie), animated: true)
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseID, for: indexPath) as! MovieCell
        
        cell.setCell(movie: viewModel.movies[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.getDetail(id: viewModel.movies[indexPath.item].id ?? Int.min)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - (2*height) {
            viewModel.getMovies()
        }
    }
}
