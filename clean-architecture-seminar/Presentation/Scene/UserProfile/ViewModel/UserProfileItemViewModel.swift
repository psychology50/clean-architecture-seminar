//
//  UserProfileItemViewModel.swift
//  clean-architecture-seminar
//
//  Created by 아우신얀 on 9/4/24.
//

import Foundation

struct UserProfileItemViewModel: Equatable {
    var username: String //사용자 아이디
    var name: String //사용자 이름
}

extension UserProfileItemViewModel {
    init(userData: UserData) {
        self.username = userData.username
        self.name = userData.name 
    }
}
