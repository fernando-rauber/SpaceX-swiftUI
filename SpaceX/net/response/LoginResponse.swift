//
//  LoginResponse.swift
//  SpaceX
//
//  Created by Fernando Rauber on 11/04/2021.
//

import SwiftUI

struct LoginResponse: Codable {
    let title: String
    let message: String
    let code: Int
    let token: String?
}
