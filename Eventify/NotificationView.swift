//
//  NotificationView.swift
//  Eventify
//
//  Created by Mathias Girouard on 2021-06-24.
//

import SwiftUI

struct NotificationView: View {
    
    @Binding var offset: CGFloat
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    offset = 0
                }, label: {
                    Image(systemName: "chevron.backward").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.primary)
                }).padding()
                
                Spacer()
                
                Spacer()
                
            }
            .overlay(Text("Notifications").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold))
            .padding(.top, 50)
            .padding(.bottom, 10)
            
            ScrollView{
                ForEach(notifications){
                    notifications in notificationManagerView(notification: notifications)
                }
            }
        }
    }
}

struct notificationManagerView : View{
    var notification : NotificationData
    
    var body: some View{
        if(notification.type == "friendReq"){
            HStack(spacing: 15){
                Button(action: {}, label: {
                    HStack{
                        Image(systemName: "person").foregroundColor(.black)
                        Text(notification.name).fontWeight(.bold).foregroundColor(.black) + Text(" has added you as friend").fontWeight(.bold).foregroundColor(.black)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                })
            }
            .padding(.vertical, 5)
            .padding(.horizontal)
        }
        else if(notification.type == "invite"){
            HStack(spacing: 15){
                Button(action: {}, label: {
                    HStack{
                        Image(systemName: "sportscourt").foregroundColor(.black)
                        Text(notification.name).fontWeight(.bold).foregroundColor(.black) + Text(" has invited you to an event").fontWeight(.bold).foregroundColor(.black)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                })
            }
            .padding(.vertical, 5)
            .padding(.horizontal)
        }
    }
}
