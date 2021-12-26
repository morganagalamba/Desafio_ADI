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
    
    var favoriteMovies: [NSManagedObject] = []
    weak private var accountViewDelegate: AccountViewDelegate?
    
    func setViewDelegate(accountViewDelegate: AccountViewDelegate?){
        self.accountViewDelegate = accountViewDelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          return
        }

        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoriteMovie")

        do {
          favoriteMovies = try managedContext.fetch(fetchRequest)
        //print(favoriteMovies)
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func getMovie(){
        
        var movies: [MovieDetails] = []
        
        for movie in favoriteMovies {
            print(favoriteMovies.count)
            let movieId = String(describing: movie.value(forKey: "movieId") ?? 0)
            print(favoriteMovies)
            let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)?api_key=f13794b05602015b7f895fed45d8e8f7")!
            
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if let result = try? JSONDecoder().decode(MovieDetails.self, from: data!) {
                    print("ENTOU")
                    movies.append(result)
                   
                } else {
                    print("Erro ao decodificar dados da API")
                }
                
            }
            task.resume()
        }
        self.accountViewDelegate?.displayMovies(movies: movies)
        
    }
    
    
    
    
}
