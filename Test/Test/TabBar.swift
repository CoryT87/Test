//
//  TabBar.swift
//  Test
//
//  Created by Cory on 12/1/19.
//  Copyright © 2019 Cory Traxler. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().tabItem({
                Image("Home")
                Text("Home")
            })
            
            Profile().tabItem({
                Image("profile")
                Text("Profile")
            })
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
