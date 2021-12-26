//
//  ExploreViewController.swift
//  DesafioADI
//
//  Created by Morgana Galamba on 25/12/21.
//

import Foundation
import UIKit

class ExploreViewController: UITableViewController, ExploreViewDelegate {
    
    var movies = Movies()
    private let explorePresenter = ExplorePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        explorePresenter.fillMovies()
        tableView.register(MoviesTableViewCell.self, forCellReuseIdentifier: MoviesTableViewCell.identifier)
        navigationItem.title = "Popular Movies"
        explorePresenter.setViewDelegate(exploreViewDelegate: self)
        
    }
    
    func displayMovies(movies: Movies) {
        self.movies = movies
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.movies.results?.count ?? 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.identifier, for: indexPath) as? MoviesTableViewCell else {
            return UITableViewCell()
        }
        
        cell.movieName.text = movies.results?[indexPath.row].title
        
        let releaseData = movies.results?[indexPath.row].release_date ?? ""
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy"

        if let date = dateFormatterGet.date(from: releaseData) {
            cell.releaseDate.text = dateFormatterPrint.string(from: date)
        } else {
           cell.releaseDate.text = "data unavailable"
           print("There was an error decoding the string")
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = movies.results?[indexPath.row].id
        let rootVC = MovieViewController()
        rootVC.id = id ?? 0
        self.navigationController?.pushViewController(rootVC, animated: true)
        
    }
    
}

