//
//  ApiCaller.swift
//  movieApp
//
//  Created by batontouch on 2021/06/24.
//

import Alamofire

class GenresApiCaller {
   
    func fetchData(pagination: Bool = false, page: Int, completion:  @escaping (GenresResponse) -> Void) {
        
        let apiKey = "afe279a4b6fb7def93b05fe10d91d8af"
        
        AF.request("https://api.themoviedb.org/3/genre/movie/list?api_key=\(apiKey)" , method: .get)
            .validate()
            .responseDecodable(of: GenresResponse.self) { (response) in

                switch response.result {
                case .success(let response):

                    completion(response)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                  }
                }
        
        }
    }

struct GenresResponse: Codable {
  let results: [Genres]?
    
}
struct Genres: Codable {
    let id: Int
    let name: String
}
