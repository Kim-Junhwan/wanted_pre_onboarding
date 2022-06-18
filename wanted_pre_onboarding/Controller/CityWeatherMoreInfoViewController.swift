//
//  CityWeatherMoreInfoViewController.swift
//  wanted_pre_onboarding
//
//  Created by JunHwan Kim on 2022/06/16.
//

import Foundation
import UIKit

class CityWeatherMoreInfoViewController : UIViewController{
    
    var weatherViewModel : WeatherViewModel!
    
    let contentScrollView : UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor(red: 0.19, green: 0.20, blue: 0.42, alpha: 1.00)
        //scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    let mainView : UIView = {
        let mainView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    let cityNameLabel : UILabel = {
        let cityNameLabel = UILabel()
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.font = UIFont.systemFont(ofSize: 20)
        cityNameLabel.textColor = .white
       return cityNameLabel
    }()
    
    let tempLabel : UILabel = {
        let tempLabel = UILabel()
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.font = UIFont.boldSystemFont(ofSize: 80)
        tempLabel.textColor = .white
       return tempLabel
    }()
    
    let weatherIconImageView : UIImageView = {
       let weatherIconImageView = UIImageView()
        weatherIconImageView.translatesAutoresizingMaskIntoConstraints = false
        return weatherIconImageView
    }()
    
