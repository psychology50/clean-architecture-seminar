//
//  NameEditView.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/12/24.
//

import SwiftUI

struct NameEditView: View{
    
    @ObservedObject var viewModelWrapper: UserProfileViewModelWrapper
    @State private var newName = ""

    var body: some View {
        VStack {
            Circle()
                .frame(width: 100, height: 100)

            TextField("이름을 입력하세요", text: $newName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                viewModelWrapper.viewModel.updateData(newName)
            }, label: {
                Text("이름 수정 완료")
            })
            
            Spacer()
        }
    }
}
