//
//  WebImageView.swift
//  Test_task
//
//  Created by Жадаев Алексей on 28.08.2021.
//

import UIKit

class WebImageView: UIImageView {
    
    func download(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            self.image = UIImage(data: cachedResponse.data)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data, let response = response {
                    self.image = UIImage(data: data)
                    self.caching(data: data, response: response)
                }
            }
        }
        dataTask.resume()
    }
    
    private func caching(data: Data, response: URLResponse) {
        guard let url = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: url))
    }
}
