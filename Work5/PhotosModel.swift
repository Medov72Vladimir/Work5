//
//  PhotosModel.swift
//  Work5
//
//  Created by macbook on 26.01.2024.
//

struct PhotosModel: Decodable {
    let response: Photos
}

struct Photos: Decodable {
    let items: [Photo]
}

struct Photo: Decodable {
    let sizes: [PhotoSizes]
}

struct PhotoSizes: Decodable {
    let width: Int
    let height: Int
    let url: String
}
