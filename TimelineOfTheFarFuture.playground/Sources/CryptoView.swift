//
//  CryptoView.swift
//  Timeline
//
//  Created by Ryan Rudes on 4/8/21.
//

import SwiftUI

struct CryptoView: View {
    let image: String
    let label: String
    let address: String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .padding(5)
                .background(Color.white)
                .clipShape(Circle())
                .frame(width: 35, height: 35)
            Text(label)
            Spacer()
            Menu {
                Button(action: {
                    UIPasteboard.general.string = address
                }) {
                    Text("Copy to clipboard")
                    Image(systemName: "doc.on.doc")
                }
            } label: {
                Text(address)
                    .font(.system(size: 9))
            }
        }
    }
}
