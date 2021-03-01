//
//  WeatherManager.swift
//  Clima
//
//  Created by Angela Yu on 03/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    //func didUpdateWeather(_ weatherManager: WeatherManager)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=e280f2363cf95b33e43995504ce23ce1&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)//using with to clean up func
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    //    func fetchWeather(latitude: CLLocationDegrees, longitute: CLLocationDegrees){
    //        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitute)"
    //        performRequest(with: urlString)
    //    }
    
    func performRequest(with urlString: String) {
        //1. Create URL
        if let url = URL(string: urlString) {
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            //3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    //print(error!)
                    //self.delegate?.didFailWithError(error: error!)                    return
                }
                if let safeData = data {
                    //                    if let weather = self.parseJSON(safeData) { //needs the explicit 'self'
                    //                        self.delegate?.didUpdateWeather(self, weather: weather)
                    if let weather = self.parseJSON(safeData) {
                        //                        let weatherVC = WeatherViewController()
                        //                        weatherVC.didUpdateWeather(weather)
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
               //4. start task
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            //print(decodedData.name)
            //print(decodedData.main.temp)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            //print(getConditionName(weatherId: id))
            //print(weather.getConditionName(weatherId: id))
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
}
//    func handle(data: Data?, response: URLResponse?, error: Error?) {
//        if error != nil {
//            print(error!)
//            return
//        }
//
//        if let safeData = data {
//            let dataString = String(data: safeData, encoding: .utf8)
//            print(dataString)
//        }
//    }

//}


