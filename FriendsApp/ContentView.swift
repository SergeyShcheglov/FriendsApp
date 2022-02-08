//
//  ContentView.swift
//  FriendsApp
//
//  Created by Sergey Shcheglov on 08.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List(users, id: \.id) { user in
                VStack(alignment: .leading) {
                    Text(user.name)
                    Text(user.isActive ? "Online" : "Offline")
                }
                
            }
            .task {
                await loadData()
            }

            .navigationTitle("FriendsApp")
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid url")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            print("set decodeingStrategy")
            
            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                print("decoded starts")

                self.users = decodedResponse
                print("decoded end")
            } else {
                print("fail to decode")
            }
        } catch {
            print("Invalid data")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