    let descriptionLabel : UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 15)
        descriptionLabel.textColor = .white
       return descriptionLabel
    }()
    
    let weatherDescriptionStackView : UIStackView = {
       let weatherDescriptionStackView = UIStackView()
        weatherDescriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        weatherDescriptionStackView.axis = .horizontal
        weatherDescriptionStackView.spacing = 5
        return weatherDescriptionStackView
    }()
    
    let temp_maxLabel : UILabel = {
        let temp_maxLabel = UILabel()
        temp_maxLabel.translatesAutoresizingMaskIntoConstraints = false
        temp_maxLabel.font = UIFont.systemFont(ofSize: 15)
        temp_maxLabel.textColor = .white
       return temp_maxLabel
    }()
    
    let temp_minLabel : UILabel = {
        let temp_minLabel = UILabel()
        temp_minLabel.translatesAutoresizingMaskIntoConstraints = false
        temp_minLabel.font = UIFont.systemFont(ofSize: 15)
        temp_minLabel.textColor = .white
       return temp_minLabel
    }()
    
    let temp_min_max_stackView : UIStackView = {
       let temp_min_max_stackView = UIStackView()
        temp_min_max_stackView.translatesAutoresizingMaskIntoConstraints = false
        temp_min_max_stackView.axis = .horizontal
        temp_min_max_stackView.spacing = 5
        return temp_min_max_stackView
    }()
    
    let humidityView : UIView = {
       let humidityView = UIView()
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        humidityView.translatesAutoresizingMaskIntoConstraints = false
        humidityView.backgroundColor = UIColor(red: 0.41, green: 0.43, blue: 0.88, alpha: 1.00)
        humidityView.layer.cornerRadius = 10
        humidityView.addSubview(textLabel)
        textLabel.text = "습도"
        textLabel.textColor = .white
        return humidityView
    }()
    
    let humidityLabel : UILabel = {
        let humidityLabel = UILabel()
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        humidityLabel.textColor = .white
        humidityLabel.font = UIFont.boldSystemFont(ofSize: 25)
        return humidityLabel
    }()
    
    let feelTempView : UIView = {
        let feelTempView  = UIView()
         let textLabel = UILabel()
         textLabel.translatesAutoresizingMaskIntoConstraints = false
         feelTempView .translatesAutoresizingMaskIntoConstraints = false
         feelTempView .backgroundColor = UIColor(red: 0.41, green: 0.43, blue: 0.88, alpha: 1.00)
         feelTempView .addSubview(textLabel)
         feelTempView.layer.cornerRadius = 10
         textLabel.text = "체감온도"
         textLabel.textColor = .white
         return feelTempView
     }()
    
    let feelTempLabel : UILabel = {
        let feelTempLabel = UILabel()
        feelTempLabel.translatesAutoresizingMaskIntoConstraints = false
        feelTempLabel.textColor = .white
        feelTempLabel.font = UIFont.boldSystemFont(ofSize: 25)
        return feelTempLabel
    }()
    
    let humidity_windChill_stackView : UIStackView = {
       let humidity_windChill_stackView = UIStackView()
        humidity_windChill_stackView.translatesAutoresizingMaskIntoConstraints = false
        humidity_windChill_stackView.axis = .horizontal
        humidity_windChill_stackView.spacing = 10
        return humidity_windChill_stackView
    }()
    
    let pressureView : UIView = {
       let pressureView = UIView()
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        pressureView.translatesAutoresizingMaskIntoConstraints = false
        pressureView.backgroundColor = UIColor(red: 0.41, green: 0.43, blue: 0.88, alpha: 1.00)
        pressureView.addSubview(textLabel)
        pressureView.layer.cornerRadius = 10
        textLabel.text = "기압"
        textLabel.textColor = .white
        return pressureView
    }()
    
    let pressureLabel : UILabel = {
        let pressureLabel = UILabel()
        pressureLabel.translatesAutoresizingMaskIntoConstraints = false
        pressureLabel.textColor = .white
        pressureLabel.font = UIFont.boldSystemFont(ofSize: 25)
        return pressureLabel
    }()
    
    let windSpeedView : UIView = {
        let windSpeedView  = UIView()
         let textLabel = UILabel()
         textLabel.translatesAutoresizingMaskIntoConstraints = false
         windSpeedView .translatesAutoresizingMaskIntoConstraints = false
         windSpeedView .backgroundColor = UIColor(red: 0.41, green: 0.43, blue: 0.88, alpha: 1.00)
         windSpeedView .addSubview(textLabel)
         windSpeedView.layer.cornerRadius = 10
         textLabel.text = "풍속"
         textLabel.textColor = .white
         return windSpeedView
     }()
    
    let windSpeedLabel : UILabel = {
        let windSpeedLabel = UILabel()
        windSpeedLabel.translatesAutoresizingMaskIntoConstraints = false
        windSpeedLabel.textColor = .white
        windSpeedLabel.font = UIFont.boldSystemFont(ofSize: 25)
        return windSpeedLabel
    }()
    
    let pressure_windSpeed_stackView : UIStackView = {
       let pressure_windSpeed_stackView = UIStackView()
        pressure_windSpeed_stackView.translatesAutoresizingMaskIntoConstraints = false
        pressure_windSpeed_stackView.axis = .horizontal
        pressure_windSpeed_stackView.spacing = 10
        return pressure_windSpeed_stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .never
        //print(weatherViewModel)
        setView()
        autoLayout()
        setUI(weatherViewModel)
    }
    
    func setView(){
        self.view.addSubview(contentScrollView)
        self.contentScrollView.addSubview(mainView)
        
        self.mainView.addSubview(cityNameLabel)
        self.mainView.addSubview(tempLabel)
        
        self.mainView.addSubview(weatherDescriptionStackView)
        self.weatherDescriptionStackView.addArrangedSubview(weatherIconImageView)
        self.weatherDescriptionStackView.addArrangedSubview(descriptionLabel)
        
        self.mainView.addSubview(temp_min_max_stackView)
        self.temp_min_max_stackView.addArrangedSubview(temp_maxLabel)
        self.temp_min_max_stackView.addArrangedSubview(temp_minLabel)
        
        self.mainView.addSubview(humidity_windChill_stackView)
        self.humidity_windChill_stackView.addArrangedSubview(humidityView)
        self.humidity_windChill_stackView.addArrangedSubview(feelTempView)
        self.humidityView.addSubview(humidityLabel)
        self.feelTempView.addSubview(feelTempLabel)
        
        self.mainView.addSubview(pressure_windSpeed_stackView)
        self.pressure_windSpeed_stackView.addArrangedSubview(pressureView)
        self.pressure_windSpeed_stackView.addArrangedSubview(windSpeedView)
        self.pressureView.addSubview(pressureLabel)
        self.windSpeedView.addSubview(windSpeedLabel)
    }
    
    func autoLayout(){
        NSLayoutConstraint.activate([
            contentScrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            contentScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            mainView.topAnchor.constraint(equalTo: self.contentScrollView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: self.contentScrollView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: self.contentScrollView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: self.contentScrollView.bottomAnchor),
            mainView.widthAnchor.constraint(equalTo: contentScrollView.widthAnchor),
            
            cityNameLabel.topAnchor.constraint(equalTo: mainView.topAnchor ,constant: 10),
            cityNameLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            
            tempLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor , constant: 2),
            tempLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            
            weatherDescriptionStackView.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: -15),
            weatherDescriptionStackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            
            temp_min_max_stackView.topAnchor.constraint(equalTo: weatherDescriptionStackView.bottomAnchor, constant: 0),
            temp_min_max_stackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            
            humidityView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.3),
            humidityView.heightAnchor.constraint(equalTo: humidityView.widthAnchor),
            
            humidityLabel.centerXAnchor.constraint(equalTo: humidityView.centerXAnchor),
            humidityLabel.centerYAnchor.constraint(equalTo: humidityView.centerYAnchor),
            
            feelTempView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.3),
            feelTempView.heightAnchor.constraint(equalTo: humidityView.widthAnchor),
            
            feelTempLabel.centerXAnchor.constraint(equalTo: feelTempView.centerXAnchor),
            feelTempLabel.centerYAnchor.constraint(equalTo: feelTempView.centerYAnchor),
            
            humidity_windChill_stackView.topAnchor.constraint(equalTo: temp_min_max_stackView.bottomAnchor, constant: 20),
            humidity_windChill_stackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            
            pressureView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.3),
            pressureView.heightAnchor.constraint(equalTo: pressureView.widthAnchor),
            
            pressureLabel.centerXAnchor.constraint(equalTo: pressureView.centerXAnchor),
            pressureLabel.centerYAnchor.constraint(equalTo: pressureView.centerYAnchor),
            
            windSpeedView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.3),
            windSpeedView.heightAnchor.constraint(equalTo: windSpeedView.widthAnchor),
            
            windSpeedLabel.centerXAnchor.constraint(equalTo: windSpeedView.centerXAnchor),
            windSpeedLabel.centerYAnchor.constraint(equalTo: windSpeedView.centerYAnchor),
            
            pressure_windSpeed_stackView.topAnchor.constraint(equalTo: humidity_windChill_stackView.bottomAnchor, constant: 10),
            pressure_windSpeed_stackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
        ])
    }
    
    func setUI(_ weatherViewModel : WeatherViewModel){
        cityNameLabel.text = Constants.citiesDic[weatherViewModel.city]
        tempLabel.text = "\(weatherViewModel.temp)°"
        weatherIconImageView.image = resizeImage(image: weatherViewModel.iconImage, width: 50, height: 50) 
        descriptionLabel.text = weatherViewModel.description
        temp_maxLabel.text = "최고:\(weatherViewModel.temp_max)°"
        temp_minLabel.text = "최저:\(weatherViewModel.temp_min)°"
        humidityLabel.text = "\(weatherViewModel.humidity)%"
        feelTempLabel.text = "\(weatherViewModel.feels_like)°"
        pressureLabel.text = "\(weatherViewModel.pressure) hPa"
        windSpeedLabel.text = "\(weatherViewModel.wind_speed) m/s"
    }
    
    func resizeImage(image: UIImage, width: CGFloat, height: CGFloat) -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        image.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
