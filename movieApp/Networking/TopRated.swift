//
//  TopRated.swift
//  movieApp
//
//  Created by mac on 2021/05/11.
//

import Foundation

class TopRatedgMovies: Codable {
    let results: [TopRatedMoviesList]?
}

class TopRatedMoviesList: Codable {
    let poster_path: String?
}
