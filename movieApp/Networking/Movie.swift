

import UIKit

struct APIResponse: Codable {
  let results: [Contact]?
    let total_pages:Int?
    let total_results:Int?
}
struct Contact: Codable {
    let adult:Bool?
    let backdrop_path:String?
    let genre_ids:[Int]?
    let original_language:String?
    let original_title:String?
    let overview:String?
    let popularity:Double?
    let poster_path:String?
    let release_date:String?
    let video:Bool?
    let vote_average:Double?
    let vote_count:Int?
    let id: Int?
  let title: String?
}
