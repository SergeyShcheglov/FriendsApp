//
//  ContentView.swift
//  FriendsApp
//
//  Created by Sergey Shcheglov on 08.02.2022.
//

import SwiftUI

struct Response: Codable {
    var results: [User]
}
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
//            .overlay {
//                if users.isFetching { ProgressView() }
//            }

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
            print("data is \(data)")
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            print("set decodeingStrategy")
            
            if let decodedResponse = try? decoder.decode([User].self, from: data) {
                self.users = decodedResponse
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
