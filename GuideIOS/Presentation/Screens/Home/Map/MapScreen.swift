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
    
    @State var tracking: MapUserTrackingMode = .none
    @ObservedObject var vm: MapViewModel

    var body: some View {
        
        ZStack(alignment: .bottom) {
            Map(
                coordinateRegion: $vm.region, interactionModes: MapInteractionModes.all, showsUserLocation: true, userTrackingMode: $tracking
            ).onAppear {
                vm.checkIfLocationServicesIsEnbled()
            }

            
            HStack {
                CircleButton(action: {
                    
                }, imageView: {
                    Image(systemName: "ellipsis")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26, height: 26)
                        .foregroundColor(Color.white)
                })
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                        .padding(.trailing, 4)
                        .padding(.top, 4)
                        
                }
                .frame(width: 50, height: 50)
                .background(Color.pink)
                .clipShape(Circle())
                .shadow(color: Color.gray, radius: 4)
            }
            .padding(.bottom, 24)
            .padding(.horizontal, 16)
        }
    }
}

struct MapScreen_Previews: PreviewProvider {
    static var previews: some View {
        MapScreen(vm: MapViewModel())
    }
}
