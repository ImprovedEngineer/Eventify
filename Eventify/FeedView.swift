//
//  FeedView.swift
//  Eventify
//
//  Created by Mathias Girouard on 2021-05-18.
//

import SwiftUI

struct FeedView: View {
    @Binding var offset: CGFloat
    var body: some View {
        VStack{
            HStack{
                
                Spacer()
                
                Spacer()
                
                Button(action: {
                    offset = rect.width
                }, label: {
                    Image(systemName: "bell").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.primary)
                })
            }
            .padding()
            .overlay(Text("Eventify").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold))
            
            SearchBar(text: .constant(""))
            MapView()
        }
    }
}
