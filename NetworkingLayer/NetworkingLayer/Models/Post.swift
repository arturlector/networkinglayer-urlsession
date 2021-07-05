//
//  PostReponse.swift
//  NetworkingLayer
//
//  Created by Artur Igberdin on 20.04.2021.
//

import Foundation

struct PostElement: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias Post = [PostElement]


