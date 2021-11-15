//
//  WhetherForecastTableView.swift
//  Weather Forecast
//
//  Created by Dr.Mac on 07/10/2021.
//

import UIKit

class WeatherForecastTableView: UITableView {
    
    var viewModel: WeatherForecastViewModel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(viewModel: WeatherForecastViewModel) {
        self.tableFooterView = UIView(frame: .zero)
        self.separatorStyle = .none
        self.register(UINib(nibName: "WhetherForecastTableCell", bundle: nil), forCellReuseIdentifier: "WhetherForecastTableCell")
        self.delegate = self
        self.dataSource = self
        self.viewModel = viewModel
        reloadData()
    }
}

extension WeatherForecastTableView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.weatherData.hourly.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WhetherForecastTableCell") as? WeatherForecastTableCell else {
            return UITableViewCell()
        }
        cell.configure(viewModel.weatherData.hourly[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
