//
//  FriendsViewController.swift
//  Work5
//
//  Created by macbook on 26.01.2024.
//

import UIKit

final class FriendsViewController: UITableViewController {
    
    private let networkService = NetworkService()
    private var model: [Friend] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Friends"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "person"),
            style: .plain,
            target: self,
            action: #selector(tap)
        )
        tableView.register(FriendCell.self, forCellReuseIdentifier: "cell")
                
        networkService.getFriends { [weak self] friends in
            self?.model = friends
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            model.count
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FriendCell else {
            return UITableViewCell()
        }
        cell.updateCell(friend: model[indexPath.row])
        return cell
    }
}

private extension FriendsViewController {
    @objc func tap() {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.type = .moveIn
        animation.duration = 1
        navigationController?.view.layer.add(animation, forKey: nil)
        navigationController?.pushViewController(ProfileViewController(), animated: false)
    }
}
