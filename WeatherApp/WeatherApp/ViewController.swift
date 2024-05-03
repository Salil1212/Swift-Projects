//
//  ViewController.swift
//  WeatherApp
//
//  Created by Nickelfox on 03/05/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var updatetimeLabel:UILabel!
    @IBOutlet weak var regionLabel:UILabel!
    @IBOutlet weak var countryLabel:UILabel!
    @IBOutlet weak var temperatureLabel:UILabel!
    @IBOutlet weak var windLabel:UILabel!
    @IBOutlet weak var humidityLabel:UILabel!

//    @IBOutlet weak var
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
    }
    func fetchData(){
        let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=28bd052bc6c94f41a9754804240305&q=india&api=no")
        let dataTask=URLSession.shared.dataTask(with: url!,completionHandler: {(data,response,error)  in
            guard let data=data,error == nil else{
                print("Error occured")
                return
            }
            var fullWeatherData: WeatherData?
            do {
                fullWeatherData = try JSONDecoder().decode(WeatherData.self,from:data)
            }
            catch{
                print("Error Occured while Decoding JSON in swift Structure \(error)")
            }
            DispatchQueue.main.async {
                self.updatetimeLabel.text="Updated : \(fullWeatherData!.current.last_updated)"
                self.regionLabel.text="Region : \(fullWeatherData!.location.region)"
                self.countryLabel.text = "Country: \(fullWeatherData!.location.country)"
                self.temperatureLabel.text="Temperature(Celsius: \(fullWeatherData!.current.temp_c)"
                self.humidityLabel.text = "Humidity: \(fullWeatherData!.current.humidity)"
                self.windLabel.text = "Wind (Km/Hr): \(fullWeatherData!.current.wind_kph)"
                
            }
        })
        dataTask.resume()
    }
    @IBAction func refreshData(_sender: Any){
        fetchData()
    }
}

