//
//  PhotosGaleryCollectionViewController.swift
//  FirstApp
//
//  Created by Evgeny Konenko on 21.01.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosGaleryCollectionViewController: UICollectionViewController {

    var photosGalery: [PhotosGaleryCellModel] = [.init(photosImageName: "rus_1"), .init(photosImageName: "rus_2"),.init(photosImageName: "rus_3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionViewCells()
        
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photosGalery.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosGaleryViewCellId", for: indexPath) as! PhotosGaleryCollectionViewCell
    
        // Configure the cell
        cell.setup(with: photosGalery[indexPath.row])
    
        return cell
    }

}

private extension
PhotosGaleryCollectionViewController{
    func registerCollectionViewCells(){
        collectionView.register(PhotosGaleryCollectionViewCell.nib(), forCellWithReuseIdentifier: "PhotosGaleryViewCellId")
    }
    
}
