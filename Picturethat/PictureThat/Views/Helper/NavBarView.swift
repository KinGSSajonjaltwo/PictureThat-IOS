//
//  NavBarView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/05/06.
//

import SwiftUI

struct NavBarView: View {
    @Environment(\.presentationMode) var presentationMode
    var navBarTitle: String
    
    var body: some View {
        HStack{
            
            backButton
            
            Spacer()
            
            Text(navBarTitle)
                .font(.navBarText)
                .foregroundColor(.mainTextColor)
            
            Spacer()
            
            backButton.opacity(0)
            
        }
        .padding()
        .background(Color.white.ignoresSafeArea(edges: .top))
    }
}

struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarView(navBarTitle: "카드팩 둘러보기")
    }
}

extension NavBarView{
    private var backButton: some View{
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.backward")
                .foregroundColor(.mainTextColor)
                .frame(width: 44, height: 44)
        }
    }
}
