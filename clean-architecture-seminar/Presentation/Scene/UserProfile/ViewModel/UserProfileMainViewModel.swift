//
//  UserProfileMainViewModel.swift
//  clean-architecture-seminar
//
//  Created by 아우신얀 on 9/4/24.
//

import Foundation

protocol UserProfileMainInput {
    func start()
}

protocol UserProfileMainOutput {
    var userData: [UserData] { get }
}

protocol UserProfileMainViewModel: UserProfileMainInput, UserProfileMainOutput { }

final class DefaultUserProfileMainViewModel: UserProfileMainViewModel {
    var userData: [UserData] = []
    
    
}

extension DefaultUserProfileMainViewModel {
    func start() {
        <#code#>
    }
}


