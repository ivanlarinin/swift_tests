//
//  CircleImage.swift
//  Experiments
//
//  Created by Ivan Larinin on 2025-03-05.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("tempimg")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.gray, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage()
}
