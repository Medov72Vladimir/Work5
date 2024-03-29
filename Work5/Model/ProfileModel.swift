//
//  ProfileModel.swift
//  Work5
//
//  Created by macbook on 26.01.2024.
//

struct ProfileModel: Decodable {
    let response: Profile
}

struct Profile: Decodable {
    let firstName: String
    let lastName: String
    let photo: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_200"
    }
}
