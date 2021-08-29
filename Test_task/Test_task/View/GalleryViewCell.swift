//
//  CollectionViewCell.swift
//  Test_task
//
//  Created by Жадаев Алексей on 27.08.2021.
//

import UIKit

class GalleryViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: WebImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    func configure(photo: Photo) {
        infoLabel.text = photo.author
        imageView.download(imageUrl: photo.image)
    }
}
