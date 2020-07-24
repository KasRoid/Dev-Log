//
//  MainWeatherView.swift
//  WeatherForecast
//
//  Created by Doyoung Song on 7/21/20.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class MainWeatherView: UIView {
    
    lazy var weatherStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [weatherIconImageView, weatherDescription])
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.lastBaseline
        stackView.spacing = 5
        return stackView
    }()
    let weatherIconImageView = UIImageView()
    let weatherDescription = UILabel()
    
    lazy var temperatureStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [lowestTemperatureLabel, highestTemperatureLabel])
        stackView.axis = .horizontal
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 10
        return stackView
    }()
    let lowestTemperatureLabel = UILabel()
    let highestTemperatureLabel = UILabel()
    let currentTemeratureLabel = UILabel()
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    private func configureUI() {
        setPropertyAttributes()
        setConstraints()
    }
    
    private func setPropertyAttributes() {
        [weatherDescription, lowestTemperatureLabel, highestTemperatureLabel, currentTemeratureLabel].forEach {
            $0.textColor = .white
        }
        
        weatherDescription.font = UIFont.systemFont(ofSize: 23, weight: .regular)
        lowestTemperatureLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        highestTemperatureLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        currentTemeratureLabel.font = UIFont.systemFont(ofSize: 100, weight: .thin)
    }
    
    private func setConstraints() {
        [currentTemeratureLabel, temperatureStackView, weatherStackView].forEach {
            addSubview($0)
        }
        
        currentTemeratureLabel.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview()
        }
        temperatureStackView.snp.makeConstraints {
            $0.leading.equalTo(currentTemeratureLabel)
            $0.bottom.equalTo(currentTemeratureLabel.snp.top)
        }
        weatherStackView.snp.makeConstraints {
            $0.leading.equalTo(currentTemeratureLabel)
            $0.bottom.equalTo(temperatureStackView.snp.top).offset(-5)
        }
        weatherIconImageView.snp.makeConstraints {
            $0.height.width.equalTo(45)
        }
    }
    
    
    // MARK: - Helpers
    func configureView(currentTemperature: String, highestTemperature: String, lowestTemperature: String, currentWeatherStatus: String, currentWeatherIcon: String) {
        currentTemeratureLabel.text = currentTemperature + "°"
        highestTemperatureLabel.text = "⤒" + highestTemperature + "°"
        lowestTemperatureLabel.text = "⤓" + lowestTemperature + "°"
        weatherDescription.text = currentWeatherStatus
        weatherIconImageView.image = UIImage(named: currentWeatherIcon)
    }
}
