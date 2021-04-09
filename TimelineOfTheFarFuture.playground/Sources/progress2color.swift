//
//  progress2color.swift
//  Timeline
//
//  Created by Ryan Rudes on 4/8/21.
//

import SwiftUI

func progress2color(progress: Double) -> Color {
    let remaining = 1.0 - progress
    return Color(
        red: (remaining * 48 + progress * 255) / 255.0,
        green: (remaining * 209 + progress * 69) / 255.0,
        blue: (remaining * 88 + progress * 58) / 255.0
    )
}
