//
//  MainView.swift
//  Eventify
//
//  Created by Mathias Girouard on 2021-05-18.
//

import SwiftUI

struct MainView: View {
    
    @State var offset: CGFloat = 0
    @State var event: EventData = EventData(title: "", time: Date(), location: "", category: "", detail: "", type: "", members: [""])
    
    var body: some View {
        GeometryReader{reader in
            
            let frame = reader.frame(in: .global)
            
            ScrollableTabBar(tabs: ["",""], rect: frame, offset: $offset){
                Home(offset: $offset, event: $event)
                NotificationView(offset: $offset)
            }
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
