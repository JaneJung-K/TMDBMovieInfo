//
//  DetailViewController.swift
//  movieApp
//
//  Created by batontouch on 2021/06/25.
//

import UIKit
import Alamofire
import Kingfisher

class DetailViewController: UIViewController {
    
    let detailApiCaller = DetailApiCaller()
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    var getId: Int?
    
    private var data: DetailResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let i = getId {
            detailApiCaller.fetchData(id: i) { [weak self] response in
                print(response)
                self?.data = response
                
                if let p = self?.data?.poster_path {
                    let url = URL(string:"https://image.tmdb.org/t/p/w500\(p)")
                    print("url 주소는 \(url!)입니다.")
                    self?.moviePoster.kf.setImage(with: url)
                }
                self?.movieTitle.text = self?.data?.title
                print("영화 제목은 \(self?.movieTitle.text)입니다")
                
            }
        }
    }
}


