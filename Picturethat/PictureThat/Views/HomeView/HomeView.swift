//
//  HomeView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/05/02.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("사진그거")
                    .padding()
                NavigationLink(
                    destination: DeckSelectionView(),
                    label: {
                        Text("포즈 카드팩 둘러보기")
                    })
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
