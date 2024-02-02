//
//  FriendCell.swift
//  Work5
//
//  Created by macbook on 26.01.2024.
//

import UIKit

final class FriendCell: UITableViewCell {
    private var circle: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    private var text: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textAlignment = .left
        label.textColor = .black
        label.backgroundColor = .white
        return label
    }()
    
    private var isOnline: UIView = {
           let view = UIView()
           view.backgroundColor = .red
           view.layer.cornerRadius = 5
           return view
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
    
    func updateCell(friend: Friend) {
        text.text = friend.firstName + " " + friend.lastName
        isOnline.backgroundColor = friend.online == 1 ? .green : .red
        DispatchQueue.global().async {
            if let url = URL(string: friend.photo), let image = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.circle.image = UIImage(data: image)
                }
            }
        }
    }
    
    private func setupUI() {
        contentView.addSubview(circle)
        contentView.addSubview(text)
        contentView.addSubview(isOnline)
    }
        
    private func addConstraints() {
        circle.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        isOnline.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint.activate([
                
            circle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            circle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            circle.heightAnchor.constraint(equalToConstant: 40),
            circle.widthAnchor.constraint(equalTo: circle.heightAnchor),
                
            text.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            text.leftAnchor.constraint(equalTo: circle.rightAnchor, constant: 30),
            text.rightAnchor.constraint(equalTo: isOnline.leftAnchor, constant: -10),
                
            isOnline.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            isOnline.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            isOnline.heightAnchor.constraint(equalToConstant: 10),
            isOnline.widthAnchor.constraint(equalTo: isOnline.heightAnchor),
        ])
    }
}
