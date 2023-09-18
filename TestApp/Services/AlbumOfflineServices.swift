//
//  AlbumOfflineServices.swift
//  TestApp
//
//  Created by Mohamed Anas on 18/09/2023.
//

import Foundation
import Combine
import CoreData

protocol AlbumOfflineServicesProtocol {
    func getAlbums() -> AnyPublisher<[AlbumModel],Error>
    func saveAlbums(albums: [AlbumModel])
    func updateAlbum(id: Int, title: String) -> AlbumEntity?
    func fetchSingleAlbum(id: Int) -> AlbumEntity?
}

class AlbumOfflineServices: AlbumOfflineServicesProtocol {
    let persistenContainer: NSPersistentContainer
    
    init(persistenContainer: NSPersistentContainer) {
        self.persistenContainer = persistenContainer
    }
    
    
    func getAlbums() -> AnyPublisher<[AlbumModel], Error> {
        let request: NSFetchRequest<AlbumEntity> = AlbumEntity.fetchRequest()
        let context = persistenContainer.viewContext
        
        return Future<[AlbumModel],Error> { promise in
            do {
                let albumEntities = try context.fetch(request)
                let albums = albumEntities.map{ AlbumModel(albumEntity: $0) }
                promise(.success(albums))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func saveAlbums(albums: [AlbumModel]) {
        let context = persistenContainer.newBackgroundContext()
        context.performAndWait {
            do {
                let request: NSFetchRequest<AlbumEntity> = AlbumEntity.fetchRequest()
                let albumEntities = try context.fetch(request)
                let albumIds = albumEntities.compactMap{ Int($0.id) }
                
                albums.forEach { album in
                    if !albumIds.contains(album.id) {
                        let albumEntity = AlbumEntity(context: context)
                        albumEntity.id = Int64(album.id)
                        albumEntity.albumId = Int64(album.albumId)
                        albumEntity.title = album.title
                        albumEntity.url = album.url
                        albumEntity.thumbnailUrl = album.thumbnailUrl
                    }
                }
                
                try context.save()
            } catch {
                print("Failed to save todos to core data: \(error)")
            }
        }
    }
    
    func updateAlbum(id: Int, title: String) -> AlbumEntity? {
        let context = persistenContainer.viewContext
        do {
            let request: NSFetchRequest<AlbumEntity> = AlbumEntity.fetchRequest()
            request.predicate = NSPredicate(format: "id == %d", id)
            
            let albums = try context.fetch(request)
            if let firstEntity = albums.first {
                firstEntity.title = title
                try context.save()
                return firstEntity
            }
        } catch {
            print("Failed to save todos to core data: \(error)")
        }
        
        return nil
    }
    
    func fetchSingleAlbum(id: Int) -> AlbumEntity? {
        let context = persistenContainer.viewContext
        do {
            let request: NSFetchRequest<AlbumEntity> = AlbumEntity.fetchRequest()
            request.predicate = NSPredicate(format: "id == %d", id)
            
            let albums = try context.fetch(request)
            if let firstEntity = albums.first {
                return firstEntity
            }
        } catch {
            print("Failed to save todos to core data: \(error)")
        }
        
        return nil
    }

}
