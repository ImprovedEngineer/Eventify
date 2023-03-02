//
//  TicketView.swift
//  Eventify
//
//  Created by Mathias Girouard on 2021-06-29.
//

import SwiftUI

struct TicketView: View {
    
    @State var searchQuery = ""
    @StateObject var eventModel = EventViewModel()
    @State var showTicket: Bool = false
    @State var clickedEvent: EventData
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
            .overlay(Text("Tickets").font(.system(size: 25)).fontWeight(.bold))
            
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
                ForEach(searchQuery == "" ? eventModel.events : eventModel.events.filter{$0.title.lowercased().contains(searchQuery.lowercased())}){
                    events in
                    Button(action: {
                        self.showTicket.toggle()
                        clickedEvent = events
                    },
                           label: {
                            //EventViewList(event: events)
                    })
                }
            }
        }
        .overlay(EventViewTicket(clickedEvent: self.$clickedEvent, showTicket: self.$showTicket))
    }
}

/*struct EventViewList: View {
    var event: EventData
    var body: some View {
        
        HStack(spacing: 15){
            if #available(iOS 15.0, *) {@State var showPrivacy: Bool = false@State var showPrivacy: Bool = false@State var showPrivacy: Bool = false@State var showPrivacy: Bool = false@State var showPrivacy: Bool = false
                VStack(spacing: 20){
                    HStack(alignment: .top){
                        VStack(alignment: .leading, spacing: 12){
                            Text(event.title).font(.title2.bold()).foregroundColor(.black)
                            let time = event.time.formatted(date: .omitted, time: .shortened)
                            
                            let date = event.time.formatted(date: .abbreviated, time: .omitted)
                            
                            Text("\(time), \(date)").font(.caption).foregroundColor(.black)
                            Text(event.location).font(.caption).foregroundColor(.black)
                        }
                        
                        Spacer(minLength: 0)
                        
                        VStack{
                            Spacer(minLength: 30)
                            Image(systemName: "chevron.right").foregroundColor(.black)
                        }
                    }
                }
                .padding()
                .background(Color.black.opacity(0.2), in: RoundedRectangle(cornerRadius: 10))
            } else {
                // Fallback on earlier versions
            }
        }
        .padding(.vertical, 5)
        .padding(.horizontal)
    }
}*/

struct EventViewTicket: View {
    
    @Binding var clickedEvent: EventData
    @Binding var showTicket: Bool
    
    var body: some View {
        if showTicket{
            Rectangle().fill(.white).ignoresSafeArea()
            VStack{
                HStack{
                    Button(action: {
                        self.showTicket.toggle()},
                           label: {
                        Image(systemName: "chevron.left").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.black).padding()
                        Spacer()
                    })
                }
                
                Image(systemName: "qrcode").resizable().frame(width: 200, height: 200, alignment: .center)
                
                VStack(alignment: .leading, spacing: 12){
                    Text(clickedEvent.title).font(.title3.bold()).foregroundColor(.black)
                    if #available(iOS 15.0, *) {
                        let time = clickedEvent.time.formatted(date: .omitted, time: .shortened)
                        let date = clickedEvent.time.formatted(date: .abbreviated, time: .omitted)
                        
                        Text("\(time), \(date)").font(.title3).foregroundColor(.black)
                    } else {
                        // Fallback on earlier versions
                    }
        
                    Text(clickedEvent.location).font(.title3).foregroundColor(.black)
                }
            }
        }
    }
}
