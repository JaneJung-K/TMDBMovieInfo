//
//  DramaViewController.swift
//  movieApp
//
//  Created by mac on 2021/05/12.
//

import UIKit
import Alamofire

class DramaCell: UICollectionViewCell {
    
    @IBOutlet weak var dramaTitle: UILabel!
    
}

class DramaViewController: UIViewController {
    
    var dramaDataSource: [DramaContact] = []
    
    @IBOutlet weak var dramaCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
}

extension DramaViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dramaDataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dramaCollectionView.dequeueReusableCell(withReuseIdentifier: "DramaCell", for: indexPath) as? DramaCell else {
            return UICollectionViewCell()
        }
        cell.dramaTitle.text = dramaDataSource[indexPath.row].name
        return cell
        }
    }

extension DramaViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin: CGFloat = 8
        let itemSpacing: CGFloat = 10
        let width = (collectionView.bounds.width - margin * 2 - itemSpacing * 2) / 3
        let height = width * 10/7
        return CGSize(width: width, height: height)
    }
    
}

extension DramaViewController {
    private func fetchData() {
        let apiKey = "afe279a4b6fb7def93b05fe10d91d8af"
        let page = 1
        AF.request("https://api.themoviedb.org/3/tv/popular?api_key=\(apiKey)&page=\(page)" , method: .post)
            .validate()
            .responseDecodable(of: DramaResponse.self) { (response) in
//                  guard let dataSource = response.value else { return }
//                    print(dataSource)
                
                switch response.result {
                case .success(let response):
                    self.dramaDataSource = response.results ?? []
                //print("DEBUG: contacts is \(self.dramaDataSource)")
                case .failure(let error):
                    print(error.localizedDescription)
                }
        
                  self.dramaCollectionView.reloadData()
                }
    }
    }
