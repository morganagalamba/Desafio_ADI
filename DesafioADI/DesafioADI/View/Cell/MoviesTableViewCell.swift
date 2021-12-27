//
//  MoviesTableViewCell.swift
//  DesafioADI
//
//  Created by Morgana Galamba on 25/12/21.
//

import Foundation
import UIKit

class MoviesTableViewCell: UITableViewCell {
    
    static let identifier = "MoviesTableViewCell"

    public var moviePhoto : UIImage = UIImage()

    
    public var moviePhotoView : UIImageView = {
        let photo = UIImageView()
        photo.contentMode = .scaleAspectFit
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.frame = CGRect(x: 0, y: 0, width: 440, height: 660)
        return photo
    }()
    
    public let movieName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .left
        return label
    }()
    
    public let releaseDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //contentView.translatesAutoresizingMaskIntoConstraints = false
        //contentView.clipsToBounds = true
        moviePhotoView = UIImageView(image: moviePhoto)
        
        contentView.addSubview(movieName)
        contentView.addSubview(releaseDate)
        contentView.addSubview(moviePhotoView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            movieName.leadingAnchor.constraint(equalTo: moviePhotoView.trailingAnchor, constant: 16),
            movieName.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 16),
            movieName.bottomAnchor.constraint(equalTo: releaseDate.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            releaseDate.leadingAnchor.constraint(equalTo: moviePhotoView.trailingAnchor, constant: 16),
            releaseDate.topAnchor.constraint(equalTo: movieName.bottomAnchor,constant: 16),
            releaseDate.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            moviePhotoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -16),
            moviePhotoView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: -16),
            
        ])
    }
    

}
