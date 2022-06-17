//
//  Constants.swift
//  wanted_pre_onboarding
//
//  Created by JunHwan Kim on 2022/06/18.
//

import Foundation

struct Constants{
    static func cityUrl(city : String)->URL{
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=462c4e7edfd0874d7f9c5eba541e3eb2&units=metric")!
    }
}
