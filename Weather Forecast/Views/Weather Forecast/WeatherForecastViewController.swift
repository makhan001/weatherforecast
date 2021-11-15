//
//  WhetherForecastViewController.swift
//  Weather Forecast
//
//  Created by Dr.Mac on 07/10/2021.
//

import UIKit
import CoreLocation
import MapKit
import SVProgressHUD
class WeatherForecastViewController: UIViewController {
    
    @IBOutlet weak var tableView: WeatherForecastTableView!
    private var viewModel : WeatherForecastViewModel = WeatherForecastViewModel()
    private var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
}


// MARK: Instance Methods
extension WeatherForecastViewController: CLLocationManagerDelegate {
    
    private func setup() {
        self.getLocation()
       
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
}

// MARK: Location Delegate

extension WeatherForecastViewController {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations is = \(locValue.latitude) \(locValue.longitude)")
        if locValue.latitude != 0 {
            viewModel.latitude = "\(locValue.latitude)"
            viewModel.longitude = "\(locValue.longitude)"
            SVProgressHUD.show()
            viewModel.FetchWeatherForecastData {
                self.navigationItem.title = self.viewModel.weatherData.timezone
                self.tableView.configure(viewModel: self.viewModel)
                SVProgressHUD.dismiss()
            }
            manager.stopUpdatingLocation()
        }
    }
}


