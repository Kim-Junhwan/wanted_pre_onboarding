//
//  WeatherListViewModel.swift
//  wanted_pre_onboarding
//
//  Created by JunHwan Kim on 2022/06/18.
//

import Foundation

struct WeatherListViewModel{
    var weathers : [WeatherResponse]
    
    mutating func addWeather(weatherResponse : WeatherResponse){
        weathers.append(weatherResponse)
    }
    
    mutating func sortWeathers(){
        weathers = weathers.sorted {$0.name < $1.name}
    }
    
    func numOfSection()->Int{
        return self.weathers.count
    }
    
    func weatherAtIndex(index : Int) -> WeatherViewModel{
        let weather = self.weathers[index]
        return WeatherViewModel(weather)
    }
}

