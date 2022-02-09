//
//  DetailView.swift
//  FriendsApp
//
//  Created by Sergey Shcheglov on 08.02.2022.
//

import SwiftUI

struct DetailView: View {
    var user: User
    
    var body: some View {
            VStack {
                Text("\(user.name) friends:")
                    .font(.largeTitle)
                
                List(user.friends, id: \.id) { friend in
                    HStack {
                        Image(systemName: "person.circle")
                        
                        VStack {
                            Text(friend.name)
                            
                        }
                    }
                }
            .navigationTitle("FriendsApp")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


