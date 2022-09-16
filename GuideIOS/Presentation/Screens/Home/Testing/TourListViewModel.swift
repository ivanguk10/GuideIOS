//
//  TourListViewModel.swift
//  GuideIOS
//
//  Created by MacBookPro on 15/09/2022.
//

import Foundation

class TourListViewModel: ObservableObject {
    
    @Published var listOfTours: [Tour] = [
        Tour(id: 0, city: "Minsk", type: "Architectural", isSelected: true),
        Tour(id: 3, city: "Minsk", type: "Cultural", isSelected: false),
        Tour(id: 5, city: "Minsk", type: "Night Life", isSelected: false),
        Tour(id: 6, city: "Barcelona", type: "Architectural", isSelected: false),
        Tour(id: 7, city: "Barcelona", type: "Cultural", isSelected: false),
    ]
    
    func tourClicked(tourId: Int) {
        listOfTours = listOfTours.map { tour in
            var changedTour = tour
            changedTour.isSelected = tour.id == tourId
            return changedTour
        }
    }
}
