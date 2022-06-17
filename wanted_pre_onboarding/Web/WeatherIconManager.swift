//
//  WeatherIconManager.swift
//  wanted_pre_onboarding
//
//  Created by JunHwan Kim on 2022/06/17.
//

import Foundation

class WeatherIconManager{
    func load(url : URL, completion : @escaping (Data)->()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data{
                DispatchQueue.global(qos: .background).async {
                    completion(data)
                }
            }
        }.resume()
    }
}
