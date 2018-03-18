//
//  WeatherViewController.swift
//  Weather
//
//  Created by BilalSattar on 10/03/2018.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var weatherContainerView: UIView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        //        weatherContainerView.isHidden = true
        //        activityIndicatorView.startAnimating()
        //        activityIndicatorView.hidesWhenStopped = true
    }
}
