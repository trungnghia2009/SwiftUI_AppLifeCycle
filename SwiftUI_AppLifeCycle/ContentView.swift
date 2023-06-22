//
//  ContentView.swift
//  SwiftUI_AppLifeCycle
//
//  Created by trungnghia on 22/06/2023.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var appDelegate: AppDelegate

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(appDelegate.date.formatted(date: .omitted, time: .standard))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
