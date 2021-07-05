//
//  FlickrResponse.swift
//  NetworkingLayer
//
//  Created by Artur Igberdin on 20.04.2021.
//

import Foundation

struct FlickrResponse: Codable {
    let photos: FlickrResultsPage?
}

struct FlickrResultsPage: Codable {
    let page: Int
    let pages: Int
    let photo: [FlickrPhoto]
}

struct FlickrPhoto: Codable {
    let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
}
