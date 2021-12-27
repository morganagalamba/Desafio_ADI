//
//  AccountPresenter.swift
//  DesafioADI
//
//  Created by Morgana Galamba on 26/12/21.
//

import Foundation
import CoreData
import UIKit

protocol AccountViewDelegate: NSObjectProtocol {
    func displayMovies(movies: [MovieDetails])
}

class AccountPresenter {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    weak private var accountViewDelegate: AccountViewDelegate?
    var movies: [MovieDetails] = []
    
    func setViewDelegate(accountViewDelegate: AccountViewDelegate?){
        self.accountViewDelegate = accountViewDelegate
    }
    
    func getMovie(){
        
        do{
            let favoriteMovies = try context.fetch(FavoriteMovie.fetchRequest())

            for movie in favoriteMovies {
                let movieId = String(describing: movie.movieId)
                let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)?api_key=f13794b05602015b7f895fed45d8e8f7")!
                
                let request = URLRequest(url: url)
                let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                    
                    if let result = try? JSONDecoder().decode(MovieDetails.self, from: data!) {
                        self.movies.append(result)
                    } else {
                        print("Erro ao decodificar dados da API")
                    }
                    
                }
                task.resume()
            }
            self.accountViewDelegate?.displayMovies(movies: movies)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }

    }
    
    
    func getImage(poster_path: String) -> Data{
        
        guard let imageUrl = URL(string: "https://www.themoviedb.org/t/p/w440_and_h660_face\(poster_path)") else { return Data() }
        guard let data = try? Data(contentsOf: imageUrl) else {
            return Data()
        }
        return data
    
        
    }
    
}
