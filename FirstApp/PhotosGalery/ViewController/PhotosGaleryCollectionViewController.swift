//
//  PhotosGaleryCollectionViewController.swift
//  FirstApp
//
//  Created by Evgeny Konenko on 21.01.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosGaleryCollectionViewController: UICollectionViewController {

    var photosGalery = [UIImage]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionViewCells()
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photosGalery.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosGaleryViewCellId", for: indexPath) as! PhotosGaleryCollectionViewCell
    
        // Configure the cell
        cell.setup(image: self.photosGalery[indexPath.item])
    
        return cell
    }
    
    

}

private extension
PhotosGaleryCollectionViewController{
    func registerCollectionViewCells(){
        collectionView.register(PhotosGaleryCollectionViewCell.nib(), forCellWithReuseIdentifier: "PhotosGaleryViewCellId")
                                        }

    }
   
extension PhotosGaleryCollectionViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let collectionViewWidth = collectionView.bounds.width
            let whiteSpace = CGFloat(1)
            let lineCountCell = CGFloat(2)
            let cellWidth = collectionViewWidth / lineCountCell - whiteSpace
   //         return CGSize(width: cellWidth, height: cellWidth)
            return CGSize(width: cellWidth, height: 220)
        }
    
}
