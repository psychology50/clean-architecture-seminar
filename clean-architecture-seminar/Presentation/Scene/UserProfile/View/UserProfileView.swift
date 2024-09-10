//
//  UserProfileView.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/5/24.
//

import SwiftUI

struct UserProfileView<Model>: View where Model: UserProfileViewModelWrapper{
    
    @ObservedObject var viewModelWrapper: Model
    
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
    
    init(viewModel: UserProfileViewModel) {
        self.viewModel = viewModel
        self.userData = viewModel.userData
    }
}
