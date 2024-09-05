//
//  ProfileMainView.swift
//  clean-architecture-seminar
//
//  Created by 아우신얀 on 9/4/24.
//

import SwiftUI

struct ProfileMainView: View {
    @StateObject var viewModel = DefaultUserProfileMainViewModel(getUserData: DefaultGetUserDataUseCase())

    var body: some View {
        NavigationStack {
            ZStack(alignment: .leading) {
                if let userProfileItem = viewModel.userProfileItem {

                    VStack(spacing: 10) {
                        Image("icon_illust_no image_no margin")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 81, height: 81, alignment: .leading)
                        
                        Text("\(userProfileItem.name)")
                        
                        // 이름 수정하기 버튼
                        Button(action: {
                            
                        }, label: {
                            HStack(alignment: .center, spacing: 8) {
                                Text("이름 수정하기")
                            }
                            .padding(.horizontal, 9)
                            .padding(.vertical, 6)
                            .background(.orange)
                            .cornerRadius(5)
                        })
                    }
                    
                    Spacer().frame(height: 28)
                    
                    // 팔로잉, 팔로워, 내 게시글
                    HStack {
                        VStack {
                            Text("0")
                            
                            Text("게시글")
                        }
                        .padding(.horizontal, 34)
                        
                        Divider()
                            .frame(height: 40)
                        
                        VStack {
                            Text("0")
                            
                            Text("팔로워")
                        }
                        .padding(.horizontal, 34)
                        
                        Divider()
                            .frame(height: 40)
                        
                        VStack {
                            Text("0")
                            
                            Text("팔로잉")
                        }
                        .padding(.horizontal, 34)
                    }
                    
                }
            }
        }
        .navigationTitle("\(viewModel.userProfileItem?.username)")
        .onAppear {
            viewModel.start() //사용자 정보 불러옴
        }
    }
}

#Preview {
    ProfileMainView()
}
