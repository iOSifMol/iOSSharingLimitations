//
//  ContentView.swift
//  iOSSharingLimitations
//
//  Created by Iosif Moldovan on 08.04.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      Button("Share something") {
        print("Let's share something")
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
