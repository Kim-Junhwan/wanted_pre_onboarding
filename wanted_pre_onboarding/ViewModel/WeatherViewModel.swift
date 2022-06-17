//
//  WeatherViewModel.swift
//  wanted_pre_onboarding
//
//  Created by JunHwan Kim on 2022/06/18.
//

import Foundation
import UIKit

struct WeatherViewModel{
    private let weather : WeatherResponse
    
    init(_ weather : WeatherResponse){
        self.weather = weather
    }
    
    var city : String{
        return weather.name
    }
    
    var temp : String{
        return String(format: "%.2f", weather.main.temp)
    }
    
    var feels_like : String{
        return String(format: "%.2f", weather.main.feels_like)
    }
    
    var temp_min : String{
        return String(format: "%.2f", weather.main.temp_min)
    }
    
    var temp_max : String{
        return String(format: "%.2f", weather.main.temp_max)
    }
    
    var pressure : String{
        return String(format: "%.2f", weather.main.pressure)
    }
    
    var humidity : String{
        return String(format: "%.0f", weather.main.humidity)
    }
    
    var wind_speed : String{
        return String(format: "%.2f", weather.wind.speed)
    }
    
    var description : String{
        return weather.weather[0].description
    }
    
    var icon : String{
        return weather.weather[0].icon
    }
}
