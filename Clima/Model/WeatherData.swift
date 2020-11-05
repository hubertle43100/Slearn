//
//  WeatherData.swift
//  Clima
//
//  Created by Hubert Le on 11/3/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
//formatted the Data
struct WeatherData: Codable { //decodable deals with structures of data from other sources
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {//variables need to match stuff on the json file
    let temp: Double
}

struct Weather: Codable {
    //let description: String
    let id: Int
}

