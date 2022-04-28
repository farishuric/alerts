//
//  ContentView.swift
//  Alerts
//
//  Created by Faris Hurić on 20. 4. 2022..
//

import SwiftUI

struct ContentView: View {
    
    @State var alert: AlertType?
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                Spacer()
                
                Button {
                    alert = .ok(
                        title: "This is OK alert",
                        message: "This alert will show only 'OK' button."
                    )
                } label: {
                    Text("OK Alert")
                }
                
                Spacer()
                
                Button {
                    alert = .singleButton(
                        title: "Single button alert",
                        message: "This alert will show one button.",
                        dismissButton: .default(
                            Text("Okay")
                        )
                    )
                } label: {
                    Text("Single button alert")
                }
                
                Spacer()
                
                Button {
                    alert = .twoButtons(
                        title: "Two buttons alert",
                        message: "This alert will show two buttons.",
                        primaryButton: .destructive(Text("Cancel")),
                        secondaryButton: .default(Text("Save"))
                    )
                } label: {
                    Text("OK Alert")
                }
                
                
                
                Spacer()
                
                //                NavigationLink {
                //                    CameraView()
                //                } label: {
                //                    Text("Open Camera")
                //                }
                //
                //                Spacer()
                
                NavigationLink {
                    AlertView()
                } label: {
                    Text("Open AlertView")
                }
                
                Spacer()
                
                
            }
            .alert(item: $alert) { $0.alert }
        }
        
    }
}

enum AlertType: Identifiable {
    
    case ok(
        title: String,
        message: String? = nil
    )
    
    case singleButton(
        title: String,
        message: String? = nil,
        dismissButton: Alert.Button
    )
    
    case twoButtons(
        title: String,
        message: String? = nil,
        primaryButton: Alert.Button,
        secondaryButton: Alert.Button
    )
    
    var id: String {
        switch self {
        case .ok:
            return "ok"
        case .singleButton:
            return "singleButton"
        case .twoButtons:
            return "twoButtons"
        }
    }
    
    var alert: Alert {
        switch self {
        case .ok(let title, let message):
            return Alert(
                title: Text(title),
                message: Text(message ?? "")
            )
        case .singleButton(let title, let message, let dismissButton):
            return Alert(
                title: Text(title),
                message: Text(message ?? ""),
                dismissButton: dismissButton
            )
        case .twoButtons(let title, let message, let primaryButton, let secondaryButton):
            return Alert(
                title: Text(title),
                message: Text(message ?? ""),
                primaryButton: primaryButton,
                secondaryButton: secondaryButton
            )
        }
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
