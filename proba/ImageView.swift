//
//  ImageView.swift
//  proba
//
//  Created by Инна Степанова on 20.03.2022.
//

import UIKit

class ImageView: UIImageView {
    
    func fetchImage(from url: String) {
        guard let imageURL = URL(string: url) else {
//            image =      вставить заглушку, если не получится создать URL
            return
        }
        
        if let cachedImage = getCachedImage(with: imageURL) {
            image = cachedImage
            return
        }
        
        ImageManager.shared.fetchImage(from: imageURL) { data, responce in
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
                self.saveDataToCach(widh: data, and: responce)
            }
        }
    }
    
    private func getCachedImage(with url: URL) -> UIImage? {
        let urlRequest = URLRequest(url: url)
        if let cachedResponce = URLCache.shared.cachedResponse(for: urlRequest) {
            return UIImage(data: cachedResponce.data)
        }
        return nil
    }
    
    private func saveDataToCach(widh data: Data, and responce: URLResponse) {
        guard let urlResponce = responce.url else {return}
        let cachedResponce = CachedURLResponse(response: responce, data: data)
        let urlRequest = URLRequest(url: urlResponce)
        URLCache.shared.storeCachedResponse(cachedResponce, for: urlRequest)
    }
}
