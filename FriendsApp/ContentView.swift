//
//  ContentView.swift
//  FriendsApp
//
//  Created by Sergey Shcheglov on 08.02.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
                .background(.red)
            
            Text("Some changes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
