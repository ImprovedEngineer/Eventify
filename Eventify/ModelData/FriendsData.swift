//
//  FriendsData.swift
//  Eventify
//
//  Created by Mathias Girouard on 2021-06-29.
//

import SwiftUI

struct FriendsData: Identifiable {
    var id = UUID().uuidString
    var name: String
    var detail: String
    var image: String
}

var friends = [
    FriendsData(name: "Robin Hood", detail: "Something", image: "person"),
    FriendsData(name: "Pierre Trudeau", detail: "Something", image: "person"),
    FriendsData(name: "Felix Fitzgerald", detail: "Something", image: "person"),
    FriendsData(name: "Poppy Robbie", detail: "Something", image: "person"),
    FriendsData(name: "Bradley Cooper", detail: "Something", image: "person"),
    FriendsData(name: "Gerard Richard", detail: "Something", image: "person"),
    FriendsData(name: "Joshua Bell", detail: "Something", image: "person"),
    FriendsData(name: "Margo Robbie", detail: "Something", image: "person"),
    FriendsData(name: "Henry Ferrari", detail: "Something", image: "person"),
    FriendsData(name: "Jesus Christ", detail: "Something", image: "person")
]
