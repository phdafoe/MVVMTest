//
//  ViewControllerModel.swift
//  MVVMTest
//
//  Created by Andres on 20/1/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit


class ViewControllerModel {
    
    var provider = RemoteItunesService()
    var arrayMovies : [MovieModel]?
    
    func fetchMoviesFromMoviesClient(_ completion : @escaping () -> ()){
        provider.getTopMovies { (data) in
            self.arrayMovies = data
            completion()
        }
    }
    
    func numberOfItemsInSection(_ section : Int) -> Int{
        return arrayMovies?.count ?? 0
    }
    
    func informationForItemAtIndexPath(_ indexPath : IndexPath) -> MovieModel {
        return (arrayMovies?[indexPath.row])!
    }

}
