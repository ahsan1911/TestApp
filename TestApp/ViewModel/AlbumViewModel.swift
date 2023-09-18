//
//  AlbumViewModel.swift
//  TestApp
//
//  Created by Mohamed Anas on 18/09/2023.
//

import Foundation
import Combine

class AlbumViewModel: ObservableObject {
    let repository: AlbumRepository
    @Published var albums: [AlbumModel] = []
    var cancellable = Set<AnyCancellable>()
    
    init(repository: AlbumRepository, cancellable: Set<AnyCancellable> = Set<AnyCancellable>()) {
        self.repository = repository
        self.cancellable = cancellable
    }
    
    func fetchAlbums() {
        repository.getAlbums()
            .receive(on: DispatchQueue.main)
            .sink{ completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Failed to fetch todos: \(error)")
                }
            } receiveValue: { [weak self] album in
                self?.albums = album
            }.store(in: &cancellable)
    }
    
    func updateAlbum(id: Int, title: String) {
        guard let newAlbumEntity = repository.updateAlbum(id: id, title: title) else { return }
        
        if let index = albums.firstIndex(where: { $0.id == id }) {
            let newAlbum = AlbumModel(albumEntity: newAlbumEntity)
            albums[index] = newAlbum
        }
    }
}
