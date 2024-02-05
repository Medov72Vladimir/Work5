//
//  GroupsModel.swift
//  Work5
//
//  Created by macbook on 26.01.2024.
//

struct GroupsModel: Decodable {
    let response: Groups
}

struct Groups: Decodable {
    let items: [Group]
}

struct Group: Decodable {
    let name: String
    let description: String?
    let photo: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case photo = "photo_50"
    }
}
