//
//  RemoteService.swift
//  MVVMTest
//
//  Created by Andres on 21/1/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class RemoteItunesService{
        
    func getTopMovies(_ completion : @escaping (_ arrayDiccionario : [MovieModel]?) -> ()){
        guard let url = URL(string: CONSTANTS.BASE_URL.URL_TOP) else { return }
        Alamofire.request(url,
                          method: .get).validate().responseJSON { (responseData) in
                            switch responseData.result{
                            case .success:
                                guard let valorData = responseData.result.value else{return}
                                jsonData = JSON(valorData)
                                if let jsonDatDes = jsonData{
                                    var resultData = [MovieModel]()
                                    for c_entry in jsonDatDes["feed"]["entry"].arrayValue{
                                        let movieDicionary = MovieModel(json: c_entry)
                                        resultData.append(movieDicionary)
                                    }
                                    completion(resultData)
                                }
                            case . failure(let error):
                                print("Error: \(error.localizedDescription)")
                                completion(nil)
                            }
        }
    }
}






