//
//  ViewController.swift
//  NetworkingLayer
//
//  Created by Artur Igberdin on 20.04.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        API.request(PostEndpoint.getPosts) { (result: Result<Post, Error>) in
            
            switch result {
            case .success(let response):
                print("Response: %@", response)
            case .failure(let error):
                print(error)
            }
            
        }
     
        
    }
}

