//
//  GroupCell.swift
//  Work5
//
//  Created by macbook on 26.01.2024.
//

import UIKit

final class GroupCell: UITableViewCell {

    private var groupPhoto: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    private var groupName: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textAlignment = .left
        label.textColor = .black
        label.backgroundColor = .white
        return label
    }()
    
    private var groupDescription: UILabel = {
            let label = UILabel()
            label.text = "Description"
            label.textAlignment = .left
            label.textColor = .black
            label.backgroundColor = .white
            label.numberOfLines = 3
            label.font = UIFont.systemFont(ofSize: 15)
            return label
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupUI()
        addConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(group: Group) {
        groupName.text = group.name
        groupDescription.text = group.description
        DispatchQueue.global().async {
            if let url = URL(string: group.photo), let image = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.groupPhoto.image = UIImage(data: image)
                }
            }
        }
    }
    
    private func setupUI() {
        contentView.addSubview(groupPhoto)
        contentView.addSubview(groupName)
        contentView.addSubview(groupDescription)
    }
        
    private func addConstraints() {
            
        groupPhoto.translatesAutoresizingMaskIntoConstraints = false
        groupName.translatesAutoresizingMaskIntoConstraints = false
        groupDescription.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint.activate([
                
            groupPhoto.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            groupPhoto.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            groupPhoto.heightAnchor.constraint(equalToConstant: 40),
            groupPhoto.widthAnchor.constraint(equalTo: groupPhoto.heightAnchor),
                
            groupName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            groupName.leftAnchor.constraint(equalTo: groupPhoto.rightAnchor, constant: 30),
            groupName.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
                            
            groupDescription.topAnchor.constraint(equalTo: groupName.bottomAnchor, constant: 10),
            groupDescription.leftAnchor.constraint(equalTo: groupName.leftAnchor),
            groupDescription.rightAnchor.constraint(equalTo: groupName.rightAnchor),
            groupDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
