//
//  WeatherIconManager.swift
//  wanted_pre_onboarding
//
//  Created by JunHwan Kim on 2022/06/17.
//

import Foundation
import UIKit

class WeatherIconManager{
    
    func checkCache(icon : String)->UIImage?{
        if let weatherIcon = WeatherIconCacheManager.shared.object(forKey: NSString(string: icon)){
            return weatherIcon
        }
        return nil
    }
    
    func getWeatherIcon(url : URL, completion : @escaping (UIImage)->()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data{
                WeatherIconCacheManager.shared.setObject(UIImage(data: data)!, forKey: NSString(string: url.path))
                completion(UIImage(data: data)!)
            }
        }.resume()
    }
}
