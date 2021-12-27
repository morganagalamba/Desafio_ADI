//
//  MovieViewController.swift
//  DesafioADI
//
//  Created by Morgana Galamba on 25/12/21.
//

import Foundation
import UIKit
 
class MovieViewController: UIViewController, UIScrollViewDelegate, MovieViewDelegate {
   
    public var moviePhoto : UIImage = UIImage()
    var movie = MovieDetails()
    private let moviePresenter = MoviePresenter()
    var id = Int()
    
    public var moviePhotoView : UIImageView = {
        let photo = UIImageView()
        photo.contentMode = .scaleAspectFit
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.frame = CGRect(x: 0, y: 0, width: 220, height: 330)
        return photo
    }()
    
    public let overview: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "Overview"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .left
        return label
    }()
    
    public let movieOverView: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.baselineAdjustment = .alignBaselines
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .left
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviePresenter.setViewDelegate(movieViewDelegate: self)
        moviePresenter.movieDetails(id: id)
        view.backgroundColor = .systemBackground
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(favorite))
        
        view.addSubview(overview)
        view.addSubview(movieOverView)
        view.addSubview(moviePhotoView)
        
        setupConstraints()
    }
  
    func displayMovie(movie: MovieDetails) {
        self.movie = movie
        DispatchQueue.main.async {
            self.movieOverView.text = self.movie.overview
            self.moviePhotoView.image = self.moviePhoto
        }
    }
    
    @objc func favorite(sender: UIBarButtonItem) {
        moviePresenter.saveMovie(id: id)
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            overview.topAnchor.constraint(equalTo: moviePhotoView.bottomAnchor,constant: 16),
            overview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            overview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8)
           
        ])
        
        NSLayoutConstraint.activate([
            movieOverView.topAnchor.constraint(equalTo: overview.bottomAnchor ,constant: 16),
            movieOverView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            movieOverView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            moviePhotoView.heightAnchor.constraint(equalToConstant: 330),
            moviePhotoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor ,constant: 16),
        ])
    
    }
}
