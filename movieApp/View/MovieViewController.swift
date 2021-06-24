import UIKit
import Alamofire
import Kingfisher

class MovieViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    
    let movieApiCaller = MovieApiCaller()
    var dataSource: [Contact] = []
    var currentPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.movieTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        self.movieTableView.rowHeight = 204
        movieApiCaller.fetchData(page: 1) { [weak self] responds in
            self?.dataSource = responds.results ?? []
//            print(self?.dataSource)
            self?.movieTableView.reloadData()
        }
        
    }
}

extension MovieViewController: UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        cell.movieTitle.text = dataSource[indexPath.row].title
        let url = URL(string:"https://image.tmdb.org/t/p/w500\(dataSource[indexPath.row].poster_path!)")
        cell.movieImage.kf.setImage(with: url)
        if let releaseDate = dataSource[indexPath.row].release_date {
            cell.movieReleasedDate.text = "개봉: \(releaseDate)"
        }
        
        if let rating = dataSource[indexPath.row].vote_average {
            cell.ratingScore.rating = rating / 2
            cell.ratingScore.text = String(rating)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (movieTableView.contentSize.height-100-scrollView.frame.size.height) {
            // fetch more data
            guard !movieApiCaller.isPaginating else {
                // we are already fetching more data
                return
            }
            currentPage += 1
            movieApiCaller.fetchData(pagination: true, page: currentPage) { [weak self] responds in
                if let d = responds.results {
                    self?.dataSource.append(contentsOf: d)
                }
                
    //            print(self?.dataSource)
                self?.movieTableView.reloadData()
            }
        }
    }
}

class MovieApiCaller {
    var isPaginating = false
    func fetchData(pagination: Bool = false, page: Int, completion:  @escaping (APIResponse) -> Void) {
        
        if pagination {
            isPaginating = true
        }
        let apiKey = "afe279a4b6fb7def93b05fe10d91d8af"
        
        AF.request("https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&page=\(page)" , method: .post)
            .validate()
            .responseDecodable(of: APIResponse.self) { (response) in

                switch response.result {
                case .success(let response):

                    completion(response)
                    if pagination {
                        self.isPaginating = false
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                  }
                }
        
        }
    }

