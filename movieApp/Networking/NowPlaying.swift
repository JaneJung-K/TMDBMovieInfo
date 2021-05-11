//
//  NowPlaying.swift
//  movieApp
//
//  Created by mac on 2021/05/11.
//

import Foundation

class NowPlayingMovies: Codable {
    let results: [NowPlayingMoviesList]?
}

class NowPlayingMoviesList: Codable {
    let poster_path: String?
}
