//
//  WebService.swift
//  wanted_pre_onboarding
//
//  Created by JunHwan Kim on 2022/06/17.
//

import Foundation

class WeatherManager{
    func getWeather(url : URL, completion : @escaping (WeatherResponse?)->()){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error{
                    print(error.localizedDescription)
                    completion(nil)
                }else if let data = data{
                    let weather = try? JSONDecoder().decode(WeatherResponse.self, from: data)
                    if let weather = weather{
                        completion(weather)
                    }
                }
        }.resume()
    }
}
