//
//  HomePageView.swift
//  TestApp
//
//  Created by Mohamed Anas on 21/09/2023.
//

import SwiftUI

struct HomePageView: View {
    @ObservedObject var viewModel: HomePageViewModel
   
    var body: some View {
        NavigationView {
            VStack {
                Text("Home Page")
            }
        }
        .onAppear{
            viewModel.fetchHomePage()
        }
    }
}

/*struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}*/
