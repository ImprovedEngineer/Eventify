//
//  ProfileView.swift
//  Eventify
//
//  Created by Mathias Girouard on 2021-05-18.
//

import SwiftUI

struct ProfileView: View {
    
    @State var selectedTab = "person"
    @State var showSettings = false
    
    var body: some View {
        VStack{
            HStack{
                
                Button(action: {
                    showSettings.toggle()
                }, label: {
                    Image(systemName: "gear").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.primary)
                })
                .fullScreenCover(isPresented: $showSettings, content: SettingsView.init)
                
                Spacer()
                
                Button(action: {
                    //offset = rect.width
                }, label: {
                    Image(systemName: "bell").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.primary)
                })
            }
            .padding()
            .overlay(Text("Profile").font(.system(size: 25)).fontWeight(.bold))
            
            Image("ProfilePicture").resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).frame(width: 150, height: 150, alignment: .top).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            Button("Edit profile"){
                
            }
            
            TabView(selection: $selectedTab){
                
                ProfileInfoView().padding(.top,edges?.top).tag("person")
                
                ProfileEventView().padding(.top,edges?.top).tag("textbox")
            }
            .padding()
        }
        .overlay(
            VStack(){
                HStack(spacing: 0){
                    TabBarButton(image: "person", selectedTab: $selectedTab).frame(maxWidth: .infinity)
                    
                    TabBarButton(image: "textbox", selectedTab: $selectedTab).frame(maxWidth: .infinity)
                }
            }
        )
    }
}

struct ProfileInfoView: View {
    var body: some View {
        ScrollView{
            Text("Name:")
            Text("Username:")
            Text("About:")
        }
    }
}

struct ProfileEventView: View {
    var body: some View {
        Text("Events:")
        List{
            Text("Event")
            Text("Event")
            Text("Event")
            Text("Event")
            Text("Event")
            Text("Event")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
