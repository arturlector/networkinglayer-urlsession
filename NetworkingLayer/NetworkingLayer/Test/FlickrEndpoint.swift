//
//  FlickrEndpoint.swift
//  NetworkingLayer
//
//  Created by Artur Igberdin on 20.04.2021.
//

import Foundation

enum FlickrEndpoint: Endpoint {
    
    case getSearchResults(searchText: String, page: Int)
    
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
        case .getSearchResults: return "/service/rest/"
        }
    }
    
    var parameters: [String: Any] {
        let apiKey = "675894853ae8ec6c242fa4c077bcf4a0"
        
        switch self {
        case .getSearchResults(let searchText, let page):
//            let params: [String: Any] = ["text": searchText,
//                                         "page": String(page)]
            
            return ["text": searchText,
                    "page": String(page),
                    "method": "flickr.photos.search",
                    "format": "json",
                    "per_page": "20",
                    "nojsoncallback": "1",
                    "api_key": apiKey]
        
//            return [URLQueryItem(name: "text", value: searchText),
//                    URLQueryItem(name: "page", value: String(page)),
//                    URLQueryItem(name: "method", value: "flickr.photos.search"),
//                    URLQueryItem(name: "format", value: "json"),
//                    URLQueryItem(name: "per_page", value: "20"),
//                    URLQueryItem(name: "nojsoncallback", value: "1"),
//                    URLQueryItem(name: "api_key", value: apiKey)]
        }
    }
    
    var method: String {
        switch self {
        case .getSearchResults: return "GET"
        }
    }
    
    
   
}


