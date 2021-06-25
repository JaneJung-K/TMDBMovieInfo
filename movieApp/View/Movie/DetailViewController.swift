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
    
    var getId: Int?
    
    private var data: DetailResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let i = getId {
            detailApiCaller.fetchData(id: i) { [weak self] response in
                print(response)
                self?.data = response
            }
        }
    }
    
}
