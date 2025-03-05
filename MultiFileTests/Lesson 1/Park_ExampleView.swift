//
//  Park Example.swift
//  Experiments
//
//  Created by Ivan Larinin on 2025-03-05.
//

import SwiftUI

struct Park_Example: View {
    var body: some View {
        VStack {
            // Displays a map view, likely showing the location of Turtle Rock.
            MapView()
                .frame(height: 300)

            // Displays a circular image, offset upwards to overlay the map.
            CircleImage()
                .offset(y: -130) // Moves the image up
                .padding(.bottom, -130) // Adjusts the padding to maintain layout balance

            VStack(alignment: .leading) {
                // Main title of the park
                Text("Turtle Rock")
                    .font(.title)

                // Subheadline with location details
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer() // Pushes text apart for better layout
                    Text("California")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)

                Divider()

                // Section for additional information about the location
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Some text")
            }
            .padding() // Adds padding to the text content for better spacing

            Spacer() // Pushes content to the top for better layout balance
        }
    }
}

#Preview {
    Park_Example()
}
