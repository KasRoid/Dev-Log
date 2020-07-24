//
//  HomeViewController.swift
//  WeatherForecast
//
//  Created by Doyoung Song on 7/21/20.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    let backgroundImageView = UIImageView()
    let statusBarView = UIView()
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let backgroundImages = ["sunny", "rainy", "lightning", "cloudy"]
    let currentWeatherAddress = "https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=681a90b9d161ccf4e6837ea81e50d006"
    let weeklyWeatherAddress = "https://api.openweathermap.org/data/2.5/forecast?q=Seoul&appid=681a90b9d161ccf4e6837ea81e50d006"
    
    lazy var mainTitleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 0
        return stackView
    }()
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let refreshButton = UIButton(type: .system)
    let refreshButtonImage = UIImage(systemName: "arrow.clockwise")!

    let mainWeatherView = MainWeatherView()
    let weatherDataTableView = UITableView()

    let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
    lazy var blurEffectView = UIVisualEffectView(effect: blurEffect)
    
    var currentWeatherIcon = ""
    var currentWeatherStatus = ""
    var maxTemperature = ""
    var minTemperature = ""
    var currentTemperature: String = ""
    var weeklyWeatherData = [WeeklyWeatherData]()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadCurrentWeatherData()
        self.configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.contentSize = CGSize(width: view.frame.width, height: weatherDataTableView.frame.maxY + 10)
    }
    
    
    // MARK: - UI
    private func configureUI() {
        view.backgroundColor = .white
        setNavigationController()
        setStoredPropertyAttributes()
        setConstraints()
    }
    
    private func setNavigationController() {
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setStoredPropertyAttributes() {
        backgroundImageView.image = UIImage(named: "sunny")!
        backgroundImageView.contentMode = .scaleAspectFill
        
        statusBarView.backgroundColor = .clear
        statusBarView.alpha = 0
        
        scrollView.backgroundColor = .clear
        scrollView.delegate = self
        
        titleLabel.text = "서울"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        subTitleLabel.text = setCurrentTime()
        subTitleLabel.textColor = .white
        subTitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        refreshButton.setImage(refreshButtonImage, for: .normal)
        refreshButton.tintColor = .white
        refreshButton.addTarget(self, action: #selector(handleRefreshButton(_:)), for: .touchUpInside)
        
        weatherDataTableView.backgroundColor = .clear
        weatherDataTableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
        weatherDataTableView.dataSource = self
        weatherDataTableView.delegate = self
        weatherDataTableView.rowHeight = view.frame.height / 10
        weatherDataTableView.separatorStyle = .none
    }
    
    private func setConstraints() {
        [backgroundImageView, scrollView, statusBarView, mainTitleStackView, refreshButton, weatherDataTableView].forEach {
            view.addSubview($0)
        }
        scrollView.addSubview(contentView)
        [mainWeatherView, weatherDataTableView].forEach {
            contentView.addSubview($0)
        }
        backgroundImageView.addSubview(blurEffectView)
        backgroundImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.centerX.equalToSuperview().offset(0)
            $0.width.equalToSuperview().offset(10)
        }
        statusBarView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(mainTitleStackView)
        }
        scrollView.snp.makeConstraints {
            $0.top.equalTo(mainTitleStackView.snp.bottom)
            $0.leading.trailing.bottom.equalTo(view)
        }
        contentView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
        }
        mainTitleStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
        }
        refreshButton.snp.makeConstraints {
            $0.centerY.equalTo(mainTitleStackView)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        mainWeatherView.snp.makeConstraints {
            $0.leading.equalTo(20)
            $0.top.equalTo(view.frame.height * 0.88)
        }
        weatherDataTableView.snp.makeConstraints {
            $0.top.equalTo(mainWeatherView.snp.bottom).offset(5)
            $0.leading.equalTo(0)
            $0.trailing.equalTo(view.frame.width)
            $0.height.equalTo(weatherDataTableView.rowHeight * 40)
        }
        blurEffectView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.centerX.equalToSuperview().offset(0)
            $0.width.equalToSuperview().offset(100)
        }
    }
    
    
    // MARK: - API
    private func loadCurrentWeatherData() {
        let currentWeatherURL = URL(string: currentWeatherAddress)!
        URLSession.shared.dataTask(with: currentWeatherURL) { (data, response, error) in
            guard error == nil else { print(error!); return }
            guard let response = response as? HTTPURLResponse,
                (200..<400).contains(response.statusCode)
                else { return print("Invalid response") }
            guard let data = data else { print("Data Guard"); return }
            
            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                    let mainData = jsonObject["main"] as? [String: Double],
                    let temperature = mainData["temp"], let maxTemp = mainData["temp_max"], let minTemp = mainData["temp_min"],
                    let weatherData = jsonObject["weather"] as? [[String: Any]],
                    let weatherStatus = weatherData[0]["main"] as? String, let weatherIcon = weatherData[0]["icon"] as? String {
                    
                    self.currentTemperature = String(format: "%.1f", temperature - 273.15)
                    self.maxTemperature = String(format: "%.1f", maxTemp - 273.15)
                    self.minTemperature = String(format: "%.1f", minTemp - 273.15)
                    self.currentWeatherStatus = weatherStatus
                    self.currentWeatherIcon = weatherIcon
                    
                    DispatchQueue.main.async {
                        self.mainWeatherView.configureView(
                            currentTemperature: self.currentTemperature,
                            highestTemperature: self.maxTemperature,
                            lowestTemperature: self.minTemperature,
                            currentWeatherStatus: self.currentWeatherStatus,
                            currentWeatherIcon: self.currentWeatherIcon
                        )
                    }
                    
                } else {
                    print("Parsing Error")
                }
            } catch {
                print("Error Catch")
            }
        }.resume()
    }

    private func loadWeeklyWeatherData(cell: WeatherTableViewCell?, row: Int?) {
        let weeklyWeatherURL = URL(string: weeklyWeatherAddress)!
        URLSession.shared.dataTask(with: weeklyWeatherURL, completionHandler: { (data, response, error) in
            guard error == nil else { print(error!); return }
            guard let response = response as? HTTPURLResponse, (200..<400).contains(response.statusCode) else { print("Invalid Response"); return }
            guard let data = data else { print("No Data"); return }
            
            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                    let list = jsonObject["list"] as? [[String: Any]] {
                    for index in list.indices {
                        if let main = list[index]["main"] as? [String: Double], let weather = list[index]["weather"] as? [[String: Any]],
                            let date = list[index]["dt_txt"] as? String,
                            let temperature = main["temp"],
                            let icon = weather[0]["icon"] as? String {
                            let weeklyWeatherData = WeeklyWeatherData(temperature: String(Int(temperature - 273.15)), weatherIcon: icon, date: date)
                            self.weeklyWeatherData.append(weeklyWeatherData)
                        }
                    }
                    DispatchQueue.main.async {
                        if let row = row, let cell = cell {
                            let cellDateAndTime = self.weeklyWeatherData[row].date
                            let cellDate = self.splitDateData(date: cellDateAndTime)[0]
                            let cellTime = self.splitDateData(date: cellDateAndTime)[1]
                            let cellTemperature = self.weeklyWeatherData[row].temperature
                            let cellIcon = self.weeklyWeatherData[row].weatherIcon
                            cell.configureCell(
                                date: cellDate,
                                time: cellTime,
                                temperature: cellTemperature,
                                icon: cellIcon)
                        }
                    }
                } else {
                    print("Parsing Error")
                }
            } catch {
                print("Error Catched")
            }
        }).resume()
    }
    
    // MARK: - Helpers
    private func splitDateData(date: String) -> [String] {
        let dateAndTime = date.components(separatedBy: " ")
        return dateAndTime
    }
    
    private func setCurrentTime() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.dateFormat = "a HH:mm"
        let nowIntString = dateFormatter.string(from: now)
        return nowIntString
    }
    
    private func rotateButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, animations: {
            sender.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        })
        UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
        }, completion: nil)
    }
    
    private func transitionBackground() {
        UIView.transition(
            with: backgroundImageView,
            duration: 0.2,
            options: .transitionCrossDissolve,
            animations: {
                self.backgroundImageView.image = UIImage(named: self.backgroundImages.randomElement()!)
        },
            completion: nil)
    }
    
    private func animateMainWeatherView() {
        self.mainWeatherView.snp.updateConstraints({
            $0.leading.equalTo(view.frame.width + 30)
        })
        mainWeatherView.alpha = 0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.001, execute: {
            UIView.animate(
                withDuration: 0.3,
                animations: {
                    self.mainWeatherView.alpha = 1
                    self.mainWeatherView.snp.updateConstraints({
                        $0.leading.equalTo(20)
                    })
                    self.view.layoutIfNeeded()
            })
        })
    }
    
    private func dimBackgroundImage(scrollView: UIScrollView) {
        blurEffectView.alpha = scrollView.contentOffset.y / (view.frame.height * 1) < 0.7 ? scrollView.contentOffset.y / (view.frame.height * 1) : 0.7
    }
    
    private func moveBackgroundImage(scrollView: UIScrollView) {
        self.backgroundImageView.snp.updateConstraints {
            $0.centerX.equalToSuperview().offset(scrollView.contentOffset.y / (100))
        }
    }
    
    private func reloadWeatherData() {
        subTitleLabel.text = setCurrentTime()
        loadCurrentWeatherData()
        weatherDataTableView.reloadData()
    }
    
    
    // MARK: - Selectors
    @objc private func handleRefreshButton(_ sender: UIButton) {
        rotateButton(sender)
        transitionBackground()
        animateMainWeatherView()
        reloadWeatherData()
    }
}


// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = weatherDataTableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as? WeatherTableViewCell else { fatalError("No Such Cell") }
        loadWeeklyWeatherData(cell: cell, row: indexPath.row)
        return cell
    }
}


// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        dimBackgroundImage(scrollView: scrollView)
        moveBackgroundImage(scrollView: scrollView)
    }
}
