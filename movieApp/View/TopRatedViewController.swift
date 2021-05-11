//
//  TopRatedViewController.swift
//  movieApp
//
//  Created by mac on 2021/05/11.
//

import UIKit
import Alamofire

class TopRatedCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
}

class TopRatedViewController: UIViewController {
    
    var topRatedMoviesList: [TopRatedMoviesList] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension TopRatedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopRatedCell", for: indexPath) as! TopRatedCell
        cell.imageView.image = UIImage(systemName: "cloud")
        return cell
        }
    }

extension TopRatedViewController: UICollectionViewDelegateFlowLayout {
    
}

extension TopRatedViewController {
    func fetchData() {
        
        let url = "https://api.themoviedb.org/3/movie/top_rated?api_key=afe279a4b6fb7def93b05fe10d91d8af&page=1"
        AF.request(url, method: .post)
            .validate()
            .responseDecodable(of: TopRatedgMovies.self) { (response) in

                switch response.result {
                case .success(let response):
                    self.topRatedMoviesList = response.results ?? []
                    print("DEBUG: contacts is \(self.topRatedMoviesList)")
                case .failure(let error):
                    print(error.localizedDescription)
                }
        
                  //self.tableView.reloadData()
                }
    }
}
