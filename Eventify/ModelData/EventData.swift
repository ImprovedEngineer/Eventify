//
//  EventData.swift
//  Eventify
//
//  Created by Mathias Girouard on 2021-06-29.
//

import SwiftUI

struct EventData: Identifiable {
    var id = UUID().uuidString
    var title: String
    var time: Date
    var location: String
    var category: String
    var detail: String
    var type: String
    var members:[String]
}

var membersList = [
    "Robin Girouard",
    "Mathias Girouard",
    "Patrick Girouard",
    "Eugenie Girouard",
    "Felix Girouard",
    "Pierre Girouard",
    "Margot Girouard",
    "Marc Girouard",
    "Jean Girouard",
    "Paul Girouard"
]

class EventViewModel: ObservableObject{
    
    @Published var addNewEvent = false
    
    @Published var events = [
        EventData(title: "Wild Cats Hockey", time: Date(), location: "Address of this location", category: "Sport event", detail: "Information about this event", type: "Public", members: membersList),
        EventData(title: "Sing along", time: Date(), location: "Address of this location", category: "Bar", detail: "Information about this event", type: "Public", members: membersList),
        EventData(title: "Soccer game", time: Date(), location: "Address of this location", category: "Sport event", detail: "Information about this event", type: "Public", members: membersList),
        EventData(title: "Star Wars", time: Date(), location: "Address of this location", category: "Movie", detail: "Information about this event", type: "Public", members: membersList),
        EventData(title: "Baseball game", time: Date(), location: "Address of this location", category: "Sport event", detail: "Information about this event", type: "Private", members: membersList),
        EventData(title: "Basket Ball game", time: Date(), location: "Address of this location", category: "Sport event", detail: "Information about this event", type: "Public", members: membersList),
        EventData(title: "Ariana Grande", time: Date(), location: "Address of this location", category: "Concert", detail: "Information about this event", type: "Public", members: membersList),
        EventData(title: "Curling", time: Date(), location: "Address of this location", category: "Sport event", detail: "Information about this event", type: "Public", members: membersList),
        EventData(title: "La brousaille", time: Date(), location: "Address of this location", category: "Strip Club", detail: "Information about this event", type: "Public", members: membersList),
        EventData(title: "Hockey Canadiens Final", time: Date(), location: "Address of this location", category: "Sport event", detail: "Information about this event", type: "Public", members: membersList),
        EventData(title: "DJ night", time: Date(), location: "Address of this location", category: "Night Club", detail: "Information about this event", type: "Private", members: membersList)
    ]
}
