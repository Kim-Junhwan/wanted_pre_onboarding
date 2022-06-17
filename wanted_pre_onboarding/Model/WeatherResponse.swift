//
//  WeatherResponse.swift
//  wanted_pre_onboarding
//
//  Created by JunHwan Kim on 2022/06/16.
//

import Foundation

struct WeatherResponse : Decodable{
    let weather : [Weather]
    let main : Main
    let wind : Wind
    let name : String
    
}

struct Main : Decodable{
    let temp : Double
    let feels_like : Double
    let temp_min : Double
    let temp_max : Double
    let pressure : Int
    let humidity : Double
}

struct Wind : Decodable{
    let speed : Double
}

struct Weather : Decodable{
    let description : String
    let icon : String
}
