//
//  AppDIContainer.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/10/24.
//
import Foundation

final class AppDIContainer {
    
//    lazy var appConfiguration = AppConfiguration()
    
    // MARK: - Network
    lazy var apiDataTransferService: DataTransferService = {
//        let config = ApiDataNetworkConfig(
//            baseURL: URL(string: appConfiguration.apiBaseURL)!,
//            queryParameters: [
//                "api_key": appConfiguration.apiKey,
//                "language": NSLocale.preferredLanguages.first ?? "en"
//            ]
//        )
//        
//        let apiDataNetwork = DefaultNetworkService(config: config)
        return DefaultDataTransferService()
    }()
    
    // MARK: - DIContainers of scenes
    func makeProfileSceneDIContainer() -> ProfileSceneDIContainer {
        let dependencies = ProfileSceneDIContainer.Dependencies(
            apiDataTransferService: apiDataTransferService
        )
        return ProfileSceneDIContainer(dependencies: dependencies)
    }
}
