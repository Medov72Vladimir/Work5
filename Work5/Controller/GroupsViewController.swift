//
//  GroupsViewController.swift
//  Work5
//
//  Created by macbook on 26.01.2024.
//

import UIKit

final class GroupsViewController: UITableViewController {

    private let networkService = NetworkService()
    private var model: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Groups"
        tableView.register(GroupCell.self, forCellReuseIdentifier: "cell")
        networkService.getGroups { [weak self] groups in
            self?.model = groups
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
                    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
                    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? GroupCell else {
            return UITableViewCell()
        }
        cell.updateCell(group: model[indexPath.row])
        return cell
    }
}
