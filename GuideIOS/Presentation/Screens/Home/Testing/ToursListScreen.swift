//
//  ToursListScreen.swift
//  GuideIOS
//
//  Created by MacBookPro on 14/09/2022.
//

import SwiftUI

struct ToursListScreen: View {
    
    @EnvironmentObject var vm: TourListViewModel
        
    private let gridItemLayout = [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 20,  content: {
                ForEach(vm.listOfTours, id: \.id) { tour in
                    TourItem(tour: tour)
                        .onTapGesture {
                            vm.tourClicked(tourId: tour.id)
                        }
                }
            }).padding(.horizontal)
        }
    }
}



struct ToursListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ToursListScreen()
            .environmentObject(TourListViewModel())
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
        ToursListScreen()
            .environmentObject(TourListViewModel())
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
        ToursListScreen()
            .environmentObject(TourListViewModel())
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
    }
}
