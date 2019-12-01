//
//  Profile.swift
//  Test
//
//  Created by Cory on 12/1/19.
//  Copyright © 2019 Cory Traxler. All rights reserved.
//

import SwiftUI

struct Profile: View {
    
    @ObservedObject var userViewModel = UserViewModel()
    
    @State var name: String = ""
    @State var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack {
            Image(uiImage: userViewModel.image)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(Circle() .stroke(Color.black, lineWidth: 1))
                .shadow(color: .black, radius: 3, x: 0, y: 3)
                .frame(width: 90.0, height: 110.0)
                .padding(.top, 10)
            
            
            VStack (spacing: 45) {
                Text("\(name)")
                    .font(Font.custom("SF Pro Display Light", size: 35))
            }
            
            
            
            Spacer()
            Spacer()
            
            VStack {
                HStack {
                    Text("Photo")
                        .font(Font.custom("SF Pro Display Light", size: 20))
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                    ImagePicker()
                }
                
                LineDivider(label: "")
                
                HStack {
                    Text("Change name")
                        .font(Font.custom("SF Pro Display Light", size: 20))
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                    TextField("Change name", text: $name)
                        .padding(.horizontal)
                        .font(Font.custom("SF Pro Display Light", size: 20))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 215)
                        
                }
                
                LineDivider(label: "")
                
            }
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            
        }
        
        
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
