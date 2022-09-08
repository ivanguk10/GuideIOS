//
//  MapScreen.swift
//  GuideIOS
//
//  Created by MacBookPro on 05/09/2022.
//

import SwiftUI
import MapKit

struct MapScreen: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    var body: some View {
        VStack {
            Map(coordinateRegion: $region)
        }.navigationBarHidden(true)
    }
}

struct MapScreen_Previews: PreviewProvider {
    static var previews: some View {
        MapScreen()
    }
}
