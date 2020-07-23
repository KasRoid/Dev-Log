//
//  WeatherTableViewCell.swift
//  WeatherForecast
//
//  Created by Doyoung Song on 7/21/20.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "WeatherTableViewCell"
    
    private lazy var currentDayAndTimeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [currentDateLabel, currentTimeLabel])
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.leading
        stackView.spacing = 5
        return stackView
    }()
    private let currentDateLabel = UILabel()
    private let currentTimeLabel = UILabel()
    
    private let currentWeatherIconImageView = UIImageView()
    private let currentTemperatureLabel = UILabel()
    
    private let divider = UIView()
    
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        backgroundColor = .clear
        currentDateLabel.text = "5.30 (Tue)"
        currentDateLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        currentDateLabel.textColor = .lightGray
        
        currentTimeLabel.text = "18:00"
        currentTimeLabel.font = UIFont.systemFont(ofSize: 23, weight: .regular)
        currentTimeLabel.textColor = .white
        
        currentWeatherIconImageView.image = UIImage(named: "01d")
        
        currentTemperatureLabel.text = "28°"
        currentTemperatureLabel.font = UIFont.systemFont(ofSize: 35, weight: .thin)
        currentTemperatureLabel.textColor = .white
        
        divider.backgroundColor = .lightGray
    }
    
    private func setConstraints() {
        [currentDayAndTimeStackView, currentWeatherIconImageView, currentTemperatureLabel, divider].forEach {
            addSubview($0)
        }
        
        currentDayAndTimeStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
        }
        currentWeatherIconImageView.snp.makeConstraints {
            $0.leading.equalTo(self.snp.centerX)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(45)
        }
        currentTemperatureLabel.snp.makeConstraints {
            $0.trailing.equalTo(self.snp.trailing).inset(15)
            $0.centerY.equalToSuperview()
        }
        divider.snp.makeConstraints {
            $0.centerX.leading.trailing.equalTo(currentWeatherIconImageView)
            $0.height.equalTo(1)
            $0.bottom.equalToSuperview()
        }
    }
    
    
    // MARK: - Helpers
    func configureCell(date: String, time: String, temperature: String, icon: String) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

        let dateInFormat = dateFormatter.date(from: date)!
        
        dateFormatter.dateFormat = "mm.dd (EE)"
        dateFormatter.locale = Locale(identifier: "ko")
        let dateInString = dateFormatter.string(from: dateInFormat)
        
        dateFormatter.dateFormat = "HH:mm:ss"
        let timeInFormat = dateFormatter.date(from: time)!
        
        dateFormatter.dateFormat = "HH:mm"
        let timeInString = dateFormatter.string(from: timeInFormat)
        
        currentDateLabel.text = dateInString
        currentTimeLabel.text = timeInString
        currentTemperatureLabel.text = temperature + "°"
        currentWeatherIconImageView.image = UIImage(named: icon)
    }
}
