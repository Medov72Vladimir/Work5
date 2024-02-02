//
//  ProfileViewController.swift
//  Work5
//
//  Created by macbook on 26.01.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let networkService = NetworkService()
    
    private var profileImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 50
        view.clipsToBounds = true
        return view
    }()
    
    private var profileName: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        addConstraints()
        networkService.getProfileInfo { [weak self] profile in
            print(profile)
            DispatchQueue.main.async {
                self?.updateProfile(profile: profile)
            }
        }
    }
            
    private func setupUI() {
        view.addSubview(profileImage)
        view.addSubview(profileName)
    }
    
    private func addConstraints() {
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileName.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint.activate([
                
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 100),
            profileImage.heightAnchor.constraint(equalTo: profileImage.widthAnchor),
                
            profileName.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20),
            profileName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            profileName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        ])
    }
    
    func updateProfile(profile: Profile) {
        profileName.text = profile.firstName + " " + profile.lastName
        DispatchQueue.global().async {
            if let url = URL(string: profile.photo ?? ""), let image = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.profileImage.image = UIImage(data: image)
                }
            }
        }
    }
}
