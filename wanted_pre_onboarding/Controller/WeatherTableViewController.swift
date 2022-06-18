//
//  WeatherTableViewController.swift
//  wanted_pre_onboarding
//
//  Created by JunHwan Kim on 2022/06/16.
//

import UIKit

class WeatherTableViewController: UITableViewController {
    
    let citiesDic = Constants.citiesDic
    let citiesEng = Constants.citiesEng
    
    var weatherListViewModel : WeatherListViewModel = WeatherListViewModel(weathers: [])
    var selectWeather : WeatherViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    func setUp(){
        setTitle()
        registerTableViewCell()
        setTableView()
        getCityWeather()
    }
    
    func setTitle(){
        self.title = "오늘의 날씨"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func registerTableViewCell(){
        tableView.register(WeatherListCell.self, forCellReuseIdentifier: WeatherListCell.identifier)
    }
    
    func setTableView(){
        tableView.rowHeight = 60
    }
    
    func getCityWeather(){
        for city in citiesEng {
            WeatherManager().getWeather(url: Constants.cityUrl(city: city)) { weather in
            if let weather = weather {
                if let icon = WeatherIconManager().checkCache(icon: Constants.weatherIconUrl(icon: weather.weather[0].icon).path){
                    print("Cache Image")
                    self.weatherListViewModel.addWeather(weatherViewModel: WeatherViewModel(weather, iconImage: icon))
                    if self.weatherListViewModel.numOfSection() == self.citiesEng.count{
                        self.weatherListViewModel.sortWeathers()
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }else{
                WeatherIconManager().getWeatherIcon(url: Constants.weatherIconUrl(icon: weather.weather[0].icon)) { weatherIcon in
                    print("Download Image")
                    self.weatherListViewModel.addWeather(weatherViewModel: WeatherViewModel(weather, iconImage: weatherIcon))
                    if self.weatherListViewModel.numOfSection() == self.citiesEng.count{
                        self.weatherListViewModel.sortWeathers()
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
                }
            }
            }
        }
    }
    
    func resizeImage(image: UIImage, width: CGFloat, height: CGFloat) -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        image.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherListViewModel.numOfSection()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weatherViewModel = self.weatherListViewModel.weatherAtIndex(index: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherListCell.identifier, for: indexPath) as! WeatherListCell
        cell.cityNameLabel.text = citiesDic[weatherViewModel.city]
        cell.temperatureLabel.text = "\(weatherViewModel.temp)°"
        cell.weatherIconImageLabel.image = resizeImage(image: weatherViewModel.iconImage, width: 50, height: 50) 
        cell.humidityLabel.text = "\(weatherViewModel.humidity)%"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectWeather = weatherListViewModel.weatherAtIndex(index: indexPath.row)
        performSegue(withIdentifier: "moreInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moreInfo"{
            let vc = segue.destination as! CityWeatherMoreInfoViewController
            vc.weatherViewModel = selectWeather
        }
    }
}
