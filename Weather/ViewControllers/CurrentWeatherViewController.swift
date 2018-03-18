//
//  CurrentWeatherViewController.swift
//  Weather
//
//  Created by BilalSattar on 10/03/2018.
//

import UIKit
import RealmSwift

protocol CurrentWeatherViewControllerDelegate: class {
    func locationButtonPressed(controller: CurrentWeatherViewController)
    func settingsButtonPressed(controller: CurrentWeatherViewController)
}

class CurrentWeatherViewController: WeatherViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var weather = [Weather].init()
    
    weak var delegate: CurrentWeatherViewControllerDelegate?
    
    var viewModel: CurrentWeatherViewModel? {
        didSet {
            DispatchQueue.main.async {
                self.updateView()
            }
        }
    }
    
    func updateView() {
        activityIndicatorView.stopAnimating()
        
        if let vm = viewModel, vm.isUpdateReady {
            updateWeatherContainerView(with: vm)
        }
    }
    
    func updateWeatherContainerView(with vm: CurrentWeatherViewModel) {
        
        weatherContainerView.isHidden = false
        temperatureLabel.text = vm.temperature
        dateLabel.text = vm.date
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func locationBtnClicked(_ sender: UIButton) {
        delegate?.locationButtonPressed(controller: self)
    }
    
    @IBAction func settingBtnClicked(_ sender: UIButton) {
        delegate?.settingsButtonPressed(controller: self)
    }
}
