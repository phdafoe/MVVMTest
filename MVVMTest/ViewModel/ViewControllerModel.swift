//
//  ViewControllerModel.swift
//  MVVMTest
//
//  Created by Andres on 20/1/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit

class ViewControllerModel: NSObject {
    
    //Variables o propiedades
    @IBOutlet weak var moviesClient : MoviesClient!
    var arrayMovies : [customDictionary]?
    
    
    //LLamada
    func fetchMoviesFromMoviesClient(_ completion : @escaping () -> ()){
        moviesClient.fetchMoviesFromWebService{ movies in
            self.arrayMovies = movies
            completion()
        }
    }
    
    func numberOfItemsInSection(_ section : Int) -> Int{
        return arrayMovies?.count ?? 0
    }
    
    func titleForItemAtIndexPath(_ indexPath : IndexPath) -> String{
        return arrayMovies?[indexPath.row].value(forKeyPath: "summary.label")as? String ?? ""
    }

}
