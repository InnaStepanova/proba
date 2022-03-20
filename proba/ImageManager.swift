//
//  ImageManager.swift
//  proba
//
//  Created by Инна Степанова on 10.02.2022.
//

import UIKit

class ImageManager {
    
    static let shared = ImageManager()
    
    private init() {}

    func fetchImage(from url: URL, with complition: @escaping (Data, URLResponse) -> Void) {
    
        URLSession.shared.dataTask(with: url) { data, responce, error in
            if let error = error {
                print(error)
                return
            }
            guard let data = data, let responce = responce else {return}
            guard let responceURL = responce.url else {return}
            guard responceURL == url else {return}
            complition(data, responce)
        }.resume()
    }
}
