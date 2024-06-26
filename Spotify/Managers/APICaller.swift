//
//  APICaller.swift
//  Spotify
//
//  Created by Dmytro Ivanenko on 23.03.2023.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    private init () {}
    
    struct Constants {
        static let baseAPIURL = "http://api.spotify.com/v1"
    }
    
    enum APIEror: Error {
        case failedToGetData
    }
    
    public func getCurentUserProfile(completion: @escaping (Result<UserProfile, Error>) -> Void) {
        createRequest(
            with: URL(string: Constants.baseAPIURL + "/me"),
            type: .GET
        ) { baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIEror.failedToGetData))
                    return
                }
                
                do {
                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    print(result)
                }
                catch {
                    completion(.failure(error))
                }
            }
            
            task.resume()
        }
    }
    // MARK: - Private
    enum HTTPMethod: String {
        case GET
        case POST
    }
    
    private func createRequest(
        with url: URL?,
        type: HTTPMethod,
        completion: @escaping (URLRequest) -> Void
    ) {
        AuthManager.shared.withValidToken { token in
            guard let apiURL = url else {
                return
            }
            var reqest = URLRequest(url: apiURL)
            reqest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization: ") // _:
            reqest.httpMethod = type.rawValue
            reqest.timeoutInterval = 30
            completion(reqest)
        }
    }
}
