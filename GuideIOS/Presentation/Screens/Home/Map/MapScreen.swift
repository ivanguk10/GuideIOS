//
//  MapScreen.swift
//  GuideIOS
//
//  Created by MacBookPro on 05/09/2022.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapScreen: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    @State var tracking: MapUserTrackingMode = .none
    @ObservedObject var vm: MapViewModel
        
    let guides = [Guide(location: CLLocationCoordinate2D(latitude: 55.757816, longitude: 37.616318)), Guide(location: CLLocationCoordinate2D(latitude: 55.757460, longitude: 37.616554))]


    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            
            Map(
                coordinateRegion: $vm.region, interactionModes: MapInteractionModes.all, showsUserLocation: true, userTrackingMode: $tracking, annotationItems: guides
            ) { marker in
                MapAnnotation(
                   coordinate: marker.location,
                   anchorPoint: CGPoint(x: 0.5, y: 0.7)
                ) {
                   VStack{
                       Image(systemName: "figure.walk")
                           .resizable()
                           .frame(width: 30, height: 30)
                           .foregroundColor(.red)
                           .onTapGesture {
                               let index: Int = guides.firstIndex(where: {$0.id == marker.id})!
                               print("Hello marker \(index)")
                           }
                           .shadow(radius: 6)
                   }
                }
            }
            .onAppear {
                vm.checkIfLocationServicesIsEnbled()
            }

            HStack(alignment: .bottom) {
                
                VStack(alignment: .leading) {
                    
                    if vm.isMenuOpened {
                        VStack(alignment: .leading) {
                            RoundedImageTextButton(action: {
                                print("")
                            }, imageView: {
                                Image("Tick")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Color.white)
                            }, title: "Guide Activity")
                            
                            RoundedImageTextButton(action: {
                                print("")
                            }, imageView: {
                                Image("Search")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Color.white)
                                    .padding(.top, 2)
                            }, title: "Find Guide")
                        }
                    }
                    
                    CircleButton(action: {
                        vm.menuClicked()
                    }, imageView: {
                        Image(systemName: "ellipsis")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 26, height: 26)
                            .foregroundColor(Color.pink)
                    })
                }
                
                Spacer()
                
                CircleButton(action: {
                    vm.checkIfLocationServicesIsEnbled()
                }, imageView: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.pink)
                        .padding(.trailing, 4)
                        .padding(.top, 4)
                })
            }
            .padding(.bottom, 24)
            .padding(.horizontal, 16)
            
        }
    }
}

struct Guide: Identifiable {
    let id = UUID()
    var location: CLLocationCoordinate2D
}

struct MapScreen_Previews: PreviewProvider {
    static var previews: some View {
        MapScreen(vm: MapViewModel())
    }
}
