//
//  AuthResponse.swift
//  Spotify
//
//  Created by Dmytro Ivanenko on 27.04.2023.
//

import Foundation

struct Authresponse: Codable {
    let access_token: String
    let token_type: String
    let scope: String
    let expires_in: Int
    let refresh_token: String?
}
