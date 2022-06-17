//
//  WeatherListCell.swift
//  wanted_pre_onboarding
//
//  Created by JunHwan Kim on 2022/06/16.
//

import Foundation
import UIKit

class WeatherListCell : UITableViewCell{
    
    static let identifier = "WeatherListCell"
    
    let cityNameLabel : UILabel = {
        let cityNameLabel = UILabel()
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return cityNameLabel
    }()
    
    let temperatureLabel : UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return temperatureLabel
    }()
    
    let weatherIconImageLabel : UIImageView = {
        let weatherIconImageLabel = UIImageView()
        weatherIconImageLabel.translatesAutoresizingMaskIntoConstraints = false
        return weatherIconImageLabel
    }()
    
    let humidityLabel : UILabel = {
        let humidityLabel = UILabel()
        humidityLabel.font = UIFont.boldSystemFont(ofSize: 20)
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        return humidityLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setContentView()
        autoLayout()
    }
    
    func setContentView(){
        contentView.addSubview(cityNameLabel)
        contentView.addSubview(temperatureLabel)
        contentView.addSubview(weatherIconImageLabel)
        contentView.addSubview(humidityLabel)
    }
    
    func autoLayout(){
        let margin : CGFloat = 10
        
        NSLayoutConstraint.activate([
            cityNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            cityNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin),
            //cityNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            humidityLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            humidityLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin),
            
            
            temperatureLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: humidityLabel.leadingAnchor, constant: -margin),
            //temperatureLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            weatherIconImageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            weatherIconImageLabel.trailingAnchor.constraint(equalTo: temperatureLabel.leadingAnchor, constant: -margin),
            //weatherIconImageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
