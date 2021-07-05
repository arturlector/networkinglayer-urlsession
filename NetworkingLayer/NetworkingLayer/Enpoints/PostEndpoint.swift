//
//  PostEndpoint.swift
//  NetworkingLayer
//
//  Created by Artur Igberdin on 20.04.2021.
//

import Foundation

enum PostEndpoint: Endpoint {
    
    case getPosts
    case getPost(id: Int)
    
    
    var scheme: String {
        switch self {
        default: return "https"
        }
    }
    
    var baseURL: String {
        switch self {
        default: return "api.flickr.com"
        }
    }
    
    var path: String {
        switch self {
        case .getPosts: return "/service/rest/"
        }
    }
    
    var parameters: [String: Any] {
        //let apiKey = "675894853ae8ec6c242fa4c077bcf4a0"
        
        switch self {
        case .getPosts(let searchText, let page):

            return ["text": searchText]
        

        }
    }
    
    var method: String {
        switch self {
        case .getPost: return "GET"
        }
    }
    
}
