//
//  ViewController.swift
//  movieApp
//
//  Created by mac on 2021/05/11.
//

import UIKit

class ViewController: UIViewController {
    
    var nowPlayingListViewController: NowPlayingListViewController!
    var topRatedViewController: TopRatedViewController!
    var popularViewController: PopularViewController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play" {
            let destinationVC = segue.destination as? NowPlayingListViewController
            nowPlayingListViewController = destinationVC
            
        } else if segue.identifier == "top" {
            let destinationVC = segue.destination as? TopRatedViewController
            topRatedViewController = destinationVC
            
        } else if segue.identifier == "popular" {
            let destinationVC = segue.destination as? PopularViewController
            popularViewController = destinationVC
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

