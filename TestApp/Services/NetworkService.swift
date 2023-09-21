//
//  NetworkService.swift
//  TestApp
//
//  Created by Mohamed Anas on 21/09/2023.
//

import Foundation
import Combine


class NetworkService {
    
    let session: URLSession
    let baseURL = URL(string: "https://api.beautyethic.com/")
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func getJsonRespons<T:Codable>() -> AnyPublisher<T, Error> {
        guard let completeURL = baseURL?.appendingPathComponent("BeautyEthicMobAPI/api/TbHomePage/TbBannerWithCategory") else {
            return Fail(error: NSError(domain: "URL Error", code: 1000)).eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(url: completeURL)
        urlRequest.addValue("60500684-3241-4C59-B53B-1DDAB92FE96E", forHTTPHeaderField: "App_ses_id")
        urlRequest.addValue("GUEST", forHTTPHeaderField: "App_ses_type")
        urlRequest.addValue("BEAUTY_ETHIC", forHTTPHeaderField: "Customorigin")
        urlRequest.addValue("WEB", forHTTPHeaderField: "App_device")
        
        return session.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
