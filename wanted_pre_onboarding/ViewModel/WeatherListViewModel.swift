//
//  WeatherListViewModel.swift
//  wanted_pre_onboarding
//
//  Created by JunHwan Kim on 2022/06/18.
//

import Foundation

struct WeatherListViewModel{
    var weathers : [WeatherViewModel]
    
    mutating func addWeather(weatherViewModel : WeatherViewModel){
        weathers.append(weatherViewModel)
    }
    
    mutating func sortWeathers(){
        weathers = weathers.sorted {$0.city < $1.city}
    }
    
    func numOfSection()->Int{
        return self.weathers.count
    }
    
    func weatherAtIndex(index : Int) -> WeatherViewModel{
        return self.weathers[index]
    }
    
    mutating func setEmptyWethers(){
        weathers = []
    }
}

