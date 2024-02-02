//
//  FriendsModel.swift
//  Work5
//
//  Created by macbook on 26.01.2024.
//

struct FriendsModel: Decodable {
    let response: Friends
}

struct Friends: Decodable {
    let items: [Friend]
}

struct Friend: Decodable {
    let firstName: String
    let lastName: String
    let photo: String
    let online: Int
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_50"
        case online
    }
}
