//
//  MoviePresenter.swift
//  DesafioADI
//
//  Created by Morgana Galamba on 25/12/21.
//

import Foundation
import CoreData
import UIKit

protocol MovieViewDelegate: NSObjectProtocol {
    func displayMovie(movie: MovieDetails)
}

class MoviePresenter {

    var favoriteMovies: [NSManagedObject] = []
    weak private var movieViewDelegate: MovieViewDelegate?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func setViewDelegate(movieViewDelegate: MovieViewDelegate?){
        self.movieViewDelegate = movieViewDelegate
    }
    
    func movieDetails(id: Int){
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=f13794b05602015b7f895fed45d8e8f7")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let result = try? JSONDecoder().decode(MovieDetails.self, from: data!) {
                self.movieViewDelegate?.displayMovie(movie: result)
            } else {
                print("Erro ao decodificar dados da API")
            }
            
        }
        task.resume()
    }
    
    func saveMovie(id: Int){
        let newMovie = FavoriteMovie(context: context)
        newMovie.movieId = Int64(id)
        
        
        do {
            try context.save()
            //favoriteMovies.append(newMovie)
        } catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        /*
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          return
        }

        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "FavoriteMovie", in: managedContext)!
        let movie = NSManagedObject(entity: entity, insertInto: managedContext)
        movie.setValue(id, forKeyPath: "movieId")
        do {
          try managedContext.save()
          favoriteMovies.append(movie)
        
        } catch let error as NSError {
          print("Could not save. \(error), \(error.userInfo)")
        }*/
        
    }
    
    func deleteMovie(movie: FavoriteMovie){
        context.delete(movie)
        
        do {
            try context.save()
        } catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    func updateMovie(movie: FavoriteMovie){
        
    }
}
