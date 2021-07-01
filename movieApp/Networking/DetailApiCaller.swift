//
//  DetailApiCaller.swift
//  movieApp
//
//  Created by batontouch on 2021/06/25.
//

import Alamofire

class GenresData {
    static let shared = GenresData()
    
    var genresDetail: [GenresDetail]?
    
}

class DetailApiCaller {
    func fetchData(id: Int, completion:  @escaping (DetailResponse) -> Void) {
        let apiKey = "afe279a4b6fb7def93b05fe10d91d8af"
        AF.request("https://api.themoviedb.org/3/movie/\(id)?api_key=\(apiKey)" , method: .get)
            .validate()
            .responseDecodable(of: DetailResponse.self) { (response) in
                switch response.result {
                case .success(let response):
                    completion(response)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }

struct DetailResponse: Codable {
//    let adult: Bool?
//    let backdrop_path: String?
//    let budget: Int?
    let genres: [GenresDetail]?
//    let homepage: String?
//    let id: Int?
//    let imdb_id: String?
//    let original_language: String?
//    let original_title: String?
    let overview: String?
//    let popularity: Int?
    let poster_path: String?
//    let production_companies: [Countries]?
//    let release_date: String?
//    let revenue: Int?
    let runtime: Int?
//    let spoken_languages: [Languages]?
//    let status: String?
//    let tagline: String?
    let title: String?
//    let video: Bool?
    let vote_average: Double?
//    let vote_count: Int?
}

struct GenresDetail: Codable {
    let id: Int?
    let name: String?
}

//struct Countries: Codable {
//    let iso_3166_1: String?
//    let name: String?
//}
//
//struct Languages: Codable {
//    let iso_639_1: String?
//    let name: String?
//}
