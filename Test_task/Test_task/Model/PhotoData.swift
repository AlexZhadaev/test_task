//
//  PhotoData.swift
//  Test_task
//
//  Created by Жадаев Алексей on 28.08.2021.
//

import Foundation

struct PhotoData: Codable {
    let id: String
    let urls: Urls
    let user: User
}

struct User: Codable {
    let username: String
}

struct Urls: Codable {
    let full: String
    let regular: String
}
