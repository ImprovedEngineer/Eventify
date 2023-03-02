//
//  NotificationData.swift
//  Eventify
//
//  Created by Mathias Girouard on 2021-06-30.
//

import SwiftUI

struct NotificationData: Identifiable {
    var id = UUID().uuidString
    var type: String
    var name: String
}

var notifications = [
    NotificationData(type: "friendReq", name: "Robin Hood"),
    NotificationData(type: "friendReq", name: "Pierre Trudeau"),
    NotificationData(type: "invite", name: "Robin Hood"),
    NotificationData(type: "friendReq", name: "Joshua Bell"),
    NotificationData(type: "invite", name: "Robin Hood"),
    NotificationData(type: "friendReq", name: "Bradley Cooper"),
    NotificationData(type: "friendReq", name: "Margo Robbie"),
    NotificationData(type: "invite", name: "Henri Ferrari")
]
