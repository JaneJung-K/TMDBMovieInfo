import UIKit
import Alamofire
import Kingfisher


class MovieViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    
    var dataSource: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        
    }
}

extension MovieViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
//        cell.movieTitle.text = dataSource[indexPath.row].title
//        cell.movieImage.kf.setImage(with: "https://image.tmdb.org/t/p/w153/\(dataSource[indexPath.row].poster_path)")
        return cell
    }
}

extension MovieViewController {
    private func fetchData() {
        let apiKey = "afe279a4b6fb7def93b05fe10d91d8af"
       // let language = "en-US"
        let page = 1
        AF.request("https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&page=\(page)" , method: .post)
            .validate()
            .responseDecodable(of: APIResponse.self) { (response) in
            
                switch response.result {
                case .success(let response):
                    self.dataSource = response.results ?? []
                  //  print("DEBUG: contacts is \(self.dataSource)")
                case .failure(let error):
                    print(error.localizedDescription)
                }
        
                  self.movieTableView.reloadData()
                }
    }
    }

