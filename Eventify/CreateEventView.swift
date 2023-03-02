//
//  CreateEventView.swift
//  Eventify
//
//  Created by Mathias Girouard on 2021-05-19.
//

import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI

struct CreateEventView: View {
    @StateObject var eventModel = EventViewModel()
    @State var showClickedEvent: Bool = false
    @State var clickedEvent: EventData
    
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
            .overlay(Text("Your Events").font(.system(size: 25)).fontWeight(.bold))
            
            HStack{
                Button{
                    withAnimation{
                        eventModel.addNewEvent.toggle()
                    }
                } label: {
                    HStack{
                        Text("CREATE NEW EVENT").font(.caption).foregroundColor(.black)
                        Image(systemName: "plus").font(.caption).foregroundColor(.black)
                    }.padding(.vertical,10).padding(.horizontal, 20).background(Capsule().stroke(.black, lineWidth: 1))
                }
                
                Button{
                    
                } label: {
                    HStack{
                        Text("SCAN TICKET").font(.caption).foregroundColor(.black)
                        Image(systemName: "qrcode.viewfinder").font(.caption).foregroundColor(.black)
                    }.padding(.vertical,10).padding(.horizontal, 40).background(Capsule().stroke(.black, lineWidth: 1))
                }
            }.padding(.vertical, 10)
            
            ScrollView(.vertical, showsIndicators: false){
                if eventModel.events.isEmpty{
                    Image("notes").resizable().aspectRatio(contentMode: .fit).frame(width: 150, height: 150)
                    
                    Text("Add **Events**").font(.title2).padding(.top)
                }
                
                ForEach($eventModel.events){ $event in
                    Button(action: {
                        self.showClickedEvent.toggle()
                        clickedEvent = event
                    },
                           label: {
                            createdEventView(event: $event)
                    })
                }
            }.padding(.horizontal, 10).padding(.bottom, 50)
        }
        .background(Color("Bg"))
        .overlay(addEvent().environmentObject(eventModel))
        .overlay(EventViewCreated(clickedEvent: self.$clickedEvent, showClickedEvent: self.$showClickedEvent))
    }
}

struct createdEventView: View {
    @Binding var event : EventData
    
    var body: some View{
        if #available(iOS 15.0, *) {
            VStack(spacing: 20){
                HStack(alignment: .top){
                    VStack(alignment: .leading, spacing: 12){
                        Text(event.title).font(.title2.bold()).foregroundColor(.black)
                        let time = event.time.formatted(date: .omitted, time: .shortened)
                        
                        let date = event.time.formatted(date: .abbreviated, time: .omitted)
                        
                        Text("\(time), \(date)").font(.caption).foregroundColor(.black)
                        Text(event.location).font(.caption).foregroundColor(.black)
                        Text("People Attending: \(event.members.count)").bold().foregroundColor(.black)
                    }
                    
                    Spacer(minLength: 0)
                    
                    VStack{
                        Spacer(minLength: 50)
                        
                        Image(systemName: "chevron.right")
                    }
                }
            }
            .padding()
            .background(Color.black.opacity(0.2), in: RoundedRectangle(cornerRadius: 10))
        } else {
            // Fallback on earlier versions
        }
    }
}

