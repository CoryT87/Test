//
//  LineDivider.swift
//  Test
//
//  Created by Cory on 12/1/19.
//  Copyright © 2019 Cory Traxler. All rights reserved.
//

import SwiftUI

struct LineDivider: View {

    let label: String
    let horizontalPadding: CGFloat
    let color: Color

    init(label: String, horizontalPadding: CGFloat = 10, color: Color = .black) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }

    var body: some View {
        HStack {
            line
        }
    }

    var line: some View {
        VStack { Divider().background(color) }.padding(horizontalPadding)
    }
}
