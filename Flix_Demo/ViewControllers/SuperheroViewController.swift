//
//  SuperheroViewController.swift
//  Flix_Demo
//
//  Created by user144166 on 10/26/18.
//  Copyright © 2018 Codepath. All rights reserved.
//

import UIKit

class SuperheroViewController: UIViewController,   UICollectionViewDataSource {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies:[[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = layout.minimumInteritemSpacing
        let cellsPerLine: CGFloat = 2
        let interItemSpacingTotal = layout.minimumInteritemSpacing * (cellsPerLine - 1)
        let width = collectionView.frame.size.width / cellsPerLine - interItemSpacingTotal / cellsPerLine
        
        layout.itemSize = CGSize(width: width, height: width * 3 / 2)
        
        fetchMovies()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        let movie = movies[indexPath.item]
        if let posterPathString = movie["poster_path"] as? String {
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            let posterURL = URL(string: baseURLString + posterPathString)!
            cell.posterimageView.af_setImage(withURL: posterURL)
        }
        return cell
    }
    
    func fetchMovies() { let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
    
    let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
    let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    
    let task = session.dataTask(with: request) { (data, response, error) in
    //
    if let error = error {
    print(error.localizedDescription)
    } else if let data = data {
    let dataDictonary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
    let movies = dataDictonary["results"] as! [[String: Any]]
    self.movies = movies
    self.collectionView.reloadData()
    //self.refreshControl.endRefreshing()
    }
    }
    task.resume()

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
