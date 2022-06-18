//
//  WeatherIconCacheManager.swift
//  wanted_pre_onboarding
//
//  Created by JunHwan Kim on 2022/06/18.
//

import Foundation
import UIKit

class WeatherIconCacheManager{
    static let shared = NSCache<NSString, UIImage>()
    
    private init(){}
}
