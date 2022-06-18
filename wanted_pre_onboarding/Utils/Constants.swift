//
//  Constants.swift
//  wanted_pre_onboarding
//
//  Created by JunHwan Kim on 2022/06/18.
//

import Foundation

struct Constants{
    static func cityUrl(city : String)->URL{
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&lang=kr&appid=462c4e7edfd0874d7f9c5eba541e3eb2&units=metric")!
    }
    
    static func weatherIconUrl(icon : String)->URL{
        return URL(string: "http://openweathermap.org/img/wn/\(icon)@2x.png")!
    }
    
    static let citiesDic : [String : String] = ["Gongju":"공주","Gwangju":"광주","Gumi":"구미","Gunsan":"군산","Daegu":"대구","Daejeon":"대전","Mokpo":"목포","Busan":"부산","Seosan":"서산","Seoul":"서울","Sokcho":"속초","Suwon":"수원","Suncheon":"순천", "Ulsan":"울산", "Iksan":"익산", "Jeonju":"전주", "Jeju":"제주시", "Cheonan":"천안", "Cheongju":"청주", "Chuncheon":"춘천"]
    
    static let citiesEng = ["Gongju", "Gwangju", "Gumi", "Gunsan", "Daegu", "Daejeon", "Mokpo", "Busan", "Seosan", "Seoul", "Sokcho", "Suwon", "Suncheon", "Ulsan", "Iksan", "Jeonju", "Jeju", "Cheonan", "Cheongju", "Chuncheon"]
}
