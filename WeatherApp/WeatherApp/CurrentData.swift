//
//  CurrentData.swift
//  WeatherApp
//
//  Created by Nickelfox on 03/05/24.
//

import Foundation

struct CurrentData:Codable{
    let last_updated:String
    let temp_c:Float
    let wind_kph:Float
    let humidity:Int
}
