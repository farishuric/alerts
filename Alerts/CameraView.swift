//
//  CameraView.swift
//  Alerts
//
//  Created by Faris Hurić on 25. 4. 2022..
//

import SwiftUI

struct CameraView: View {
    
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    @State var imageData: Data? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                
                Button {
                    print("selected image:", selectedImage ?? "")
                } label: {
                    Text("Print url")
                }

                
                VStack {
                    Button {
                        if let data = UserDefaults.standard.data(forKey: "sample") {
                            imageData = data
                        } else {
                            print("No data")
                        }
                    } label: {
                        Text("Get last image")
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                            .foregroundColor(Color.white)
                    }
                }
                
                VStack {
                    
                    if let imageData = imageData {
                        Image(uiImage: UIImage(data: imageData)!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(width: 100, height: 100)
                    } else {
                        Text("No image yet")
                    }

                }
                
                Spacer()
                
                if selectedImage != nil {
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)
                    
                    Button {
                        ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType).saveToLibrary()
                    } label: {
                        Text("Save to gallery")
                    }

                    
                } else {
                    Image(systemName: "snow")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)
                }
                
                Button("Camera") {
                    self.sourceType = .camera
                    self.isImagePickerDisplay.toggle()
                }.padding()
                
                Button("photo") {
                    self.sourceType = .photoLibrary
                    self.isImagePickerDisplay.toggle()
                }.padding()
                
            }
            .sheet(isPresented: self.$isImagePickerDisplay) {
                ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
            }
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
