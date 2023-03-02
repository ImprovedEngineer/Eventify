//
//  FriendsView.swift
//  Eventify
//
//  Created by Mathias Girouard on 2021-06-29.
//

import SwiftUI

//Main view
struct FriendsView: View {
    @State private var showAddFriend = false
    @State var searchQuery = ""
    
    var body: some View {
        VStack{
            HStack{
                
                Spacer()
                
                Spacer()
                
                Button(action: {
                    //offset = rect.width
                }, label: {
                    Image(systemName: "bell").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.primary)
                })
            }
            .padding()
            .overlay(Text("Friends").font(.system(size: 25)).fontWeight(.bold))
            
            Button("Add a friend"){
                showAddFriend.toggle()
            }
            .fullScreenCover(isPresented: $showAddFriend, content: AddAFriendView.init)
            
            VStack{
                HStack(spacing: 15){
                    Image(systemName: "magnifyingglass").font(.system(size: 23, weight: .bold)).foregroundColor(.gray)
                    TextField("Search...", text: $searchQuery)
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(Color.gray.opacity(0.05))
                .cornerRadius(8)
                .padding()
            }
            
            ScrollView{
                ForEach(searchQuery == "" ? friends : friends.filter{$0.name.lowercased().contains(searchQuery.lowercased())}){
                    friends in AddedFriendView(user: friends)
                }
            }
        }
    }
}

//View for each button in FriendsView
struct AddedFriendView: View {
    @State private var isMoreShowing = false
    @State private var isInviteShowing = false
    @State var user: FriendsData
    @State var showClickedUser: Bool = false
    
    var body: some View {
        VStack{
            HStack(spacing: 15){
                Button(action: {
                    showClickedUser.toggle()
                }, label: {
                    Image(systemName: user.image).resizable().aspectRatio(contentMode: .fill).frame(width: 60, height: 60).clipShape(Circle()).foregroundColor(.black)
                    
                    VStack(alignment: .leading, spacing: 8, content: {
                        Text(user.name).fontWeight(.bold).foregroundColor(.black)
                        
                        Text(user.detail).font(.caption).foregroundColor(.gray)
                    }).frame(maxWidth: .infinity, alignment: .leading)
                })
                
                Button(action: {
                    isInviteShowing.toggle()
                }, label: {
                    HStack{
                        Text("Invite")
                        Image(systemName: "arrow.turn.up.right")
                    }.foregroundColor(.blue).padding().background(Color.blue.opacity(0.2)).cornerRadius(8)
                }).sheet(isPresented: $isInviteShowing){
                    inviteUser()
                }
                
                Button(action: {
                    isMoreShowing.toggle()
                }, label: {
                    Image(systemName: "ellipsis").foregroundColor(.blue).padding().background(Color.blue.opacity(0.2)).clipShape(Circle())
                }).padding(.trailing, -5).actionSheet(isPresented: $isMoreShowing){
                    ActionSheet(title: Text(user.name), buttons: [.default(Text("Remove Friend")){}, .cancel()])
                }
            }
            .padding(.horizontal)
        }
        //.overlay(clickedUser(user: self.user, showClickedUser: self.showClickedUser))
    }
}

struct inviteUser: View {
    //var name: String
    //var person: FriendsData
    
    var body: some View{
        Text("Invite someone")
    }
}

//View when "Add a friend" is clicked
struct AddAFriendView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var searchQuery = ""
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        
        HStack{
            
            Image(systemName: "chevron.down").font(.title).foregroundColor(.primary).onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
            
            Spacer()
            
            Spacer()
        }
        .padding()
        .overlay(Text("Add a friend").font(.system(size: 25)).fontWeight(.bold))
        
        VStack{
            HStack(spacing: 15){
                Image(systemName: "magnifyingglass").font(.system(size: 23, weight: .bold)).foregroundColor(.gray)
                TextField("Search...", text: $searchQuery)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color.gray.opacity(0.05))
            .cornerRadius(8)
            .padding()
        }
        
        ScrollView{
            ForEach(searchQuery == "" ? friends : friends.filter{$0.name.lowercased().contains(searchQuery.lowercased())}){
                friends in AddFriendView(friend: friends)
            }
        }
    }
}

//View for each button in AddAFriendView
struct AddFriendView: View {
    var friend: FriendsData
    
    var body: some View {
        HStack(spacing: 15){
            Button(action: {}, label: {
                Image(systemName: friend.image).resizable().aspectRatio(contentMode: .fill).frame(width: 60, height: 60).clipShape(Circle()).foregroundColor(.black)
                
                VStack(alignment: .leading, spacing: 8, content: {
                    Text(friend.name).fontWeight(.bold).foregroundColor(.black)
                    
                    Text(friend.detail).font(.caption).foregroundColor(.gray)
                }).frame(maxWidth: .infinity, alignment: .leading)
            })
            
            Button(action: {}, label: {
                Image(systemName: "person.badge.plus").foregroundColor(.blue).padding().background(Color.blue.opacity(0.2)).clipShape(Circle())
            }).padding()
        }
        .padding(.horizontal)
    }
}

/*struct clickedUser: View {
    
    Binding var user: FriendsData
    Binding var showClickedUser: Bool
    
    var body: some View{
        if showClickedUser{
            Text("HERE").font(.title).bold()
        }
    }
}*/
