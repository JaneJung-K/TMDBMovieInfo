//
//  DetailViewController.swift
//  movieApp
//
//  Created by batontouch on 2021/06/25.
//

import UIKit
import Alamofire
import Kingfisher

class DetailViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    
    let genresData = GenresData.shared
    
    @IBOutlet weak var genresCollectionView: UICollectionView!

    let detailApiCaller = DetailApiCaller()
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieGernes: UILabel!
    @IBOutlet weak var movieRunTime: UILabel!
    @IBOutlet weak var movieScore: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    
    var getId: Int?
    
    private var data: DetailResponse?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailApiCaller.fetchData(id: getId!) { [weak self] response in
            print(response)
            self?.data = response
            
                
            if let p = self?.data?.poster_path {
                let url = URL(string:"https://image.tmdb.org/t/p/w500\(p)")
                self?.moviePoster.kf.setImage(with: url)
            }
            
            if let t = self?.data?.title {
                self?.movieTitle.text! = t
            }
            
            self?.genresData.genresDetail = self?.data?.genres ?? []
            //print("영화의 장르 데이터는 \(self?.genresData.genresDetail)입니다.")
            self?.genresCollectionView.reloadData()
            
            guard let r = self?.data?.runtime else { return }
            self?.movieRunTime.text = String("\(r)분")
            
            guard let s = self?.data?.vote_average else { return }
            self?.movieScore.text = String("\(s)점")
            
            guard let o = self?.data?.overview else { return }
            self?.movieOverview.text = o
            
            }
        }
        
        //self.genresCollectionView!.register(GenresCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
            
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("숫자의 갯수는 \(genresData.genresDetail?.count) 입니다.")
        print(genresData)
        return genresData.genresDetail?.count ?? 1
       // return dummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GenresCollectionViewCell
        guard let d = genresData.genresDetail else { return cell }
        //print("변수 d의 값은 \(d)입니다")
        cell.genresLabel.text = d[indexPath.row].name
        //cell.genresLabel.text = dummyData[indexPath.row]
        return cell
       
    }
    
   

}

class GenresCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var genresLabel: UILabel!
}
