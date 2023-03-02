//
//  MapView.swift
//  Eventify
//
//  Created by Mathias Girouard on 2021-05-18.
//

import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI

struct MapView: View {
    
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        ZStack(alignment: .bottom){
            if #available(iOS 15.0, *) {
                
                Map(coordinateRegion: $locationManager.region, showsUserLocation: true).ignoresSafeArea()
                
                LocationButton(.currentLocation){
                    locationManager.manager.requestLocation()
                }
                .frame(width: 210, height: 50)
                .symbolVariant(.fill)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .padding()
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    @Published var manager = CLLocationManager()
    @Published var region : MKCoordinateRegion = .init()
    
    override init(){
        super.init()
        manager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last?.coordinate else{
            return
        }
        
        region = MKCoordinateRegion(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
