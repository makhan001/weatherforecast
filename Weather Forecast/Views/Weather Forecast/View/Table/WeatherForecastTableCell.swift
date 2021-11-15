//
//  WhetherForecastTableCell.swift
//  Weather Forecast
//
//  Created by Dr.Mac on 07/10/2021.
//

import UIKit
import SDWebImage

class WeatherForecastTableCell: UITableViewCell {

    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblTemperature: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imageWeather: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(_ item: Hourly) {
        self.lblTime.text = item.dt.toTime
        self.lblDescription.text = item.weather.first?.description.capitalized ?? ""
        self.lblTemperature.text = String(format: "%.1f", item.temp.toCelcius) + " C°"
        if let icon = item.weather.first?.icon {
            let url = "https://openweathermap.org/img/w/" + "\(icon)" + ".png"
            self.imageWeather.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "Clouds"))
        }
    }
}

extension Double {
    var toCelcius: Double {
        return (self - 273.15)
    }
}

extension Int {
    var toTime: String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium //Set time style
        dateFormatter.dateStyle = .short //Set time style
        dateFormatter.timeZone = NSTimeZone() as TimeZone
        return dateFormatter.string(from: date as Date) 
    }
}

