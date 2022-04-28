//
//  ImagePickerView.swift
//  Alerts
//
//  Created by Faris Hurić on 25. 4. 2022..
//

import UIKit
import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = self.sourceType
        imagePicker.delegate = context.coordinator // confirming the delegate
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func saveToLibrary() {
        if let selectedImage = selectedImage {
            UIImageWriteToSavedPhotosAlbum(selectedImage, nil, nil, nil)
        }
        
        
        if let data = selectedImage?.pngData() {
            // Create URL
            let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let url = documents.appendingPathComponent("sample.png")
            
            do {
                // Write to Disk
                try data.write(to: url)
                
                // Store URL in User Defaults
                UserDefaults.standard.set(data, forKey: "sample")
                
            } catch {
                print("Unable to Write Data to Disk (\(error))")
            }
        }
        
        
        
    }
    
    // Connecting the Coordinator class with this struct
    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
}
