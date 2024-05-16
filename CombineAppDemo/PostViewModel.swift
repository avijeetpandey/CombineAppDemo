//
//  PostViewModel.swift
//  CombineAppDemo
//
//  Created by Avijeet on 17/05/24.
//

import Foundation
import Combine

// MARK: - PostViewModel
class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    private var cancellable: AnyCancellable?
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        
        guard let url = URL(string: urlString) else { return }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Post].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] fetchedPosts in
                self?.posts = fetchedPosts
            })
    }
}
