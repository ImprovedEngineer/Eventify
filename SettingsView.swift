//
//  SettingsView.swift
//  Eventify
//
//  Created by Mathias Girouard on 2021-05-18.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var showPrivacy: Bool = false
    @State var showPayments: Bool = false
    @State var showSecurity: Bool = false
    @State var showAccount: Bool = false
    @State var showNotifications: Bool = false
    @State var showHelp: Bool = false
    @State var showAbout: Bool = false
    
    var body: some View {
        HStack{
            
            Image(systemName: "chevron.down").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.primary).onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
            
            Spacer()
            
            Spacer()
            
            
        }
        .padding()
        .overlay(Text("Settings").font(.system(size: 25)).fontWeight(.bold))
    
        ScrollView{
            
            Button{
                withAnimation{
                    
                }
            } label: {
                HStack{
                    VStack(alignment: .leading, spacing: 12){
                        Text("Privacy").font(.title2.bold()).foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Image(systemName: "chevron.right").foregroundColor(.black)
                    }
                }
                .padding()
            }
            
            Button{
                withAnimation{
                    
                }
            } label: {
                HStack{
                    VStack(alignment: .leading, spacing: 12){
                        Text("Payments").font(.title2.bold()).foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Image(systemName: "chevron.right").foregroundColor(.black)
                    }
                }
                .padding()
            }
        
            Button{
                withAnimation{
                    
                }
            } label: {
                HStack{
                    VStack(alignment: .leading, spacing: 12){
                        Text("Security").font(.title2.bold()).foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Image(systemName: "chevron.right").foregroundColor(.black)
                    }
                }
                .padding()
            }
            
            Button{
                withAnimation{
                    
                }
            } label: {
                HStack{
                    VStack(alignment: .leading, spacing: 12){
                        Text("Account").font(.title2.bold()).foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Image(systemName: "chevron.right").foregroundColor(.black)
                    }
                }
                .padding()
            }
            
            Button{
                withAnimation{
                    
                }
            } label: {
                HStack{
                    VStack(alignment: .leading, spacing: 12){
                        Text("Notification").font(.title2.bold()).foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Image(systemName: "chevron.right").foregroundColor(.black)
                    }
                }
                .padding()
            }
            
            Button{
                withAnimation{
                    //eventModel.addNewEvent.toggle()
                }
            } label: {
                HStack{
                    VStack(alignment: .leading, spacing: 12){
                        Text("Help").font(.title2.bold()).foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Image(systemName: "chevron.right").foregroundColor(.black)
                    }
                }
                .padding()
            }
            
            Button{
                withAnimation{
                    //eventModel.addNewEvent.toggle()
                }
            } label: {
                HStack{
                    VStack(alignment: .leading, spacing: 12){
                        Text("About").font(.title2.bold()).foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Image(systemName: "chevron.right").foregroundColor(.black)
                    }
                }
                .padding()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
