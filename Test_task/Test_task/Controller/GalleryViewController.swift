//
//  ViewController.swift
//  Test_task
//
//  Created by Жадаев Алексей on 27.08.2021.
//

import UIKit

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let itemsInRow: CGFloat = 2
    let insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    var networkService = NetworkService()
    var photos: [Photo] = []
    let urlString = "https://api.unsplash.com/photos?page=1&client_id=4y_SchofGSBWMezCQKyfMzU0ei0T9ZkYrBM_ZZM4dzs"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        networkService.dataFetch(urlString: urlString, completion: { [weak self] photos in
            guard let self = self, let photos = photos else { return }
            self.updateInterfaceWith(photos: photos)
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromGalleryToPhotoSegue" {
            let photoViewController = segue.destination as! PhotoViewController
            let cell = sender as! GalleryViewCell
            photoViewController.image = cell.imageView.image
        }
    }
    
    func updateInterfaceWith(photos: [Photo]) {
        DispatchQueue.main.async {
            self.photos = photos
            self.collectionView.reloadData()
        }
    }
}

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! GalleryViewCell
        let photo = photos[indexPath.item]
        cell.configure(photo: photo)
        return cell
    }
    
}

extension GalleryViewController: UICollectionViewDelegate {
    
}
