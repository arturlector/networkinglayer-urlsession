//
//  Endpoint.swift
//  NetworkingLayer
//
//  Created by Artur Igberdin on 20.04.2021.
//

import Foundation

protocol Endpoint {
    
    /// HTTP or HTTPS
    var scheme: String { get }
    
    // "api.flickr.com"
    var baseURL: String { get }
    
    // "/services/rest/"
    var path: String { get }
    
    // [URLQueryItem(name: "api_key", value: API_KEY)]
    var parameters: [String: Any] { get }
    
    //GET
    var method: String { get }
}
