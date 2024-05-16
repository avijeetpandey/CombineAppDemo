//
//  Model.swift
//  CombineAppDemo
//
//  Created by Avijeet on 17/05/24.
//

import Combine

// Model for representing fetched data
struct Post: Decodable {
    let id: Int
    let title: String
    let body: String
}
