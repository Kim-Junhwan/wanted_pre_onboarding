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
        scrollView.backgroundColor = .systemBackground
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
        cityNameLabel.text = "Seoul"
       return cityNameLabel
    }()
    
    let tempLabel : UILabel = {
        let tempLabel = UILabel()
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.font = UIFont.boldSystemFont(ofSize: 80)
        tempLabel.text = "20°"
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
        descriptionLabel.text = "흐림"
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
        temp_maxLabel.text = "최고:26"
       return temp_maxLabel
    }()
    
    let temp_minLabel : UILabel = {
        let temp_minLabel = UILabel()
        temp_minLabel.translatesAutoresizingMaskIntoConstraints = false
        temp_minLabel.font = UIFont.systemFont(ofSize: 15)
        temp_minLabel.text = "최저:21"
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
        humidityView.translatesAutoresizingMaskIntoConstraints = false
        humidityView.backgroundColor = .systemGray
        return humidityView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .never
        print(weatherViewModel)
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
        
        self.mainView.addSubview(humidityView)
        
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
            
            humidityView.topAnchor.constraint(equalTo: temp_min_max_stackView.bottomAnchor),
            humidityView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            humidityView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            humidityView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            humidityView.heightAnchor.constraint(equalToConstant: 1000),
//            humidityView.widthAnchor.constraint(equalToConstant: 50),
//            humidityView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setUI(_ weatherViewModel : WeatherViewModel){
        cityNameLabel.text = Constants.citiesDic[weatherViewModel.city]
        tempLabel.text = "\(weatherViewModel.temp)°"
        weatherIconImageView.image = resizeImage(image: weatherViewModel.iconImage, width: 50, height: 50) 
        descriptionLabel.text = weatherViewModel.description
        temp_maxLabel.text = "최고:\(weatherViewModel.temp_max)°"
        temp_minLabel.text = "최저:\(weatherViewModel.temp_min)°"
    }
    
    func resizeImage(image: UIImage, width: CGFloat, height: CGFloat) -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        image.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
