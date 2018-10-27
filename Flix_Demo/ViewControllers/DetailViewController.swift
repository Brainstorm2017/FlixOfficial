//
//  DetailViewController.swift
//  Flix_Demo
//
//  Created by user144166 on 10/26/18.
//  Copyright © 2018 Codepath. All rights reserved.
//

import UIKit

enum MovieKeys {
    
    static let title = "title"
    static let backdropPath = "backdrop_path"
    static let posterPath = "poster_path"
    
}
class DetailViewController: UIViewController {

    @IBOutlet weak var backDropImageView: UIImageView!
    
    
    @IBOutlet weak var posterimageView: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    
    @IBOutlet weak var overviewLabel: UILabel!
   
    var movie: [String: Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if movie != nil {
            titleLabel.text = movie? [MovieKeys.title] as? String
            releaseDateLabel.text = movie?["release_date"] as?
            String
            overviewLabel.text = movie?["overview"] as? String
            let backdropPathString = movie?[MovieKeys.backdropPath] as? String
           
            let posterPathString = movie?[MovieKeys.posterPath] as! String
            
          let baseURLString = "https://image.tmdb.org/t/p/w500"

            let backdropURL = URL(string: baseURLString + backdropPathString!)!
            backDropImageView.af_setImage(withURL: backdropURL)
            
            let posterPathURL = URL(string: baseURLString + posterPathString)!
            posterimageView.af_setImage(withURL: posterPathURL)
            func didReceieveMemoryWarning () {
                super .didReceiveMemoryWarning()
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
