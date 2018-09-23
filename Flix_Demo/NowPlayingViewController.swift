//
//  NowPlayingViewController.swift
//  Flix_Demo
//
//  Created by user144166 on 9/21/18.
//  Copyright © 2018 Codepath. All rights reserved.
//

import UIKit

class NowPlayingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = URL(string: "https://api.themoviedb.org/3/movie/{movie_id}?api_key=api_keya07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)

        let task = session.dataTask(with: request) { (data, <#URLResponse?#>, <#Error?#>) in
            //
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictonary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                let movies = dataDictonary["results"] as! [[String: Any]]
                for movie in movies{
                    let title = movie["title"] as! String
                    print(title)
                }
                
            }
        }
        task.resume()
    }
    


}
