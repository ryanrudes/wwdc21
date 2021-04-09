//
//  EventBlob.swift
//  Timeline
//
//  Created by Ryan Rudes on 4/8/21.
//

import SwiftUI

struct EventBlob: View {
    let event: Event
    let rotating: Bool
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text(event.time)
                    .foregroundColor(color)
                    .font(.title2)
                    .bold()
                
                Spacer()
                
                Orbital(category: event.category,
                        rotating: rotating)
                    .scaleEffect(0.7)
                    .frame(width: 50, height: 50)
            }
            
            Text(event.info)
                .bold()
        }
    }
}
