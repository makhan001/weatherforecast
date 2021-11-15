//
//  ViewController.swift
//  Weather Forecast
//
//  Created by Dr.Mac on 07/10/2021.
//

import UIKit
import SDWebImage
import CoreLocation
import SVProgressHUD

class CurrentWeatherViewController: UIViewController {
    
    // MARK:-Outlets and variables
    
    @IBOutlet weak var lblSpeed:UILabel!
    @IBOutlet weak var lblClouds:UILabel!
    @IBOutlet weak var lblHumidity:UILabel!
    @IBOutlet weak var lblPressure:UILabel!
    @IBOutlet weak var lblCityName:UILabel!
    @IBOutlet weak var lblWheather:UILabel!
    @IBOutlet weak var lblDirection:UILabel!
    
    @IBOutlet weak var btnShare:UIButton!
    @IBOutlet weak var imageWeather:UIImageView!
    
    private var viewModel : WeatherForecastViewModel = WeatherForecastViewModel()
    private var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: Instance Methods
extension CurrentWeatherViewController: CLLocationManagerDelegate{
    
    private func setup() {
        self.navigationItem.title = "Today"
        getLocation()
    }
    
    private func getLocation(){
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    private func populateWeatherData() {
        lblCityName.text = viewModel.weatherData.timezone
        lblWheather.text = "\(String(format: "%.1f", viewModel.weatherData.current.temp.toCelcius))" + " C° |  " + (viewModel.weatherData.current.weather.first?.main ?? "")
        lblClouds.text = "\(viewModel.weatherData.current.clouds) %"
        lblHumidity.text = "\(viewModel.weatherData.current.humidity) mm"
        lblPressure.text = "\(viewModel.weatherData.current.pressure) hPa"
        lblSpeed.text = "\(viewModel.weatherData.current.wind_speed) km/h"
        
         if let icon = viewModel.weatherData.current.weather.first?.icon {
            let url = "https://openweathermap.org/img/w/" + "\(icon)" + ".png"
            self.imageWeather.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "Clouds"))
        }
        btnShare.addTarget(self, action: #selector(shareButtonAction), for: .touchUpInside)
    }
    
    @objc func shareButtonAction(sender: UIButton!) {
        showActivityViewController(url: URL(fileURLWithPath: ""),  text: "\(String(format: "%.1f", viewModel.weatherData.current.temp.toCelcius))" + " C° |  " + (viewModel.weatherData.current.weather.first?.main ?? ""),  image: self.imageWeather )
    }
    
    func showActivityViewController(url:URL,  text: String,  image: UIImageView) {
        let items = [url, text, image] as [Any]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
    }
}

extension CurrentWeatherViewController {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations is = \(locValue.latitude) \(locValue.longitude)")
        if locValue.latitude != 0 {
            viewModel.latitude = "\(locValue.latitude)"
            viewModel.longitude = "\(locValue.longitude)"
            SVProgressHUD.show()
            viewModel.FetchWeatherForecastData {
                self.populateWeatherData()
                SVProgressHUD.dismiss()
            }
            manager.stopUpdatingLocation()
        }
    }
}
