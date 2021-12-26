//
//  MoviePresenter.swift
//  DesafioADI
//
//  Created by Morgana Galamba on 25/12/21.
//

import Foundation

protocol MovieViewDelegate: NSObjectProtocol {
    func displayMovie(movie: MovieDetails)
}

class MoviePresenter {

    weak private var movieViewDelegate: MovieViewDelegate?
    
    
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
}
