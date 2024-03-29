//
//  PhotoCell.swift
//  Work5
//
//  Created by macbook on 26.01.2024.
//

import UIKit

final class PhotoCell: UICollectionViewCell {
    
    private var cellImage = UIImageView(image: UIImage(systemName: "person"))
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        addConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(photo: Photo) {
        DispatchQueue.global().async {
            if let url = URL(string: photo.sizes[2].url), let image = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.cellImage.image = UIImage(data: image)
                }
            }
        }
    }
                    
    private func setupUI() {
        contentView.addSubview(cellImage)
    }
                    
    private func addConstraints() {
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                            
            cellImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            cellImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellImage.leftAnchor.constraint(equalTo: contentView.leftAnchor)
        ])
    }
}
