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
            if case .LOADING = viewModel.currentState {
                loaderView()
                    .navigationTitle("Albums")
            } else if case .SUCCESS(let albums) = viewModel.currentState {
                List(albums) { album in
                    NavigationLink(destination: AlbumDetailView(album: album)) {
                        VStack{
                            Text(album.title).font(.headline)
                        }
                    }
                }
                .navigationTitle("Albums")
            } else if case .FAILURE(let error) = viewModel.currentState {
                VStack(alignment: .center) {
                    Spacer()
                    Text(error.localizedDescription)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .navigationTitle("Albums")
            }
        }
        .onAppear{
            viewModel.fetchAlbums()
        }
    }
    
    // Loader View
    func loaderView() -> some View {
        return ZStack {
            Color.black.opacity(0.05)
                .ignoresSafeArea()
            ProgressView()
                .scaleEffect(x: 1, anchor: .center)
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
        }
    }
}

/*struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView()
    }
}*/
