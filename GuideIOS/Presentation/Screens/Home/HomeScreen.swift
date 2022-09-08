//
//  HomeScreen.swift
//  GuideIOS
//
//  Created by MacBookPro on 05/09/2022.
//

import SwiftUI

struct HomeScreen: View {
    
    var body: some View {
        
//        NavigationView {
            
            TabView {
                MapScreen()
                    .tabItem {
                        Image(systemName: "map")
                        Text("Map")
                    }
                Text("Test")
                    .tabItem {
                        Image(systemName: "pencil.and.outline")
                        Text("Test")
                    }
                Text("User")
                    .tabItem {
                        Image(systemName: "person")
                        Text("User")
                    }
            }.navigationBarHidden(true)
//        }.navigationBarHidden(true)
//            .navigationTitle("")
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
