//
//  AppDIContainer.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/10/24.
//
import Foundation

final class AppDIContainer: ObservableObject{
//    lazy var appConfiguration = AppConfiguration()
    
    // MARK: - Network
    lazy var apiDataTransferService: DataTransferService = {
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
