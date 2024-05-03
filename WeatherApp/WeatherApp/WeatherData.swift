//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Nickelfox on 03/05/24.
//

import Foundation

struct WeatherData:Codable{
    let location:LocationData
    let current:CurrentData
}
