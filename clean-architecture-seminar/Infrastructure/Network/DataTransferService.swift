//
//  DataTransferService.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/10/24.
//

import Foundation

protocol DataTransferService {
    func requset()
}

final class DefaultDataTransferService:  DataTransferService{
    
//    private let networkService: NetworkService
//    private let errorResolver: DataTransferErrorResolver
//    private let errorLogger: DataTransferErrorLogger
//    
//    init(
//        with networkService: NetworkService,
//        errorResolver: DataTransferErrorResolver = DefaultDataTransferErrorResolver(),
//        errorLogger: DataTransferErrorLogger = DefaultDataTransferErrorLogger()
//    ) {
//        self.networkService = networkService
//        self.errorResolver = errorResolver
//        self.errorLogger = errorLogger
//    }
    func requset() {
        
    }
}
