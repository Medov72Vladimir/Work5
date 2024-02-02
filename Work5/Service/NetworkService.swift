//
//  NetworkService.swift
//  Work5
//
//  Created by macbook on 26.01.2024.
//

import Foundation

final class NetworkService {
    
    private let session = URLSession.shared
    static var token = ""
    
    func getFriends(completion: @escaping ([Friend]) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/friends.get?access_token=" + NetworkService.token + "&fields=photo_50,online&v=5.199") else {
            return
        }
        session.dataTask(with: url) { (data, _, networkError) in
            guard let data = data else {
                return
            }
            do {
                let friends = try JSONDecoder().decode(FriendsModel.self, from: data)
                completion(friends.response.items)
            } catch {
                print(error)
            }
        }.resume()
    }
                
    func getGroups(completion: @escaping ([Group]) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/groups.get?access_token=" + NetworkService.token + "&extended=1&fields=description&v=5.199") else {
                return
        }
        session.dataTask(with: url) { (data, _, networkError) in
            guard let data = data else {
                return
            }
            do {
                let groups = try JSONDecoder().decode(GroupsModel.self, from: data)
                completion(groups.response.items)
                                
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getPhotos(completion: @escaping ([Photo]) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/photos.get?access_token=" + NetworkService.token + "&album_id=wall&v=5.199") else {
            return
        }
        session.dataTask(with: url) { (data, _, networkError) in
            guard let data = data else {
                return
            }
            do {
                let photos = try JSONDecoder().decode(PhotosModel.self, from: data)
                completion(photos.response.items)
            } catch {
                print(error)
            }
        }.resume()
    }
                   
    func getProfileInfo(completion: @escaping (Profile) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/account.getProfileInfo?access_token=" + NetworkService.token + "&v=5.199") else {
                return
        }
        session.dataTask(with: url) { (data, _, networkError) in
            guard let data = data else {
                return
            }
            do {
                let profile = try JSONDecoder().decode(ProfileModel.self, from: data)
                completion(profile.response)
            } catch {
                print(error)
            }
        }.resume()
    }
}
