//
//  DetailViewController.swift
//  CoreApp
//
//  Created by Tunc on 16.01.2019.
//  Copyright © 2019 Tunc. All rights reserved.
//

import UIKit
import Swinject

class DetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    lazy var movieApi : MovieNetworking = container.resolve(MovieNetworking.self)!    
    public var selectedId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieApi.findMovie(id: selectedId!) { result, error in
            if let err = error, !err.isEmpty {
                Loader.error(err)
                return
            }
            
            if let movie = result {
                self.titleLabel.text = movie.title
                self.overviewLabel.text = movie.overview
            }
        }
       
    }
}
