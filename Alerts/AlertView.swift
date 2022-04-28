//
//  AlertView.swift
//  Alerts
//
//  Created by Faris Hurić on 28. 4. 2022..
//

import SwiftUI

struct AlertView: View {
    
    @State private var alert: AlertType?
    
    var body: some View {
        VStack {
            Button {
                alert = .ok(
                    title: "Hello Alert!",
                    message: "This is default alert with OK button"
                )
            } label: {
                Text("Open alert")
            }
        }
        .alert(item: $alert) { $0.alert }
    }
    
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
