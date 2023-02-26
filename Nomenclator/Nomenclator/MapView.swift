//
//  MapView.swift
//  Nomenclator
//
//  Created by Sam Johnson on 2023-02-25.
//

import MapKit
import SwiftUI

struct MapView: View {
    // Very quick and dirty
    struct WrappedCoordinate: Identifiable {
        var id = UUID()
        let coordinate: CLLocationCoordinate2D
    }
    
    @State var mapRegion: MKCoordinateRegion
    @State var location: CLLocationCoordinate2D
    
    var body: some View {
        Map(coordinateRegion: $mapRegion, annotationItems: [WrappedCoordinate(coordinate: location)]) { l in
            MapMarker(coordinate: l.coordinate)
        }
    }
    
    init(location: CLLocationCoordinate2D) {
        mapRegion = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        self.location = location
    }
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
