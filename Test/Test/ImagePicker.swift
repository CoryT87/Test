//
//  ImagePicker.swift
//  Test
//
//  Created by Cory on 12/1/19.
//  Copyright © 2019 Cory Traxler. All rights reserved.
//

import SwiftUI

struct ImagePicker: View {
    
    @ObservedObject var userViewModel = UserViewModel()
    
    @State private var isShowingImagePicker = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.isShowingImagePicker.toggle()
            }) {
                ZStack {
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .foregroundColor(.gray)
                        .padding(.trailing, 20)
                    Image(uiImage: userViewModel.image)
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .overlay(Circle() .stroke(Color.black, lineWidth: 1))
                        .shadow(color: .black, radius: 3, x: 0, y: 3)
                        .frame(width: 60.0, height: 70.0)
                        .padding(.trailing, 20)
                }
            }
        }
        .sheet(isPresented: $isShowingImagePicker, content: {
            ImagePickerView(isPresented: self.$isShowingImagePicker, selectedImage: self.$userViewModel.image)
        })
    }
}



struct ImagePickerView: UIViewControllerRepresentable {
    
    @Binding var isPresented: Bool
    @Binding var selectedImage: UIImage
    
    func makeUIViewController(context:
        UIViewControllerRepresentableContext<ImagePickerView>) ->
        UIViewController {
            let controller = UIImagePickerController()
            controller.delegate = context.coordinator
            return controller
    }
    
    func makeCoordinator() -> ImagePickerView.Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent: ImagePickerView
        init(parent: ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImageFromPicker = info[.originalImage] as? UIImage {
                print(selectedImageFromPicker)
                self.parent.selectedImage = selectedImageFromPicker
            }
            
            self.parent.isPresented = false
        }
    }
    
    
    func updateUIViewController(_ uiViewController: ImagePickerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        
    }
}

struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePicker()
    }
}
