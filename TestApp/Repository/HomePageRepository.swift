//
//  HomePageRepository.swift
//  TestApp
//
//  Created by Mohamed Anas on 21/09/2023.
//

import Foundation
import Combine

protocol HomePageRepositoryProtocol {
    func getHomePageData() -> AnyPublisher<HomePageModel,Error>
}

class HomePageRepository: HomePageRepositoryProtocol {
   
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getHomePageData() -> AnyPublisher<HomePageModel, Error> {
        networkService.getJsonRespons()
            .map{ homePageModel in
                return homePageModel
            }
            .eraseToAnyPublisher()
    }
    
}
