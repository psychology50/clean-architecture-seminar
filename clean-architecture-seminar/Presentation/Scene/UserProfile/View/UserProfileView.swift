//
//  UserProfileView.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/5/24.
//

import SwiftUI
import Combine

struct UserProfileView: View {
    
    @StateObject var viewModelWrapper = UserProfileViewModelWrapper()
    
    var body: some View {
        VStack {
            Circle()
                .frame(width: 100, height: 100)
            
    
            Text(viewModelWrapper.userData.name)
            
            
            Button(action: {
                Log.debug(viewModelWrapper.userData.name)
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
            Spacer()
        }
        .onAppear {
            viewModelWrapper.viewModel.viewWillAppear()
        }
    }
}

/// `DefaultUserProfileViewModel`의 `userData` 변화를 관찰하여 UI가 자동으로 업데이트되도록 하는 클래스
final class UserProfileViewModelWrapper: ObservableObject {
    @Published var userData: UserModel  // 외부에서 관찰될 userData
    var viewModel: UserProfileViewModel
    
    private var cancellables = Set<AnyCancellable>() // Combine의 구독을 관리할 Set
    
    init() {
        let repository = DefaultUserProfileRepository()
        let fetchUserProfileUseCase = DefaultFetchUserProfileUseCase(repository: repository)
        let viewModel = DefaultUserProfileViewModel(fetchUserProfileUseCase: fetchUserProfileUseCase)
        self.viewModel = viewModel
        self.userData = viewModel.userData
        
        // viewModel의 userData가 변경될 때마다 userData 업데이트
        viewModel.$userData
            .sink { [weak self] newUserData in
                self?.userData = newUserData
            }
            .store(in: &cancellables)
    }
}
