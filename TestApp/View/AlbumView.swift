//
//  AlbumView.swift
//  TestApp
//
//  Created by Mohamed Anas on 18/09/2023.
//

import SwiftUI

struct AlbumView: View {
    @EnvironmentObject var viewModel: AlbumViewModel
    var body: some View {
        NavigationView{
            List(viewModel.albums) { album in
                NavigationLink(destination: AlbumDetailView(album: album)) {
                    VStack{
                        Text(album.title).font(.headline)
                    }
                }
            }
            .navigationTitle("Albums")
        }
        .onAppear{
            viewModel.fetchAlbums()
        }
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView()
    }
}
