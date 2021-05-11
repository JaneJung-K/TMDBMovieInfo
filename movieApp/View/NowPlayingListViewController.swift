//
//  NowPlayingListViewController.swift
//  movieApp
//
//  Created by mac on 2021/05/11.
//

import UIKit
import Alamofire

class NowPlayingCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
}

class NowPlayingListViewController: UIViewController {

    var nowPlayingMoviesList: [NowPlayingMoviesList] = []
    
    @IBOutlet weak var nowPlayingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension NowPlayingListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nowPlayingMoviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: "NowPlayingCell", for: indexPath) as! NowPlayingCell
        cell.imageView.image = UIImage(systemName: "cloud")
        return cell
        }
    }
    
    


extension NowPlayingListViewController: UICollectionViewDelegateFlowLayout {
    
}

extension NowPlayingListViewController {
    func fetchData() {
        
        let url = "https://api.themoviedb.org/3/movie/now_playing?api_key=afe279a4b6fb7def93b05fe10d91d8af&page=1"
        AF.request(url, method: .post)
            .validate()
            .responseDecodable(of: NowPlayingMovies.self) { (response) in

                switch response.result {
                case .success(let response):
                    self.nowPlayingMoviesList = response.results ?? []
                    print("DEBUG: contacts is \(self.nowPlayingMoviesList)")
                case .failure(let error):
                    print(error.localizedDescription)
                }
        
                  //self.tableView.reloadData()
                }
    }
}


