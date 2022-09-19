//
//  TourItem.swift
//  GuideIOS
//
//  Created by MacBookPro on 15/09/2022.
//

import SwiftUI

struct TourItem: View {
    
    var tour: Tour
    
    private let tourImageHelper = TourImageHelper()
    
    var body: some View {
        
        ZStack {
            Image(tourImageHelper.getImageNameByTour(tour: tour))
                .resizable()
                .scaledToFill()
            if tour.isSelected {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .opacity(0.7)
            } else {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .opacity(0.3)
            }
            
            VStack {
                Text("\(tour.city)")
                    .foregroundColor(Color.white)
                    .font(.title)
                    .bold()
                Text("\(tour.type)")
                    .foregroundColor(Color.white)
                    .font(.title3)
                    .italic()
            }.padding(.bottom, 8)
            if tour.isSelected {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Image("Checked")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color.white)
                            .padding(.trailing, 8)
                            .padding(.bottom, 8)
                    }.padding(.trailing, 42)
                    
                }
            }
        }
        .frame(maxWidth: .infinity, minHeight: 170, maxHeight: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 8)
    }
    
}

struct TourItem_Previews: PreviewProvider {
    static var previews: some View {
        TourItem(tour: Tour(id: 0, city: "Minsk", type: "Architectural", isSelected: false))
    }
}
