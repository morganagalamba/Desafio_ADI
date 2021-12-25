//
//  Movie.swift
//  DesafioADI
//
//  Created by Morgana Galamba on 25/12/21.
//

import Foundation

struct Movies: Codable {
    var page : Int?
    var results : [Results]?
    var total_pages: Int?
    var total_results:Int?
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case total_pages = "total_pages"
        case total_results = "total_results"
    }
}

struct Results: Codable {
    var poster_path : String?
    var adult : Bool?
    var overview : String?
    var release_date : String?
    var genre_ids : [Int]?
    var id : Int?
    var original_title : String?
    var original_language : String?
    var title : String?
    var backdrop_path : String?
    var popularity : Double?
    var vote_count : Int?
    var video : Bool?
    var vote_average : Double?
    
    enum CodingKeys: String, CodingKey {
        case poster_path = "poster_path"
        case adult = "adult"
        case overview = "overview"
        case release_date = "release_date"
        case genre_ids = "genre_ids"
        case id = "id"
        case original_title = "original_title"
        case original_language = "original_language"
        case title = "title"
        case backdrop_path = "backdrop_path"
        case popularity = "popularity"
        case vote_count = "vote_count"
        case video = "video"
        case vote_average = "vote_average"
    }
    
}

