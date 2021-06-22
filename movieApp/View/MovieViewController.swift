import UIKit

class MovieViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    extension MovieViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 1
        }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = MovieViewController.dequeueReusableCell(withReuseIdentifier: "PopularCell", for: indexPath) as! PopularCell
            cell.imageView.image = UIImage(systemName: "cloud")
            return cell
            }
        }
    
}



//import UIKit
//import Alamofire
//
//class PopularCell: UICollectionViewCell {
//
//    @IBOutlet weak var imageView: UIImageView!
//
//}
//
//class PopularViewController: UIViewController {
//
//    var popularMoviesList:[PopularMoviesList] = []
//    @IBOutlet weak var popularCollectionView: UICollectionView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//
//
//}
//
//extension PopularViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: "PopularCell", for: indexPath) as! PopularCell
//        cell.imageView.image = UIImage(systemName: "cloud")
//        return cell
//        }
//    }
//
//extension PopularViewController: UICollectionViewDelegateFlowLayout {
//
//}
//
//extension PopularViewController {
//    func fetchData() {
//
//        let url = "https://api.themoviedb.org/3/movie/popular?api_key=afe279a4b6fb7def93b05fe10d91d8af&page=1"
//        AF.request(url, method: .post)
//            .validate()
//            .responseDecodable(of: PopularMovies.self) { (response) in
//
//                switch response.result {
//                case .success(let response):
//                    self.popularMoviesList = response.results ?? []
//                    print("DEBUG: contacts is \(self.popularMoviesList)")
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//
//                  //self.tableView.reloadData()
//                }
//    }
//}
