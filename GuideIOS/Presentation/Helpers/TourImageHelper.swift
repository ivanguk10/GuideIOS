//
//  TourImageHelper.swift
//  GuideIOS
//
//  Created by MacBookPro on 15/09/2022.
//

import Foundation

class TourImageHelper {
    
    func getImageNameByTour(tour: Tour) -> String {
        let tourName = "\(tour.city) \(tour.type)"
        return tourName.removeWhitespace()
    }
}

