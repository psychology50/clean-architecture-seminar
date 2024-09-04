//
//  UserProfileView.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/5/24.
//

import SwiftUI

struct UserProfileView: View {
    
    @StateObject var viewModelWrapper = UserProfileViewModelWrapper()
    
    var body: some View {
        VStack {
            Circle()
                .frame(width: 100, height: 100)
            
    
            Text(viewModelWrapper.viewModel.userData.name)
            
            
            Button(action: {
                Log.debug(viewModelWrapper.viewModel.userData.name)
            }, label: {
                Text("이름 수정하기")
            })
            
            HStack {
                VStack {
                    Text("0")
                    Text("게시물")
                }
                VStack {
                    Text("0")
                    Text("팔로워")
                }
                VStack {
                    Text("0")
                    Text("팔로잉")
                }
            }
        }
        .onAppear {
            viewModelWrapper.viewModel.viewWillAppear()  // 화면이 나타날 때 데이터 로드
        }
    }
}

final class UserProfileViewModelWrapper: ObservableObject {
    @Published var viewModel: UserProfileViewModel

    init() {
        let repository = DefaultUserProfileRepository()
        let fetchUserProfileUseCase = DefaultFetchUserProfileUseCase(repository: repository)
        let viewModel = DefaultUserProfileViewModel(fetchUserProfileUseCase: fetchUserProfileUseCase)
        self.viewModel = viewModel
    }
}
