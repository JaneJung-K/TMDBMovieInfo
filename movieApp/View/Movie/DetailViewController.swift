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
    
    
    var getId: Int?
    
    private var data: DetailResponse?
    
    override func viewWillAppear(_ animated: Bool) {
        if let i = getId {
            detailApiCaller.fetchData(id: i) { [weak self] response in
                print(response)
                self?.data = response
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let p = data?.poster_path {
            let url = URL(string:"https://image.tmdb.org/t/p/w500\(p)")
            print("url 주소는 \(url)입니다.")
            moviePoster.kf.setImage(with: url)
        }
        
        
        }

    }
    

