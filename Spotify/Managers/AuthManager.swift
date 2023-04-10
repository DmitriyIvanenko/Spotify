//
//  AuthManager.swift
//  Spotify
//
//  Created by Dmytro Ivanenko on 23.03.2023.
//

import Foundation

final class AuthManager {
    
    static let shared = AuthManager()
    
    struct Constants {
        static let clientID = "450cf56bd5cd4aef88c741496e2bf721"
        static let clientSecret = "f512a683f41b4da1b4b10d030dc53391"
    }
    
    // MARK: - Init
    private init() {}
    
    public var signInURL: URL? {
        let scopes = "playlist-read-private"
        let redirectURI = "https://google.com"
        let base = "https://accounts.spotify.com/authorize"
        let string = "\(base)?response_type=code&client_id=\(Constants.clientID)&scope=\(scopes)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        return URL(string: string)
    }
    
    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    
    private var refreshToken: String? {
        return nil
    }
    
    private var tokenExpirationData: Date? {
        return nil
    }
    
    private var shouldRefreshToken: Bool {
        return false
    }
    
    public func exchangeCodeForToken(
        code: String,
        completion: @escaping ((Bool) -> Void)
    ) {
        // Get Token
    }
    
    public func refreshAccessToken() {
        
    }
    
    public func cacheToken() {
        
    }
}
