//
//  ImageFile.swift
//  Timeline
//
//  Created by Ryan Rudes on 4/8/21.
//

import SwiftUI

struct ImageFile: View {
    let named: String
    var body: some View {
        Image(uiImage: UIImage(named: named)!)
            .resizable()
            .scaledToFit()
    }
}
