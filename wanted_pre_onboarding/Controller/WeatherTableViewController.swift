//
//  WeatherTableViewController.swift
//  wanted_pre_onboarding
//
//  Created by JunHwan Kim on 2022/06/16.
//

import UIKit

class WeatherTableViewController: UITableViewController {
    
    let cities : [String : String] = ["Gongju":"공주","Gwangju":"광주","Gumi":"구미","Gunsan":"군산","Daegu":"대구","Daejeon":"대전","Mokpo":"목포","Busan":"부산","Seosan":"서산","Seoul":"서울","Sokcho":"속초","Suwon":"수원","Suncheon":"순천", "Ulsan":"울산", "Iksan":"익산", "Jeonju":"전주", "Jeju":"제주시", "Cheonan":"천안", "Cheongju":"청주", "ChunCheon":"춘천"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    func setUp(){
        setTitle()
        registerTableViewCell()
        setTableView()
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
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherListCell.identifier, for: indexPath) as! WeatherListCell
        
        cell.cityNameLabel.text = "Seoul"
        cell.humidityLabel.text = "20%"
        cell.temperatureLabel.text = "24C"
        cell.weatherIconImageLabel.text = "Cloud"
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
