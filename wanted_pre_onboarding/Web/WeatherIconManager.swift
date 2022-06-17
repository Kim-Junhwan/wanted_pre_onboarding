//
//  WeatherIconManager.swift
//  wanted_pre_onboarding
//
//  Created by JunHwan Kim on 2022/06/17.
//

import Foundation
import UIKit

class WeatherIconManager{
    func getWeatherIcon(url : URL, completion : @escaping (UIImage)->()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data{
                completion(UIImage(data: data)!)
            }
        }.resume()
    }
}
