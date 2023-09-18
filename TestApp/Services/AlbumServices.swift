//
//  AlbumServices.swift
//  TestApp
//
//  Created by Mohamed Anas on 18/09/2023.
//

import Foundation
import Combine

protocol AlbumServicesProtocol {
    func getAlbums() -> AnyPublisher<[AlbumModel],Error>
}

class AlbumServices: AlbumServicesProtocol {
    let session: URLSession
    let baseURL = URL(string: "https://jsonplaceholder.typicode.com/")!
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
   
    func getAlbums() -> AnyPublisher<[AlbumModel], Error> {
        let url = baseURL.appendingPathComponent("photos")
        
        return session.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [AlbumModel].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

}
