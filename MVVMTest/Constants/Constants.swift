//
//  Constants.swift
//  MVVMTest
//
//  Created by Andres on 21/1/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation
import SwiftyJSON

//MARK: - TYPEALIAs
typealias arrayDictionary = [dictionary]
typealias dictionary = [String : Any]
var jsonData : JSON?

//ESTRUCTURA DE CONSTANTES
let CONSTANTS = Constants()

struct Constants {
    let BASE_URL = Urls()
}

struct Urls {
    let URL_TOP = "https://itunes.apple.com/us/rss/topmovies/limit=10/json"
}
