//
//  Home.swift
//  Test
//
//  Created by Cory on 12/1/19.
//  Copyright © 2019 Cory Traxler. All rights reserved.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            Image("Goku")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(Circle() .stroke(Color.black, lineWidth: 1))
                .shadow(color: .black, radius: 3, x: 0, y: 3)
                .frame(width: 90.0, height: 110.0)
                .padding(.top, 10)
            
            VStack (spacing: 45) {
                Text("Hello Goku!")
                    .font(Font.custom("SF Pro Display Light", size: 35))
//                    .padding(.leading, 20)
                
            }
        }
    }
    
    struct Home_Previews: PreviewProvider {
        static var previews: some View {
            Home()
        }
    }
}
