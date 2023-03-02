//
//  Home.swift
//  Eventify
//
//  Created by Mathias Girouard on 2021-05-18.
//

import SwiftUI

struct Home: View {
    
    @State var selectedTab = "globe"
    @Environment(\.colorScheme) var scheme
    @Binding var offset: CGFloat
    @Binding var event: EventData
    
    var body: some View {
        
        TabView(selection: $selectedTab){
            
            FeedView(offset: $offset).padding(.top,edges?.top).tag("globe")
            
            CreateEventView(clickedEvent: event).padding(.top,edges?.top).tag("plus.square")
            
            TicketView(clickedEvent: event, offset: $offset).padding(.top,edges?.top).tag("ticket")
            
            FriendsView().padding(.top,edges?.top).tag("person.2")
            
            ProfileView().padding(.top,edges?.top).tag("person")
        }
        .overlay(
            VStack(spacing: 12){
                Divider().padding(.horizontal, -15)
                
                HStack(spacing: 0){
                    TabBarButton(image: "globe", selectedTab: $selectedTab).frame(maxWidth: .infinity)
                    
                    TabBarButton(image: "plus.square", selectedTab: $selectedTab).frame(maxWidth: .infinity)
                    
                    TabBarButton(image: "ticket", selectedTab: $selectedTab).frame(maxWidth: .infinity)
                    
                    TabBarButton(image: "person.2", selectedTab: $selectedTab).frame(maxWidth: .infinity)
                    
                    TabBarButton(image: "person", selectedTab: $selectedTab).frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal)
            .padding(.bottom,edges?.bottom ?? 15)
            .background(scheme == .dark ? Color.black : Color.white)
        
            ,alignment: .bottom
        )
        .ignoresSafeArea()
    }
}

struct TabBarButton: View {
    var image: String
    @Binding var selectedTab: String
    
    var body: some View{
        Button(action: {
            selectedTab = image
        }, label: {
            Image(systemName: image).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(selectedTab == image ? .primary : .gray)
        })
    }
}
