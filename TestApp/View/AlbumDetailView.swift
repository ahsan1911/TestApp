//
//  AlbumDetailView.swift
//  TestApp
//
//  Created by Mohamed Anas on 18/09/2023.
//

import SwiftUI

struct AlbumDetailView: View {
   
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AlbumViewModel
  
    @FocusState private var isFocused: Bool
    
    @State private var albumTitle = ""
    @State private var isEditablle = false
    @State private var showAlert = false
    
    let album: AlbumModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Album Id").font(.headline)
            Text("\(album.id)").font(.body)
            HStack {
                Text("Album Title").font(.headline)
                Button {
                    isEditablle.toggle()
                } label: {
                    Image(systemName: "pencil")
                }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            }
            if isEditablle { TextField("Enter Title", text: $albumTitle, axis: .vertical).focused($isFocused).lineLimit(5).textFieldStyle(.roundedBorder).border(Color.gray) }
            else { Text(albumTitle).font(.body) }
            AsyncImage(
                url: URL(string: album.url),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                },
                placeholder: {
                    ProgressView()
                }
            )
            Spacer()
        }
        .padding()
        .onAppear{
            albumTitle = album.title
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                        Text("Back")
                    }
                }

            }
            if isEditablle {
                ToolbarItem {
                    Button("Save") {
                        viewModel.updateAlbum(id: album.id, title: albumTitle)
                        isFocused = false
                        showAlert = true
                    }.alert("Album has been updated", isPresented: $showAlert){
                        Button("Ok", role: .cancel){
                            showAlert = false
                        }
                    }
                }
            }
        }
    }
}

/*struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView()
    }
}*/
