//
//  RocketModel.swift
//  SpaceX
//
//  Created by Fernando Rauber on 18/04/2021.
//

import Foundation

struct Rocket: Codable, Identifiable {
    let id: String
    let active: Bool
    let first_flight: String
    let country: String
    let wikipedia: String
    let description: String
}
