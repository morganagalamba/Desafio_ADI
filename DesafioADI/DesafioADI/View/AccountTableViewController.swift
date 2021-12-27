//
//  AccountTableViewController.swift
//  DesafioADI
//
//  Created by Morgana Galamba on 25/12/21.
//

import UIKit

class AccountTableViewController: UITableViewController, AccountViewDelegate {
    
    private let accountPresenter = AccountPresenter()
    var movies: [MovieDetails] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Account"
        tableView.register(MoviesTableViewCell.self, forCellReuseIdentifier: MoviesTableViewCell.identifier)
        accountPresenter.setViewDelegate(accountViewDelegate: self)
        accountPresenter.getMovie()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        accountPresenter.getMovie()
        self.tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.movies.count ?? 5
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0) {
            return "Favourite movies"
        } else {
            return " "
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.identifier, for: indexPath) as? MoviesTableViewCell else {
            return UITableViewCell()
        }
        
        cell.movieName.text = self.movies[indexPath.row].title
        
        let releaseData = self.movies[indexPath.row].releaseDate ?? ""
        
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
        let id = movies[indexPath.row].id
        let rootVC = MovieViewController()
        rootVC.id = id ?? 0
        rootVC.moviePhoto = UIImage(data: accountPresenter.getImage(poster_path: (movies[indexPath.row].posterPath) ?? "")) ?? UIImage()
        self.navigationController?.pushViewController(rootVC, animated: true)
        
    }
    
    func displayMovies(movies: [MovieDetails]) {
        self.movies = movies
        /*DispatchQueue.main.async {
            self.tableView.reloadData()
        }*/
    }
    
    

}
