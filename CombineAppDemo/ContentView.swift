//
//  ContentView.swift
//  CombineAppDemo
//
//  Created by Avijeet on 17/05/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel = PostViewModel()
    
    var body: some View {
        NavigationStack {
            
            if viewModel.posts.isEmpty {
                ProgressView()
                    .progressViewStyle(.circular)
                    .imageScale(.large)
                    .frame(height: 100)
            } else {
                
                List(viewModel.posts, id: \.id) { post in
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.headline)
                        Text(post.body)
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                }
                .navigationTitle("Posts")
            }
            
        }
    }
}

#Preview {
    ContentView()
}
