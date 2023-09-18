//
//  AlbumRepository.swift
//  TestApp
//
//  Created by Mohamed Anas on 18/09/2023.
//

import Foundation
import Combine

protocol AlbumRepositoryProtocol {
    func getAlbums() -> AnyPublisher<[AlbumModel],Error>
    func updateAlbum(id: Int, title: String) -> AlbumEntity?
}

class AlbumRepository: AlbumServicesProtocol {
    let albumService: AlbumServicesProtocol
    let albumOfflineService: AlbumOfflineServicesProtocol
    
    init(albumService: AlbumServicesProtocol, albumOfflineService: AlbumOfflineServicesProtocol) {
        self.albumService = albumService
        self.albumOfflineService = albumOfflineService
    }
    
    func getAlbums() -> AnyPublisher<[AlbumModel], Error> {
        albumService.getAlbums()
            .map{ [weak self] albums in
                self?.albumOfflineService.saveAlbums(albums: albums)
                return albums
            }
            .catch{ error -> AnyPublisher<[AlbumModel], Error> in
                print("Failed to fetch todos from service: \(error)")
                return self.albumOfflineService.getAlbums()
            }
            .eraseToAnyPublisher()
    }
    
    func updateAlbum(id: Int, title: String) -> AlbumEntity? {
        return albumOfflineService.updateAlbum(id: id, title: title)
    }
}
