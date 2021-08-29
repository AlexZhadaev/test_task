//
//  Photo.swift
//  Test_task
//
//  Created by Жадаев Алексей on 28.08.2021.
//

import Foundation

struct Photo {
    var id: String
    var image: String
    var author: String
    
    init?(photoData: PhotoData) {
        id = photoData.id
        image = photoData.urls.regular
        author = photoData.user.username
    }
}