struct addEvent: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var eventModel: EventViewModel
    @State var showDatePicker = false
    @State var currentEventType = "Public"
    @State private var addressLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.7617, longitude: 80.1918), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    private var categoryArr = ["Soccer", "Hockey", "Nighclub", "Bar", "Bowling", "Baseball", "Concert", "Movies"]
    
    @State var currentEventData = EventData(title: "", time: Date(), location: "", category: "", detail: "", type: "", members: [""])
    
    var body: some View {
        
        if eventModel.addNewEvent{
            Rectangle().fill(.white).ignoresSafeArea()
            
            VStack(){
                HStack{
                    Button{
                        withAnimation{
                            eventModel.addNewEvent.toggle()
                        }
                    } label: {
                        Image(systemName: "xmark").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.black).padding()
                    }
                    
                    Spacer()
                }.overlay(Text("Create New Event").font(.system(size: 25)).fontWeight(.bold))
                
                ScrollView{
                    VStack(spacing: 20){
                        VStack(alignment: .leading, spacing: 15){
                            Text("Title").fontWeight(.semibold).foregroundColor(.black)
                            TextField("Enter Title...", text: $currentEventData.title).font(.system(size: 18).bold())
                            
                            Divider()
                            
                        }.padding(.top,10)
                        
                        VStack(alignment: .leading, spacing: 15){
                            Text("Date and Time").fontWeight(.semibold).foregroundColor(.black)
                            HStack{
                                if #available(iOS 15.0, *) {
                                    let time = currentEventData.time.formatted(date: .omitted, time: .shortened)
                                    
                                    let date = currentEventData.time.formatted(date: .abbreviated, time: .omitted)
                                    
                                    Text("\(time), \(date)").fontWeight(.bold)
                                    
                                    Spacer(minLength: 10)
                                    
                                    Button{
                                        withAnimation{
                                            showDatePicker.toggle()
                                        }
                                    } label: {
                                        Image(systemName: "calendar").foregroundColor(.black).padding(6).background(.gray, in: Circle())
                                    }
                                    
                                } else {
                                    // Fallback on earlier versions
                                }
                            }
                            
                            Divider()
                            
                        }.padding(.top,10)
                        
                        VStack(alignment: .leading, spacing: 15){
                            Text("Address").fontWeight(.semibold).foregroundColor(.black)
                            TextField("Enter Address...", text: $currentEventData.location).font(.system(size: 18).bold())
                            
                            MapView()
                            
                            Divider()
                            
                        }.padding(.top,10)
                        
                        VStack(alignment: .leading, spacing: 15){
                            Text("Category").fontWeight(.semibold).foregroundColor(.black)
                            TextField("Enter Category...", text: $currentEventData.category).font(.system(size: 18).bold())
                                                        
                            Divider()
                            
                        }.padding(.top,10)
                        
                        VStack(alignment: .leading, spacing: 18){
                            Text("Type").fontWeight(.semibold).foregroundColor(.black)
                            HStack(spacing: 3){
                                ForEach(["Public", "Private"], id: \.self){tab in
                                    EventTypeButton(title: tab, currentType: $currentEventType)
                                }
                            }
                                                        
                            Divider()
                            
                        }.padding(.top,10)
                        
                        VStack(alignment: .leading, spacing: 15){
                            Text("Details").fontWeight(.semibold).foregroundColor(.black)
                            TextField("Enter Details...", text: $currentEventData.detail).font(.system(size: 18).bold())
                        }.padding(.top,10)
                        
                        Spacer(minLength: 15)
                        
                        VStack(alignment: .leading, spacing: 20){
                            if #available(iOS 15.0, *) {
                                Button{
                                    addEventToData()
                                } label: {
                                    Text("Create").fontWeight(.semibold).foregroundColor(.white)
                                    Image(systemName: "chevron.right").font(.title).foregroundColor(.white)
                                }.buttonStyle(.bordered).controlSize(.regular).controlProminence(.increased).tint(.black).padding(.bottom, 10).disabled(currentEventData.title == "" || currentEventData.location == "")
                            } else {
                                // Fallback on earlier versions
                            }
                        }
                    }
                    .padding()
                    .padding(.bottom, 30)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top).background(Color("Bg"))
                    .overlay(CustomDatePicker(date: $currentEventData.time, showPicker: $showDatePicker))
                    .transition(.move(edge: .bottom))
                }
            }
        }
    }
    
    func addEventToData(){
        withAnimation{
            eventModel.events.append(currentEventData)
            eventModel.addNewEvent.toggle()
        }
    }
}

struct EventTypeButton: View{
    var title: String
    @Binding var currentType: String
    
    var body: some View{
        Button{
            withAnimation{
                currentType = title
            }
        } label: {
            Text(title).font(.footnote).foregroundColor(title != currentType ? .black : .white).padding(.vertical, 8).frame(maxWidth: .infinity).background(Capsule().stroke(.black, lineWidth: 1)).background(Capsule().fill(.black.opacity(title == currentType ? 1 : 0)))
        }
    }
}

struct CustomDatePicker: View{
    @Binding var date: Date
    @Binding var showPicker: Bool
    
    var body: some View{
        if #available(iOS 15.0, *) {
            ZStack{
                
                Rectangle().fill(.ultraThinMaterial).ignoresSafeArea()
                DatePicker("", selection: $date, displayedComponents: [.date,.hourAndMinute]).labelsHidden()
                
                Button{
                    withAnimation{
                        showPicker.toggle()
                    }
                } label: {
                    Image(systemName: "xmark").foregroundColor(.white).padding().background(.secondary, in: Circle()).foregroundColor(.gray)
                }
                .padding(10)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            }
            .opacity(showPicker ? 1 : 0)
        }
        else{
            
        }
    }
}

struct EventViewCreated: View {
    
    @Binding var clickedEvent: EventData
    @Binding var showClickedEvent: Bool
    
    var body: some View {
        if showClickedEvent{
            Rectangle().fill(.white).ignoresSafeArea()
            VStack{
                HStack{
                    Button(action: {
                        self.showClickedEvent.toggle()},
                           label: {
                        Image(systemName: "chevron.left").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.black).padding()
                        Spacer()
                    })
                }
                
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
