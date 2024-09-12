//
//  UserProfileView.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/5/24.
//

import SwiftUI

struct UserProfileView: View{
    
    @ObservedObject var viewModelWrapper: UserProfileViewModelWrapper
    @State private var showNameEditView = false
    
    var body: some View {
        NavigationView{
            VStack {
                Circle()
                    .frame(width: 100, height: 100)
                
                Text(viewModelWrapper.userData.name)
                
                Button(action: {
                    showNameEditView = true
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
            .navigate(to: NameEditView(viewModelWrapper: viewModelWrapper), when: $showNameEditView) // navigate 사용
        }
    }
}

/// `DefaultUserProfileViewModel`의 `userData` 변화를 관찰하여 UI가 자동으로 업데이트되도록 하는 클래스
final class UserProfileViewModelWrapper: ObservableObject {
    @Published var userData: UserProfileItemModel
    var viewModel: any UserProfileViewModel
    
    init(viewModel: any UserProfileViewModel) {
        self.viewModel = viewModel
        self.userData = viewModel.userData.value
        
        // Observable을 통해 userData 변화를 감지하고 업데이트
        viewModel.userData.observe(on: self) { [weak self] newUserData in
            self?.userData = newUserData
        }
    }
}

