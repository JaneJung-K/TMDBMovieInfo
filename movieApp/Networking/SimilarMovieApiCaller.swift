//
//  SimilarMovieApiCaller.swift
//  movieApp
//
//  Created by batontouch on 2021/07/02.
//
import Alamofire

class SimilarMovieApiCaller {
    func fetchData(id: Int, completion:  @escaping (SimilarResponse) -> Void) {
        let apiKey = "afe279a4b6fb7def93b05fe10d91d8af"
        AF.request("https://api.themoviedb.org/3/movie/\(id)/similar?api_key=\(apiKey)" , method: .get)
            .validate()
            .responseDecodable(of: SimilarResponse.self) { (response) in
                switch response.result {
                case .success(let response):
                    completion(response)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }

struct SimilarResponse: Decodable {
    let results: [SimilarResults]?
}

struct SimilarResults: Decodable {
    let adult: Bool?
    let poster_path: String?
    let id: Int?
    let title: String?
}
