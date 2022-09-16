//
//  HomeScreen.swift
//  GuideIOS
//
//  Created by MacBookPro on 05/09/2022.
//

import SwiftUI

struct HomeScreen: View {
    
    var body: some View {
        NavigationView {
            
            TabView {
                MapScreen(vm: MapViewModel())
                    .tabItem {
                        Image(systemName: "map")
                        Text("Map")
                    }
                    .navigationBarHidden(true).navigationBarTitle("")
                ToursListScreen()
                    .environmentObject(TourListViewModel())
                    .tabItem {
                        Image(systemName: "pencil.and.outline")
                        Text("Test")
                    }.navigationBarHidden(true).navigationBarTitle("")
                Text("User")
                    .tabItem {
                        Image(systemName: "person")
                        Text("User")
                    }.navigationBarHidden(true).navigationBarTitle("")
            }
        }
        .navigationBarHidden(true)
        .navigationTitle("")
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
