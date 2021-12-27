//
//  ExploreViewController.swift
//  DesafioADI
//
//  Created by Morgana Galamba on 25/12/21.
//

import Foundation
import UIKit

class ExploreViewController: UITableViewController, ExploreViewDelegate, UISearchResultsUpdating {
    
    let searchBar:UISearchController = UISearchController()
    var movies = Movies()
    private let explorePresenter = ExplorePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        explorePresenter.fillMovies()
        tableView.register(MoviesTableViewCell.self, forCellReuseIdentifier: MoviesTableViewCell.identifier)
        navigationItem.title = "Explore"
        explorePresenter.setViewDelegate(exploreViewDelegate: self)
        searchBar.searchResultsUpdater = self
        navigationItem.searchController =  searchBar
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
        explorePresenter.fillMovies()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let text = searchBar.searchBar.text else {
            return
        }
        explorePresenter.searchMovie(query: text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")
        self.tableView.reloadData()

    
    }

    
    func displayMovies(movies: Movies) {
        self.movies = movies

    }

    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0) {
            return "Popular Movies"
        } else {
            return " "
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.movies.results?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.identifier, for: indexPath) as? MoviesTableViewCell else {
            return UITableViewCell()
        }
        
        cell.movieName.text = movies.results?[indexPath.row].title
        cell.moviePhoto = UIImage(data: explorePresenter.getImage(poster_path: (movies.results?[indexPath.row].poster_path) ?? "")) ?? UIImage()
        
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
        rootVC.moviePhoto = UIImage(data: explorePresenter.getImage(poster_path: (movies.results?[indexPath.row].poster_path) ?? "")) ?? UIImage()
        rootVC.id = id ?? 0
        self.navigationController?.pushViewController(rootVC, animated: true)
        
    }
    
}

