//
//  ViewController.swift
//  CoreApp
//
//  Created by Tunc on 14.01.2019.
//  Copyright © 2019 Tunc. All rights reserved.
//

import UIKit
import Swinject

class MainViewController: UIViewController {
    
    lazy var movieApi : MovieNetworking = container.resolve(MovieNetworking.self)!
    
    @IBOutlet weak var movieTableView: UITableView!
    var data: [Movie] = []
    var currentPage: Int = 1
    var totalPageCount: Int = 0
    var selectedMovieId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTableView.tableFooterView = UIView()
        getMovies(currentPage)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let dest = segue.destination as? DetailViewController, let id = selectedMovieId {
                dest.selectedId = id
            }
        }
    }
    
    func getMovies(_ page: Int) {
        movieApi.fetchMovies(page: page) { result, error in
            if let err = error, !err.isEmpty {
                Loader.error(err)
                return
            }
            
            if let resultSet = result {
                
                self.totalPageCount = resultSet.numberOfPages
                
                if let movies = resultSet.data {
                    self.data.append(contentsOf: movies)
                    self.movieTableView.reloadData()
                }
            }
        }
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let movie = data[indexPath.row]
        cell.textLabel?.text = movie.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == data.count - 1 && totalPageCount >= currentPage {
            currentPage += 1
            getMovies(currentPage)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        selectedMovieId = data[indexPath.row].id
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
}

