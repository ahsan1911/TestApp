//
//  AlbumModel\.swift
//  TestApp
//
//  Created by Mohamed Anas on 18/09/2023.
//

import Foundation
import CoreData

struct AlbumModel: Identifiable, Codable {
    let albumId, id: Int
    let title: String
    let url, thumbnailUrl: String
    
    init(albumEntity: AlbumEntity) {
        id = Int(albumEntity.id)
        albumId = Int(albumEntity.albumId)
        title = albumEntity.title ?? ""
        url = albumEntity.url ?? ""
        thumbnailUrl = albumEntity.thumbnailUrl ?? ""
    }
}
