//
//  PhotosViewController.swift
//  Work5
//
//  Created by macbook on 26.01.2024.
//

import UIKit

final class PhotosViewController: UICollectionViewController {
    
    private let networkService = NetworkService()
    private var model: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        title = "Photos"
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "cell")
        networkService.getPhotos { [weak self] photos in
            self?.model = photos
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
                   
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.count
    }
                   
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        cell.updateCell(photo: model[indexPath.row])
        return cell
    }
}
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let cellSize = width / 2 - 20
        return CGSize(width: cellSize, height: cellSize)
    }
}
