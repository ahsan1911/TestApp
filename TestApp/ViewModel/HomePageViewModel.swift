//
//  HomePageViewModel.swift
//  TestApp
//
//  Created by Mohamed Anas on 21/09/2023.
//

import Foundation
import Combine

class HomePageViewModel: ObservableObject {
    
    let repository: HomePageRepository
    
    @Published var homePageModel: HomePageModel?
    
    var cancellable = Set<AnyCancellable>()
    
    init(repository: HomePageRepository, homePageModel: HomePageModel? = nil) {
        self.repository = repository
        self.homePageModel = homePageModel
    }
    
    func fetchHomePage() {
        repository.getHomePageData()
            .receive(on: DispatchQueue.main)
            .sink{ completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    break
                }
            } receiveValue: { [weak self] homePageData in
                self?.homePageModel = homePageData
            } .store(in: &cancellable)
    }
    
}
