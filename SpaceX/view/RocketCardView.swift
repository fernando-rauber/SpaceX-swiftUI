//
//  RocketCardView.swift
//  SpaceX
//
//  Created by Fernando Rauber on 18/04/2021.
//

import SwiftUI

struct RocketCardView: View {
    // MARK: - ATTRIBUTES
    
    let rocket: Rocket
    
    // MARK: - BODY
    var body: some View {
        HStack {
            
            Image("icon.rocket")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200, alignment: .center)
                
            
            VStack(alignment: .leading) {
                Text(rocket.rocket_name)
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                HStack {
                    Text("First Flight:")
                        .fontWeight(.bold)
                    
                    Text(rocket.first_flight)
                        .font(.footnote)
                }
                .padding(.bottom, 5)
                
                HStack {
                    Text("Country:")
                        .fontWeight(.bold)
                    
                    Text(rocket.country)
                        .font(.footnote)
                }
                .padding(.bottom, 10)
                
              
                
                Button(action: {}) {
                    Text("See More")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(
                            Color.blue
                        )
                        .clipShape(Capsule())
                        .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 4 )
                }
                .padding(6)
               
            }
        }
        .frame(height: 200)
        
    }
}


// MARK: - PREVIEW
struct RocketCardView_Previews: PreviewProvider {
    static let rocket = Rocket(id: "11", rocket_name: "Falcon" , active: true, first_flight: "12/12/2021", country: "Australia", wikipedia: "https://en.wikipedia.org/wiki/Falcon_1", description: "The Falcon 1 was an expendable launch system privately developed and manufactured by SpaceX during 2...")
    
    static var previews: some View {
        RocketCardView(rocket: rocket)
            .previewLayout(.sizeThatFits)
    }
}
