//
//  MoviewModel.swift
//  MVVMTest
//
//  Created by Andres on 20/1/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation
import SwiftyJSON

struct MovieModel{
    
    var id : String?
    var title : String?
    var order : Int?
    var summary : String?
    var image : String?
    var category : String?
    var director : String?
    
    init(json : JSON) {
        self.id = json["id"]["attributes"]["im:id"].stringValue
        self.title = json["id"]["attributes"]["im:id"].stringValue
        self.order = nil
        self.summary = json["summary"]["label"].stringValue
        self.image =  json["im:image"][0]["label"].stringValue.replacingOccurrences(of: "60x60", with: "500x500")
        self.category = json["category"]["attributes"]["label"].stringValue
        self.director = json["im:artist"]["label"].stringValue
    }
    
}
