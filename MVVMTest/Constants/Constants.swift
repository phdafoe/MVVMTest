//
//  Constants.swift
//  MVVMTest
//
//  Created by Andres on 21/1/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation

//MARK: - TYPEALIAs
typealias arrayDictionary = [dictionary]
typealias dictionary = [String : Any]

//ESTRUCTURA DE CONSTANTES
let CONSTANTS = Constants()

struct Constants {
    let BASE_URL = Urls()
}

struct Urls {
    let URL_TOP = "https://itunes.apple.com/es/rss/topmovies/limit=99/json"
}
