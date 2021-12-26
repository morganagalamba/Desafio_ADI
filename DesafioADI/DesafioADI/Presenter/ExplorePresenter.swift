//
//  ExplorePresenter.swift
//  DesafioADI
//
//  Created by Morgana Galamba on 25/12/21.
//

import Foundation
import WebKit


protocol ExploreViewDelegate: NSObjectProtocol {
    func displayMovies(movies: Movies)
}

class ExplorePresenter {

    weak private var exploreViewDelegate: ExploreViewDelegate?
    
    
    func setViewDelegate(exploreViewDelegate: ExploreViewDelegate?){
        self.exploreViewDelegate = exploreViewDelegate
    }
    
    func fillMovies(){
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=f13794b05602015b7f895fed45d8e8f7&language=en-US&page=1")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let result = try? JSONDecoder().decode(Movies.self, from: data!) {
                self.exploreViewDelegate?.displayMovies(movies: result)
            } else {
                print("Erro ao decodificar dados da API")
            }
            
        }
        task.resume()
    }
}

