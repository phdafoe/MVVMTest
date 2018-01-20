//
//  MoviesClient.swift
//  MVVMTest
//
//  Created by Andres on 20/1/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit

typealias customDictionary = NSDictionary

class MoviesClient: NSObject {
    
    func fetchMoviesFromWebService(_ completion : @escaping (_ movies : [customDictionary]?) -> ()){
        let urlString = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            if error != nil{
                completion(nil)
                return
            }
            do{
                let resultsDictionary = try JSONSerialization.jsonObject(with: data!, options: []) as? customDictionary
                if let movies = resultsDictionary?.value(forKeyPath: "feed.entry") as? [customDictionary]{
                    completion(movies)
                }
            }catch let error{
                print(error)
            }
        }
        task.resume()
    }
}
