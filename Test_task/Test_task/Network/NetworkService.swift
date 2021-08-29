//
//  Network.swift
//  Test_task
//
//  Created by Жадаев Алексей on 28.08.2021.
//

import Foundation

class NetworkService {
    
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
        task.resume()
    }
    
    func dataFetch(urlString: String, completion: @escaping ([Photo]?) -> Void) {
        request(urlString: urlString) { data, error in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try! decoder.decode([PhotoData].self, from: data)
            var photos: [Photo] = []
            for item in response {
                guard let photo = Photo(photoData: item) else { return }
                photos.append(photo)
            }
            completion(photos)
        }
    }
}
