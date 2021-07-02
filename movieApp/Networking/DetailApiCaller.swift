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
    let genres: [GenresDetail]?
    let overview: String?
    let poster_path: String?
    let runtime: Int?
    let title: String?
    let vote_average: Double?
}

struct GenresDetail: Codable {
    let id: Int?
    let name: String?
}
